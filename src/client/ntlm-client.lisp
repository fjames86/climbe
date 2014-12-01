
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
    (setf password-md4 (ntlm:password-md4 password-md4)))
                 
  (let* ((lmowf (ntlm:lmowf-v2 username domain password-md4))
         (ntowf (ntlm:ntowf-v2 username domain password-md4))
         (server-challenge (cdr (assoc :server-challenge challenge)))
         (client-challenge (ntlm:client-challenge))
         (time (cdr (assoc :timestamp (cdr (assoc :target-info challenge)))))
         (target-info-buffer (cdr (assoc :target-info-buffer challenge)))
         (temp (ntlm:make-temp time client-challenge target-info-buffer))
         (lm-response (ntlm:lm-response-v2 lmowf server-challenge client-challenge))
         (nt-response (ntlm:nt-response-v2 ntowf
                                           server-challenge
                                           temp))
         (session-base-key (ntlm:session-base-key-v2 ntowf 
                                                     server-challenge
                                                     temp))
         (key-exchange-key (ntlm:key-exchange-key session-base-key
                                                  lm-response
                                                  server-challenge
                                                  lmowf))
         (exported-session-key (ntlm:exported-session-key :negotiate-key-exch t
                                                          :key-exchange-key key-exchange-key)))
    (ntlm:pack-authenticate-message (cdr (assoc :flags challenge))
                                    :lm-response lm-response
                                    :nt-response nt-response
                                    :domain domain
                                    :username username 
                                    :workstation computer-name
                                    :encrypted-session-key
                                    (ntlm:encrypted-session-key key-exchange-key exported-session-key)
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
                                          (ntlm:pack-negotiate-message '(:NEGOTIATE-UNICODE
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
                                       (generate-reply (ntlm:unpack-challenge-message msg) 
                                                       username domain workstation password-md4 version))))
                 keyword-args)
          (error "No CHALLENGE response")))))

(defun wsman-identity ()
  "<?xml version=\"1.0\" encoding=\"utf-8\" ?>
 <s:Envelope xmlns:s=\"http://www.w3.org/2003/05/soap-envelope\" xmlns:wsmid=\"http://schemas.dmtf.org/wbem/wsman/identity/1/wsmanidentity.xsd\"><s:Header/><s:Body><wsmid:Identify/></s:Body></s:Envelope>
")


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
			    :version (ntlm:make-ntlm-version 1 1 1))
    (declare (ignore ruri stream must-close headers))
;;    (format t "HEADERS: ~S~%" headers)
    (if (= status-code 200)
	(decode-wsman response)
	(error "Failed ~S: ~S" status-code reason))))


(defun call-wsman* (password content &key (username "administrator") (uri "http://localhost:5985/wsman") domain)
  (ntlm-http-request uri
		     (list :method :post 
			   :content content
			   :content-type "application/soap+xml; charset=UTF-8"
			   :want-stream nil)
		     :username username 
		     :domain domain
		     :password-md4 password
		     :version (ntlm:make-ntlm-version 1 1 1)))



;; to setup the wsman server:
;; winrm create winrm/config/listener?Address=IP:127.0.0.1+Transport=HTTP





(defun call-wsman-get-class (&key 
			       (uri *cim-uri*) 
			       (namespace *cim-namespace*) 
			       (username "administrator")
			       (password "")
			       (class-name ""))
  "Get a CIM class from WinRM."
  (first 
   ;; this should always end up being a list of 1 element
   (climbe.decoding::envelope-body 
    (call-wsman password
		(climbe.encoding::encode-wsman-get-class class-name namespace)
		:username username
		:uri uri))))
  

(defun call-wsman-get-instance (&key 
				   (uri *cim-uri*) 
				   (namespace *cim-namespace*) 
				   (username "administrator")
				   (password "")
				   (msg-id "")
				   (op-id "")
				   (class-name "")
				   (seq-id "")
				   (session-id ""))
  "First attempt at getting cim instances from WinRM."
  (call-wsman password
	      (encode-wsman-get-cim-instance uri 
					     namespace
					     class-name
					     msg-id
					     session-id
					     op-id
					     seq-id)
	      :username username
	      :uri uri))

(defun call-wsman-associations (&key 
				   (uri *cim-uri*) 
				   (namespace *cim-namespace*) 
				   (username "administrator")
				   (password "")
				   (msg-id "")
				   (op-id "")
				   (class-name "")
				   (seq-id "")
				   (session-id "")
				  (assoc-class "")
				  (result-class ""))
  "First attempt at getting cim instances from WinRM."
  (call-wsman password
	      (encode-wsman-get-cim-associated-instances namespace
							 uri 
							 op-id
							 msg-id
							 session-id
							 seq-id
							 result-class
							 assoc-class
							 class-name)
	      :username username
	      :uri uri))
