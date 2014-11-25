

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



(defun get-cim-class (namespace message-id &key (url "http://localhost:9899/wsman") (class-name ""))
  (format nil
	  "<s:Envelope xmlns:s=\"http://www.w3.org/2003/05/soap-envelope\" xmlns:a=\"http://schemas.xmlsoap.org/ws/2004/08/addressing\" xmlns:n=\"http://schemas.xmlsoap.org/ws/2004/09/enumeration\" xmlns:w=\"http://schemas.dmtf.org/wbem/wsman/1/wsman.xsd\" xmlns:p=\"http://schemas.microsoft.com/wbem/wsman/1/wsman.xsd\" xmlns:b=\"http://schemas.dmtf.org/wbem/wsman/1/cimbinding.xsd\"><s:Header><a:To>~A</a:To><w:ResourceURI s:mustUnderstand=\"true\">http://schemas.dmtf.org/wbem/cim-xml/2/cim-schema/2/*</w:ResourceURI><a:ReplyTo><a:Address s:mustUnderstand=\"true\">http://schemas.xmlsoap.org/ws/2004/08/addressing/role/anonymous</a:Address></a:ReplyTo><a:Action s:mustUnderstand=\"true\">http://schemas.xmlsoap.org/ws/2004/09/enumeration/Enumerate</a:Action><w:MaxEnvelopeSize s:mustUnderstand=\"true\">512000</w:MaxEnvelopeSize><a:MessageID>~A</a:MessageID><w:Locale xml:lang=\"en-GB\" s:mustUnderstand=\"false\" /><p:DataLocale xml:lang=\"en-GB\" s:mustUnderstand=\"false\" /><p:SessionId s:mustUnderstand=\"false\">uuid:91A8C559-19BC-4A5E-B99F-8A39CF77253E</p:SessionId><p:OperationID s:mustUnderstand=\"false\">uuid:F524DB49-033D-4942-972D-9701919ECF34</p:OperationID><p:SequenceId s:mustUnderstand=\"false\">1</p:SequenceId><w:SelectorSet><w:Selector Name=\"__cimnamespace\">~A</w:Selector><w:Selector Name=\"ClassName\"></w:Selector>~A</w:SelectorSet><w:OptionSet xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"><w:Option Name=\"IncludeInheritanceHierarchy\" Type=\"xs:boolean\">true</w:Option><w:Option Name=\"IncludeInheritedElements\" Type=\"xs:boolean\">true</w:Option><w:Option Name=\"IncludeQualifiers\" Type=\"xs:boolean\">true</w:Option><w:Option Name=\"__MI_CallbackRegistration\" Type=\"xs:int\">11</w:Option><w:Option Name=\"wmiarray:__MI_OPERATIONOPTIONS_CHANNELVALUE\" Type=\"xs:unsignedInt\">0</w:Option><w:Option Name=\"wmiarray:__MI_OPERATIONOPTIONS_CHANNELVALUE\" Type=\"xs:unsignedInt\">1</w:Option><w:Option Name=\"wmiarray:__MI_OPERATIONOPTIONS_CHANNELVALUE\" Type=\"xs:unsignedInt\">2</w:Option><w:Option Name=\"wmi:__MI_OPERATIONOPTIONS_WRITEERRORMODE\" Type=\"xs:unsignedInt\">1</w:Option><w:Option Name=\"msftwinrm:UsePreciseArrays\" Type=\"xs:boolean\">true</w:Option></w:OptionSet><w:OperationTimeout>PT1.000S</w:OperationTimeout></s:Header><s:Body><n:Enumerate><w:OptimizeEnumeration/><w:MaxElements>32000</w:MaxElements></n:Enumerate></s:Body></s:Envelope>"
	  url 
	  message-id
	  namespace
	  class-name))

(defun encode-wsman-get-cim-class (url msg-id op-id namespace class-name seq-id session-id)
  "Generate a get class body. Form reverse engineered from a Get-CimClass powershell call."
  (cl-who:with-html-output-to-string (s)
    (:|s:Envelope| 
      :|xmlns:s| "http://www.w3.org/2003/05/soap-envelope"
      :|xmlns:b| "http://schemas.dmtf.org/wbem/wsman/1/cimbinding.xsd"
      :|xmlns:p| "http://schemas.microsoft.com/wbem/wsman/1/wsman.xsd"
      :|xmlns:w| "http://schemas.dmtf.org/wbem/wsman/1/wsman.xsd"
      :|xmlns:n| "http://schemas.xmlsoap.org/ws/2004/09/enumeration"
      :|xmlns:a| "http://schemas.xmlsoap.org/ws/2004/08/addressing"
      (:|s:Header| 
	(:|a:To| (princ url s))
	(:|p:ResourceURI| :|s:mustUnderstand| "true" 
	  "http://schemas.dmtf.org/wbem/cim-xml/2/cim-schema/2/*")
	(:|a:ReplyTo|
	  (:|a:Address| :|s:mustUnderstand| "true"
	    "http://schemas.xmlsoap.org/ws/2004/08/addressing/role/anonymous"))
	(:|a:Action| :|s:mustUnderstand| "true"
	  "http://schemas.xmlsoap.org/ws/2004/09/enumeration/Enumerate")
	(:|p:MaxEnvelopeSize| :|s:mustUnderstand| "true"
	  "512000")
	(:|a:MessageID| (princ msg-id s))
	(:|p:Locale| :|s:mustUnderstand| "true" :|xml:lang| "en-GB")
	(:|p:DataLocale| :|s:mustUnderstand| "false"
	  :|xml:lang| "en-GB")
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
	  (:|p:Option| :|Type| "xs:boolean" :|Name| "IncludeInheritanceHierarchy" "true")
	  (:|p:Option| :|Type| "xs:boolean" :|Name| "IncludeInheritedElements" "true")
	  (:|p:Option| :|Type| "xs:boolean" :|Name| "IncludeQualifiers" "true")
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
	  (:|p:MaxElements| "32000")))))
  nil)
