
(in-package #:climbe.client)

;; In order to talk to WinRM we need a http client that supports at least Negotiate authentication
;; (Prefereably we'd have kerberos but at the moment we don't).
;;

(defun b64-usb8 (string)
  (cl-base64:base64-string-to-usb8-array string))

(defun usb8-b64 (usb8)
  (cl-base64:usb8-array-to-base64-string usb8))

(defun authorization-header (msg)
  "Format an AUTHORIZATION http header"
  (format nil "Negotiate ~A" (cl-base64:usb8-array-to-base64-string msg)))

(defun authorization-msg (auth-header)  
  "Extract the binary message from the AUTHORIZATION header"
  (let ((matches (nth-value 1 (cl-ppcre:scan-to-strings "Negotiate ([\\w=\\+/]+)" auth-header))))
    (when (and matches (> (length matches) 0))
      (b64-usb8 (elt matches 0)))))


;; http://msdn.microsoft.com/en-us/library/cc236676.aspx
(defun generate-reply (challenge username domain computer-name password-md4 version)
  "Generate an AUTHENTICATE message from the challenge"
  (when (stringp password-md4)
    (setf password-md4 (ntlm::password-md4 password-md4)))
                 
  (let* ((lmowf (ntlm::lmowf-v2 username domain password-md4))
         (ntowf (ntlm::ntowf-v2 username domain password-md4))
         (server-challenge (cdr (assoc :server-challenge challenge)))
         (client-challenge (ntlm::client-challenge))
         (time (cdr (assoc :timestamp (cdr (assoc :target-info challenge)))))
         (target-info-buffer (cdr (assoc :target-info-buffer challenge)))
         (temp (ntlm::make-temp time client-challenge target-info-buffer))
         (lm-response (ntlm::lm-response-v2 lmowf server-challenge client-challenge))
         (nt-response (ntlm::nt-response-v2 ntowf
                                           server-challenge
                                           temp))
         (session-base-key (ntlm::session-base-key-v2 ntowf 
                                                     server-challenge
                                                     temp))
         (key-exchange-key (ntlm::key-exchange-key session-base-key
                                                  lm-response
                                                  server-challenge
                                                  lmowf))
         (exported-session-key (ntlm::exported-session-key :negotiate-key-exch t
                                                          :key-exchange-key key-exchange-key)))
    (ntlm::pack-authenticate-message (cdr (assoc :flags challenge))
                                    :lm-response lm-response
                                    :nt-response nt-response
                                    :domain domain
                                    :username username 
                                    :workstation computer-name
                                    :encrypted-session-key
                                    (ntlm::encrypted-session-key key-exchange-key exported-session-key)
                                    :version version)))

(defun ntlm-http-request (uri keyword-args &key username domain password-md4 workstation version)
  "Perform an HTTP request with NTLM authentication"
  (multiple-value-bind (content status-code headers ruri stream must-close reason)
      (apply #'drakma:http-request 
             uri
             :close nil
             :keep-alive t
             :additional-headers 
             `((:authorization . ,(authorization-header 
                                   (let ((msg 
                                          (ntlm::pack-negotiate-message '(:NEGOTIATE-UNICODE
                                                                         :NEGOTIATE-OEM :REQUEST-TARGET
                                                                         :NEGOTIATE-NTLM
                                                                         :NEGOTIATE-OEM-DOMAIN-SUPPLIED
                                                                         :NEGOTIATE-OEM-WORKSTATION-SUPPLIED
                                                                         :NEGOTIATE-ALWAYS-SIGN
                                                                         :NEGOTIATE-EXTENDED-SESSIONSECURITY
                                                                         :NEGOTIATE-VERSION :NEGOTIATE-128
                                                                         :NEGOTIATE-56) 
                                                                       :workstation workstation
                                                                       :domain domain
                                                                       :version version)))
;;                                     (packet:hd msg)
;;                                     (format t "NEGOTIATE: ~S~%" (ntlm:unpack-negotiate-message msg))
                                     msg))))

             keyword-args)
    (declare (ignore content status-code ruri must-close reason))
;;    (format t "[~D] headers: ~S~%" status-code headers)
;;    (packet:hd content)
    (let ((msg (authorization-msg (cdr (assoc :www-authenticate headers)))))
;;      (packet:hd msg)
      (if msg
          (apply #'drakma:http-request 
                 uri 
                 :stream stream
                 :additional-headers 
                 `((:authorization . ,(authorization-header
                                       (generate-reply (ntlm::unpack-challenge-message msg) 
                                                       username domain workstation password-md4 version))))
                 keyword-args)
          (error "No CHALLENGE response")))))

;; ---------------------------

;; to setup the wsman server:
;; winrm create winrm/config/listener?Address=IP:127.0.0.1+Transport=HTTP




(defun call-wsman (password content &key (username "administrator") (uri "http://localhost:5985/wsman") domain)
  "Returns a decoded envelope structure.

NOTE: you MUST have the WinRm HTTP listener running and accepting Unencrypted traffic for this to work.
WinRM is by default setup in a non-functioning state: it has only an HTTP listener but has AllowUnencrypted=false.

Ensure you have an HTTP listener using: winrm qc
Ensure it accepts connections: winrm set winrm/config/service @{AllowUnencrypted=\"true\"}
"
  (multiple-value-bind (response status-code headers ruri stream must-close reason)
	 (ntlm-http-request uri
			    (list :method :post 
				  :content content
				  :content-type "application/soap+xml; charset=UTF-8"
				  :want-stream t)
			    :username username 
			    :domain domain
			    :password-md4 password
			    :version (ntlm::make-ntlm-version 1 1 1))
    (declare (ignore ruri stream must-close headers))
;;    (format t "HEADERS: ~S~%" headers)
    (if (= status-code 200)
	(decode-wsman response)
	(error "Failed ~S: ~S" status-code reason))))


(defun call-wsman% (password content &key (username "administrator") (url "http://localhost:5985/wsman") domain)
  (ntlm:logon-user username password domain)
  (let ((creds (gss:acquire-credentials :ntlm nil)))
    (multiple-value-bind (context buffer) (gss:initialize-security-context creds)
      ;; start by sending a regular request 
      (multiple-value-bind (response status-code headers ruri stream must-close reason)
          (drakma:http-request url
                               :additional-headers 
                               `((:authorization . ,(format nil 
                                                            "NTLM ~A" 
                                                            (cl-base64:usb8-array-to-base64-string buffer))))
                               :keep-alive t 
                               :close nil)
        (declare (ignore ruri must-close))
        (case status-code
          (200 (decode-wsman response))
          (401 
	   ;; extract the WWW-AUTHENTICATE header
	   (let ((www (cdr (assoc :www-authenticate headers))))
	     (unless www (error "No WWW-AUTHENTICATE header"))
	     ;; get the buffer from the base64 encoded string 
	     (let ((matches (nth-value 1 (cl-ppcre:scan-to-strings "NTLM ([\\w=\\+/]+)" www))))
	       (unless matches (error "Not an NTLM authenticate message"))
	       (multiple-value-bind (context buffer)                        
		   (gss:initialize-security-context context
						    :buffer 
						    (cl-base64:base64-string-to-usb8-array (elt matches 0)))
		 (declare (ignore context))
		 (multiple-value-bind (response status-code headers ruri stream must-close reason)
		     (drakma:http-request url
					  :additional-headers 
					  `((:authorization . ,(format nil "NTLM ~A"
								       (cl-base64:usb8-array-to-base64-string buffer))))
					  :stream stream
					  :method :post 
					  :content content
					  :content-type "application/soap+xml; charset=UTF-8")
		   (declare (ignore must-close ruri headers response))
		   (case status-code 
		     (200 (decode-wsman stream))
		     (otherwise (error "FAILED ~A ~A~%" status-code reason))))))))
          (otherwise (error "FAILED: ~A~%" reason)))))))


(defun spnego-http-request (principal &optional (url "http://localhost:2001/"))
  (let ((creds (gss:acquire-credentials :spnego principal)))
    (multiple-value-bind (init-context buffer) (gss:initialize-security-context creds)
      (multiple-value-bind (content status-code headers ruri stream must-close reason)
          (drakma:http-request url
                               :additional-headers 
                               `((:authorization . ,(format nil 
                                                            "Negotiate ~A" 
                                                            (cl-base64:usb8-array-to-base64-string buffer))))
                               :keep-alive t 
                               :close nil)
        (declare (ignore ruri must-close))
        (case status-code
          (200 content)
          (401 
	   ;; extract the WWW-AUTHENTICATE header
	   (let ((www (cdr (assoc :www-authenticate headers))))
	     (unless www (error "No WWW-AUTHENTICATE header"))
	     ;; get the buffer from the base64 encoded string 
	     (let ((matches (nth-value 1 (cl-ppcre:scan-to-strings "Negotiate ([\\w=\\+/]+)" www))))
	       (unless matches (error "Not a Negotiate header"))
	       (multiple-value-bind (context buffer)                        
		   (gss:initialize-security-context init-context
						    :buffer 
						    (cl-base64:base64-string-to-usb8-array (elt matches 0)))
		 (declare (ignore context))
		 (multiple-value-bind (content status-code headers ruri stream must-close reason)
		     (drakma:http-request url
					  :additional-headers 
					  `((:authorization . ,(format nil "Negotiate ~A"
								       (cl-base64:usb8-array-to-base64-string buffer))))
					  :stream stream)
		   (declare (ignore must-close ruri stream headers))
		   (case status-code 
		     (200 content)
		     (otherwise (error "FAILED ~A ~A~%" status-code reason))))))))
          (otherwise (error "FAILED ~A: ~A~%" status-code reason)))))))








(defun call-wsman* (password content &key (username "administrator") (uri "http://localhost:5985/wsman") domain)
  (ntlm-http-request uri
		     (list :method :post 
			   :content content
			   :content-type "application/soap+xml; charset=UTF-8"
			   :want-stream nil)
		     :username username 
		     :domain domain
		     :password-md4 password
		     :version (ntlm::make-ntlm-version 1 1 1)))



