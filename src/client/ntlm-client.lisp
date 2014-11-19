
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

;; exmaple content from msdn 
(defun wsman-logical-disk ()
  "<?xml version=\"1.0\" encoding=\"utf-8\" ?>
<s:Envelope xmlns:s=\"http://www.w3.org/2003/05/soap-envelope\" 
            xmlns:a=\"http://schemas.xmlsoap.org/ws/2004/08/addressing\" 
            xmlns:w=\"http://schemas.dmtf.org/wbem/wsman/1/wsman.xsd\">
  <s:Header>
    <a:To>http://RemoteComputer:80/wsman</a:To> 
    <w:ResourceURI s:mustUnderstand=\"true\">
      http://schemas.microsoft.com/wbem/wsman/1/wmi/root/cimv2/Win32_logicaldisk
    </w:ResourceURI> 
    <a:ReplyTo>
    <a:Address s:mustUnderstand=\"true\">
      http://schemas.xmlsoap.org/ws/2004/08/addressing/role/anonymous
    </a:Address> 
    </a:ReplyTo>
    <a:Action s:mustUnderstand=\"true\">
      http://schemas.xmlsoap.org/ws/2004/09/transfer/Get
    </a:Action> 
    <w:MaxEnvelopeSize s:mustUnderstand=\"true\">153600</w:MaxEnvelopeSize> 
    <a:MessageID>uuid:4ED2993C-4339-4E99-81FC-C2FD3812781A</a:MessageID> 
    <w:Locale xml:lang=\"en-US\" s:mustUnderstand=\"false\"/> 
    <w:SelectorSet>
    <w:Selector Name=\"DeviceId\">c:</w:Selector> 
    </w:SelectorSet>
    <w:OperationTimeout>PT60.000S</w:OperationTimeout> 
  </s:Header>
  <s:Body/> 
</s:Envelope>")

(defun call-wsman (password content &key (username "administrator") (host "127.0.0.1"))
  "NOTE: you MUST have the WinRm HTTP listener running and accepting Unencrypted traffic for this to work.

Do this by running: winrm set winrm/config/service @{AllowUnencrypted=\"true\"}

WinRM is by default setup in a non-functioning state: it has only an HTTP listener but has AllowUnencrypted=false.

Returns a decoded envelope structure."
  (decode-wsman
   (ntlm-http-request (format nil "http://~A:5985/wsman" host) 
                      (list :method :post 
                            :content content
                            :content-type "application/soap+xml; charset=UTF-8"
                            :want-stream t)
                      :username username 
                      :password-md4 password
                      :version (ntlm:make-ntlm-version 1 1 1))))


