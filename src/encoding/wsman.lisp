

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

;; read this
;; http://msdn.microsoft.com/en-us/library/cc251709.aspx
;; http://www.dmtf.org/sites/default/files/standards/documents/DSP0227_1.0.0.pdf


(defun encode-wsman-get-class ()
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
		 "http://schemas.microsoft.com/wbem/wsman/1/wmi/root/cimv2/*")
		(:|a:ReplyTo|
		  (:|a:Address| :|s:mustUnderstand| "true"
			"http://schemas.xmlsoap.org/ws/2004/08/addressing/role/anonymous"))
		(:|a:Action| :|s:mustUnderstand| "true"
		  "http://schemas.xmlsoap.org/ws/2004/09/enumeration/Enumerate")
		(:|w:MaxEnvelopeSize| :|s:mustUnderstand| "true" "153600")
		(:|a:MessageID| (princ (gen-id) s))
		(:|w:Locale| :|xml:lang| "en-US" :|s:mustUnderstand| "false")
		(:|w:OperationTimeout| "PT60.000S"))
      (:|s:Body|))))














(defun encode-wsman-get-instance (class-name name value)
  "Basic exmaple of how we might go about encoding the messages. Uses CL-WHO."
  (cl-who:with-html-output-to-string (s)
    "<?xml version=\"1.0\" encoding=\"utf-8\" ?>"
    (terpri s)
	(:|s:Envelope| :|xmlns:s| +soap-envelope+
	               :|xmlns:a| +soap-addressing+
		       :|xmlns:w| +soap-wsman+
	  (:|s:Header|
		(:|a:To| "http://127.0.0.1:5985/wsman")
		(:|w:ResourceURI| :|s:mustUnderstand| "true"
		 (format s 
			 "http://schemas.microsoft.com/wbem/wsman/1/wmi/root/cimv2/~A"
			 class-name))
		(:|a:ReplyTo|
		  (:|a:Address| :|s:mustUnderstand| "true"
			"http://schemas.xmlsoap.org/ws/2004/08/addressing/role/anonymous"))
		(:|a:Action| :|s:mustUnderstand| "true"
		  "http://schemas.xmlsoap.org/ws/2004/09/transfer/Get")
		(:|w:MaxEnvelopeSize| :|s:mustUnderstand| "true" "153600")
		(:|a:MessageID| "uuid:4ED2993C-4339-4E99-81FC-C2FD3812781A")
		(:|w:Locale| :|xml:lang| "en-US" :|s:mustUnderstand| "false")
		(:|w:SelectorSet|
		  (:|w:Selector| :|Name| name (princ value s)))
		(:|w:OperationTimeout| "PT60.000S"))
      (:|s:Body|))))



(defun encode-wsman-get-cim-class (&key url msg-id op-id namespace class-name seq-id session-id)
  "Generate a get class body. Form reverse engineered from a Get-CimClass powershell call."
  (let ((msg-id (or msg-id (gen-id)))
	(op-id (or op-id (gen-id)))
	(seq-id (or seq-id "1"))
	(session-id (or session-id (gen-id)))
	(class-name (or class-name ""))
	(url (or url "http://127.0.0.1:5985/wsman"))
	(namespace (or namespace "root/cimv2")))
    (cl-who:with-html-output-to-string (s)
    "<?xml version=\"1.0\" encoding=\"utf-8\" ?>"
    (terpri s)
      (:|s:Envelope| 
	:|xmlns:s| "http://www.w3.org/2003/05/soap-envelope"
	:|xmlns:a| "http://schemas.xmlsoap.org/ws/2004/08/addressing"
	:|xmlns:n| "http://schemas.xmlsoap.org/ws/2004/09/enumeration"
	:|xmlns:w| "http://schemas.dmtf.org/wbem/wsman/1/wsman.xsd"
	:|xmlns:p| "http://schemas.microsoft.com/wbem/wsman/1/wsman.xsd"
	:|xmlns:b| "http://schemas.dmtf.org/wbem/wsman/1/cimbinding.xsd"
	(:|s:Header| 
	  (:|a:To| (princ url s))
	  (:|p:ResourceURI| :|s:mustUnderstand| "true" 
	    "http://schemas.dmtf.org/wbem/cim-xml/2/cim-schema/2/*")
	  (:|a:ReplyTo|
	    (:|a:Address| :|s:mustUnderstand| "true"
	      "http://schemas.xmlsoap.org/ws/2004/08/addressing/role/anonymous"))
	  (:|a:Action| :|s:mustUnderstand| "true"
	    "http://schemas.xmlsoap.org/ws/2004/09/enumeration/Enumerate")
	  (:|w:MaxEnvelopeSize| :|s:mustUnderstand| "true"
	    "512000")
	  (:|a:MessageID| (princ msg-id s))
	  (:|p:Locale| :|xml:lang| "en-GB" :|s:mustUnderstand| "false" )
	  (:|p:DataLocale| :|xml:lang| "en-GB" :|s:mustUnderstand| "false")
	  (:|p:SessionId| :|s:mustUnderstand| "false" 
	    (princ session-id s))
	  (:|p:OperationID| :|s:mustUnderstand| "false"
	    (princ op-id s))
	  (:|p:SequenceId| :|s:mustUnderstand| "false"
	    (princ seq-id s))
	  (:|p:SelectorSet|
	    (:|p:Selector| :|Name| "__cimnamespace" (princ namespace s))
	    (:|p:Selector| :|Name| "ClassName" (princ class-name s)))
	  (:|p:OptionSet| :|xmlns:xsi| "http://www.w3.org/2001/XMLSchema-instance"
	    (:|p:Option| :|Name| "IncludeInheritanceHierarchy" :|Type| "xs:boolean" "true")
	    (:|p:Option| :|Name| "IncludeInheritedElements" :|Type| "xs:boolean" "true")
	    (:|p:Option| :|Name| "IncludeQualifiers" :|Type| "xs:boolean" "true")
	    (:|p:Option| :|Name| "__MI_CallbackRegistration" :|Type| "xs:int" "11")
	    (:|p:Option| :|Name| "wmiarray:__MI_OPERATIONOPTIONS_CHANNELVALUE" :|Type| "xs:unsignedInt" "0")
	    (:|p:Option| :|Name| "wmiarray:__MI_OPERATIONOPTIONS_CHANNELVALUE" :|Type| "xs:unsignedInt" "1")
	    (:|p:Option| :|Name| "wmiarray:__MI_OPERATIONOPTIONS_CHANNELVALUE" :|Type| "xs:unsignedInt" "2")
	    (:|p:Option| :|Name| "wmi:__MI_OPERATIONOPTIONS_WRITEERRORMODE" :|Type| "xs:unsignedInt" "1")
	    (:|p:Option| :|Name| "msftwinrm:UsePreciseArrays" :|Type| "xs:boolean" "true"))
	  (:|p:OperationTimeout| "PT60.000S"))
	(:|s:Body|
	  (:|n:Enumerate|
	    (:|p:OptimizeEnumeration|)
	    (:|p:MaxElements| "32000")))))))



(defun encode-wsman-get-cim-instance (uri namespace class-name msg-id session-id op-id seq-id)
  (let ((msg-id (or msg-id (gen-id)))
	(session-id (or session-id (gen-id)))
	(op-id (or op-id (gen-id)))
	(seq-id (or seq-id "1")))
    (cl-who:with-html-output-to-string (s)
    "<?xml version=\"1.0\" encoding=\"utf-8\" ?>"
    (terpri s)
      (:|s:Envelope| 
	:|xmlns:b| "http://schemas.dmtf.org/wbem/wsman/1/cimbinding.xsd"
	:|xmlns:p| "http://schemas.microsoft.com/wbem/wsman/1/wsman.xsd"
	:|xmlns:w| "http://schemas.dmtf.org/wbem/wsman/1/wsman.xsd"
	:|xmlns:n| "http://schemas.xmlsoap.org/ws/2004/09/enumeration"
	:|xmlns:a| "http://schemas.xmlsoap.org/ws/2004/08/addressing"
	:|xmlns:s| "http://www.w3.org/2003/05/soap-envelope"
	(:|s:Header| 
	  (:|a:To| (princ uri s))
	  (:|p:ResourceURI| :|s:mustUnderstand| "true"
	    (format s "http://schemas.dmtf.org/wbem/wscim/1/cim-schema/2/~A" class-name))
	  (:|a:ReplyTo|
	    (:|a:Address| :|s:mustUnderstand| "true"
	      "http://schemas.xmlsoap.org/ws/2004/08/addressing/role/anonymous"))
	  (:|a:Action| :|s:mustUnderstand| "true"
	    "http://schemas.xmlsoap.org/ws/2004/09/enumeration/Enumerate")
	  (:|w:MaxEnvelopeSize| :|s:mustUnderstand| "true"
	    "512000")
	  (:|a:MessageID| (princ msg-id s))
	  (:|p:Locale| :|s:mustUnderstand| "false"
	    :|xml:lang| "en-GB")
	  (:|p:DataLocale| :|s:mustUnderstand| "false" :|xml:lang| "en-GB")
	  (:|p:SessionId| :|s:mustUnderstand| "false" (princ session-id s))
	  (:|p:OperationID| :|s:mustUnderstand| "false" (princ op-id s))
	  (:|p:SequenceId| :|s:mustUnderstand| "false"
	    (princ seq-id s))
	  (:|p:SelectorSet|
	    (:|p:Selector| :|Name| "__cimnamespace" (princ namespace s)))
	  (:|p:OptionSet|
	    :|xmlns:xsi| "http://www.w3.org/2001/XMLSchema-instance"
	    (:|p:Option| :|Type| "xs:int" :|Name| "__MI_CallbackRegistration" "11")
	    (:|p:Option| :|Type| "xs:unsignedInt" :|Name| "wmiarray:__MI_OPERATIONOPTIONS_CHANNELVALUE" "0")
	    (:|p:Option| :|Type| "xs:unsignedInt" :|Name| "wmiarray:__MI_OPERATIONOPTIONS_CHANNELVALUE" "1")
	    (:|p:Option| :|Type| "xs:unsignedInt" :|Name| "wmiarray:__MI_OPERATIONOPTIONS_CHANNELVALUE" "2")
	    (:|p:Option| :|Type| "xs:unsignedInt" :|Name| "wmi:__MI_OPERATIONOPTIONS_WRITEERRORMODE" "1")
	    (:|p:Option| :|Type| "xs:boolean" :|Name| "msftwinrm:UsePreciseArrays" "true"))
	  (:|p:OperationTimeout| "PT1.000S"))
	(:|s:Body|
	  (:|n:Enumerate|
	    (:|p:OptimizeEnumeration|)
	    (:|p:MaxElements| "32000")
	    (:|p:EnumerationMode| "EnumerateObjectAndEPR")))))))



(defun encode-wsman-get-cim-associated-instances (namespace uri op-id msg-id session-id seq-id result-class assoc-class class-name)
  (let ((op-id (or op-id (gen-id)))
	(msg-id (or msg-id (gen-id)))
	(session-id (or session-id (gen-id)))
	(seq-id (or seq-id "1")))
    (cl-who:with-html-output-to-string (s)
    "<?xml version=\"1.0\" encoding=\"utf-8\" ?>"
    (terpri s)
      (:|s:Envelope| 
	:|xmlns:b| "http://schemas.dmtf.org/wbem/wsman/1/cimbinding.xsd"
	:|xmlns:p| "http://schemas.microsoft.com/wbem/wsman/1/wsman.xsd"
	:|xmlns:w| "http://schemas.dmtf.org/wbem/wsman/1/wsman.xsd"
	:|xmlns:n| "http://schemas.xmlsoap.org/ws/2004/09/enumeration"
	:|xmlns:a| "http://schemas.xmlsoap.org/ws/2004/08/addressing"
	:|xmlns:s| "http://www.w3.org/2003/05/soap-envelope"
	(:|s:Header| 
	  (:|a:To| (princ uri s))
	  (:|p:ResourceURI| :|s:mustUnderstand| "true"
	    (format s "http://schemas.dmtf.org/wbem/wscim/1/cim-schema/2/~A" class-name))
	  (:|a:ReplyTo|
	    (:|a:Address| :|s:mustUnderstand| "true"
	      "http://schemas.xmlsoap.org/ws/2004/08/addressing/role/anonymous"))
	  (:|a:Action| :|s:mustUnderstand| "true"
	    "http://schemas.xmlsoap.org/ws/2004/09/enumeration/Enumerate")
	  (:|w:MaxEnvelopeSize| :|s:mustUnderstand| "true"
	    "512000")
	  (:|a:MessageID| (princ msg-id s))
	  (:|p:Locale| :|s:mustUnderstand| "false"
	    :|xml:lang| "en-GB")
	  (:|p:DataLocale| :|s:mustUnderstand| "false" :|xml:lang| "en-GB")
	  (:|p:SessionId| :|s:mustUnderstand| "false" (princ session-id s))
	  (:|p:OperationID| :|s:mustUnderstand| "false" (princ op-id s))
	  (:|p:SequenceId| :|s:mustUnderstand| "false"
	    (princ seq-id s))
	  (:|p:SelectorSet|
	    (:|p:Selector| :|Name| "__cimnamespace" (princ namespace s)))
	  (:|p:OptionSet|
	    :|xmlns:xsi| "http://www.w3.org/2001/XMLSchema-instance"
	    (:|p:Option| :|Name| "__MI_CallbackRegistration" :|Type| "xs:int" "11")
	    (:|p:Option| :|Name| "wmiarray:__MI_OPERATIONOPTIONS_CHANNELVALUE" :|Type| "xs:unsignedInt" "0")
	    (:|p:Option| :|Name| "wmiarray:__MI_OPERATIONOPTIONS_CHANNELVALUE" :|Type| "xs:unsignedInt" "1")
	    (:|p:Option| :|Name| "wmiarray:__MI_OPERATIONOPTIONS_CHANNELVALUE" :|Type| "xs:unsignedInt" "2")
	    (:|p:Option| :|Name| "wmi:__MI_OPERATIONOPTIONS_WRITEERRORMODE" :|Type| "xs:unsignedInt" "1")
	    (:|p:Option| :|Name| "msftwinrm:UsePreciseArrays" :|Type| "xs:boolean" "true"))
	  (:|p:OperationTimeout| "P60.000S"))
	(:|s:Body|
	  (:|n:Enumerate|
	    (:|p:OptimizeEnumeration|)
	    (:|p:MaxElements| "32000")
	    (:|p:EnumerationMode| "EnumerateObjectAndEPR")
	    (:|p:Filter| :|Dialect| "http://schemas.dmtf.org/wbem/wsman/1/cimbinding/associationFilter"
	      (:|b:AssociatedInstances| 
		(:|b:Object| 
		  (:|a:Address| "http://schemas.xmlsoap.org/ws/2004/08/addressing/role/anonymous")
		  (:|a:ReferenceParameters|
		    (:|w:ResourceURI| (format s "http://schemas.dmtf.org/wbem/wscim/1/cim-schema/2/~A" namespace))
		    (:|w:SelectorSet| 
		      (:|w:Selector| :|Name| "__cimnamespace" (princ class-name s)))))
		(:|b:AssociationClassName| (princ assoc-class s))
		(:|b:ResultClassName| (princ result-class s))))))))))



(defun gen-id ()
  (flet ((digits (n)
	   (loop for i below n collect 
		(random 16))))
    (format nil "uuid:~{~X~}-~{~X~}-~{~X~}-~{~X~}-~{~X~}"
	    (digits 8)
	    (digits 4)
	    (digits 4)
	    (digits 4)
	    (digits 12))))






