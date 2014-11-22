

(in-package #:climbe.encoding)

;; read this document for more information
;; http://www.dmtf.org/sites/default/files/standards/documents/DSP0227_1.2.0.pdf
;; http://www.w3.org/Submission/WS-Transfer/



(defconstant* +soap-envelope+ "http://www.w3.org/2003/05/soap-envelope")
(defconstant* +soap-addressing+ "http://schemas.xmlsoap.org/ws/2004/08/addressing")
(defconstant* +soap-wsman+ "http://schemas.dmtf.org/wbem/wsman/1/wsman.xsd")
(defconstant* +soap-event+ "http://schemas.xmlsoap.org/ws/2004/09/eventing")

;; set some cl-who options
(eval-when (:compile-toplevel :load-toplevel :execute)
  (setf cl-who:*downcase-tokens-p* nil)
  (setf cl-who:*attribute-quote-char* #\"))



(defconstant* +wsman-enumerate+ "http://schemas.xmlsoap.org/ws/2004/09/enumeration/Enumerate")
(defconstant* +wsman-enumerate-response+ "http://schemas.xmlsoap.org/ws/2004/09/enumeration/EnumerateResponse")

(defconstant* +wsman-get+ "http://schemas.xmlsoap.org/ws/2004/09/transfer/Get")
(defconstant* +wsman-get-response+ "http://schemas.xmlsoap.org/ws/2004/09/transfer/GetResponse")

(defconstant* +wsman-subscribe+ "http://schemas.xmlsoap.org/ws/2004/08/eventing/Subscribe")

(defconstant* +wsman-pull-response+ "http://schemas.xmlsoap.org/ws/2004/09/enumeration/PullResponse")

(defconstant* +wsman-put+ "http://schemas.xmlsoap.org/ws/2004/09/transfer/Put")
(defconstant* +wsman-put-response+ "http://schemas.xmlsoap.org/ws/2004/09/transfer/PutResponse")

(defconstant* +wsman-delete+ "http://schemas.xmlsoap.org/ws/2004/09/transfer/Delete")
(defconstant* +wsman-delete-response+ "http://schemas.xmlsoap.org/ws/2004/09/transfer/DeleteResponse")

(defconstant* +wsman-create+ "http://schemas.xmlsoap.org/ws/2004/09/transfer/Create")
(defconstant* +wsman-create-response+ "http://schemas.xmlsoap.org/ws/2004/09/transfer/CreateResponse")




(defun encode-logical-disk ()
  "Basic exmaple of how we might go about encoding the messages. Uses CL-WHO."
  (cl-who:with-html-output-to-string (s)
    "<?xml version=\"1.0\" encoding=\"utf-8\" ?>"
    (terpri s)
	(:|s:Envelope| :|xmlns:s| +soap-envelope+
	               :|xmlns:a| +soap-addressing+
		       :|xmlns:w| +soap-wsman+
	  (:|s:Header|
		(:|a:To| "http://hyperb.angelo.exsequi.com:5985/wsman")
		(:|w:ResourceURI| :|s:mustUnderstand| "true"
		 "http://schemas.microsoft.com/wbem/wsman/1/wmi/root/cimv2/Win32_logicaldisk")
		(:|a:ReplyTo|
		  (:|a:Address| :|s:mustUnderstand| "true"
			"http://schemas.xmlsoap.org/ws/2004/08/addressing/role/anonymous"))
		(:|a:Action| :|s:mustUnderstand| "true"
		  "http://schemas.xmlsoap.org/ws/2004/09/transfer/Get")
		(:|w:MaxEnvelopeSize| :|s:mustUnderstand| "true" "153600")
		(:|a:MessageID| "uuid:4ED2993C-4339-4E99-81FC-C2FD3812781A")
		(:|w:Locale| :|xml:lang| "en-US" :|s:mustUnderstand| "false")
		(:|w:SelectorSet|
		  (:|w:Selector| :|Name| "DeviceId" "c:"))
		(:|w:OperationTimeout| "PT60.000S"))
      (:|s:Body|))))


(defun encode-call (class-name action)
  "Basic exmaple of how we might go about encoding the messages. Uses CL-WHO."
  (cl-who:with-html-output-to-string (s)
    "<?xml version=\"1.0\" encoding=\"utf-8\" ?>"
    (terpri s)
	(:|s:Envelope| :|xmlns:s| +soap-envelope+
	               :|xmlns:a| +soap-addressing+
		       :|xmlns:w| +soap-wsman+
		       :|xmlns:wsen| "http://schemas.xmlsoap.org/ws/2004/09/enumeration"
	  (:|s:Header|
		(:|a:To| "http://hyperb.angelo.exsequi.com:5985/wsman")
		(:|w:ResourceURI| :|s:mustUnderstand| "true" 
          (format s "http://schemas.microsoft.com/wbem/wsman/1/wmi/root/cimv2/~A" class-name))
		(:|a:ReplyTo|
		  (:|a:Address| :|s:mustUnderstand| "true"
			"http://schemas.xmlsoap.org/ws/2004/08/addressing/role/anonymous"))
		(:|a:Action| :|s:mustUnderstand| "true"
          (format s "~A"
                  (ecase action
                    (:get +wsman-get+) 
                    (:enumerate +wsman-enumerate+))))
		(:|w:MaxEnvelopeSize| :|s:mustUnderstand| "true" "153600")
		(:|a:MessageID| "uuid:4ED2993C-4339-4E99-81FC-C2FD3812781A")
		(:|w:Locale| :|xml:lang| "en-US" :|s:mustUnderstand| "false")
		(:|w:SelectorSet|
		  (:|w:Selector| :|Name| "DeviceId" "c:"))
		(:|w:OperationTimeout| "PT60.000S"))
      (:|s:Body|
	(case action
	  (:enumerate (encode-wsman-enumerate s)))))))


(defun encode-wsman-enumerate (stream)
  (cl-who:with-html-output (s stream)
    (:|wsen:Enumerate| 
;;      (:|wsen:EndTo| "P0Y0M0DT0H0M0S")
      (:|wsen:Expires| "PT60.000S")
;;      (:|wsen:Filter| :|Dialect| "s:anyURI" "s:Any")
      )))

(defun wsman-sample-enumerate ()
 "<s:Envelope xmlns:s=\"http://www.w3.org/2003/05/soap-envelope\"
             xmlns:wsa=\"http://schemas.xmlsoap.org/ws/2004/08/addressing\"
             xmlns:wsen=\"http://schemas.xmlsoap.org/ws/2004/09/enumeration\"> 
   <s:Header> 
     <wsa:Action> 
       http://schemas.xmlsoap.org/ws/2004/09/enumeration/Enumerate 
     </wsa:Action> 
     <wsa:MessageID> 
       uuid:e7c5726b-de29-4313-b4d4-b3425b200839 
     </wsa:MessageID> 
     <wsa:To>http://hyperb.angelo.exsequi.com:5985/wsman</wsa:To> 
     <wsa:ReplyTo> 
       <wsa:Address> 
         http://schemas.xmlsoap.org/ws/2004/08/addressing/role/anonymous 
       </wsa:Address> 
     </wsa:ReplyTo> 
     <wsa:ResourceURI s:mustUnderstand=\"true\">
       http://schemas.microsoft.com/wbem/wsman/1/wmi/root/cimv2/Win32_LogicalDisk
     </wsa:ResourceURI>
   </s:Header> 
   <s:Body> 
     <wsen:Enumerate> 
       <wsen:Expires> PT10M </wsen:Expires> 
     </wsen:Enumerate> 
   </s:Body> 
  </s:Envelope>")



;; encoding structure 
			
(defparameter *wsman-stream* *standard-output*)

(defun wformat (format-string &rest args)
  (apply #'format *wsman-stream* format-string args))

(defun encode-wsman-envelope (header body)
  (wformat "<s:Envelope xmlns:s=\"~A\" xmlns:a=\"~A\" xmlns:w=\"~A\">"
		   +soap-envelope+ +soap-addressing+ +soap-wsman+)
  (encode-wsman-header header)
  (encode-wsman-body body)
  (wformat "</s:Envelope>"))

(defun encode-wsman-header (list)
  (wformat "<s:Header>")
  (dolist (h list)
	(destructuring-bind (name attributes content) h
	  (wformat "<~A" name)
	  (dolist (a attributes)
		(destructuring-bind (aname aval) a
		  (wformat " ~A=~A" aname aval)))
	  (wformat ">")
	  (wformat "~A" content)
	  (wformat "</~A>" name)))
  (wformat "</s:Header>"))

(defun encode-wsman-body (body)
  (wformat "<s:Body>~A</s:Body>" body))

