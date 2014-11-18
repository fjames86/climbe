

(in-package #:climbe.encoding)


(defconstant* +soap-envelope+ "http://www.w3.org/2003/05/soap-envelope")
(defconstant* +soap-addressing+ "http://schemas.xmlsoap.org/ws/2004/08/addressing")
(defconstant* +soap-wsman+ "http://schemas.dmtf.org/wbem/wsman/1/wsman.xsd")

(defun encode-logical-disk (stream)
  "Basic exmaple of how we might go about encoding the messages. Uses CL-WHO."
  (cl-who:with-html-output (s stream)
	(:|s:Envelope| :|xmlns:s| +soap-envelope+
	               :|xmlns:s| +soap-addressing+
				   :|xmlns:a| +soap-wsman+
	  (:|s:Header|
		(:|a:To| "http://RemoteComputer:80/wsman")
		(:|w:ResourceURI| :|s:mustUnderstand| "true"
		 "http://schemas.microsoft.com/wbem/wsman/1/wmi/root/cimv2/Win32_logicaldisk")
		(:|ReplyTo|
		  (:|a:Address| :|s:mustUnderstand| "true"
			"http://schemas.xmlsoap.org/ws/2004/08/addressing/role/anonymous"))
		(:|a:Action| :|s:mustUnderstand| "true"
		  "http://schemas.xmlsoap.org/ws/2004/09/transfer/Get")
		(:|w:MaxEnvelopeSize| :|s:mustUnderstand| "true" "153600")
		(:|a:MessageID| "uuid:4ED2993C-4339-4E99-81FC-C2FD3812781A")
		(:|w:Locale| :|xml:lang| "en-US" :|s:mustUnderstand| "false")
		(:|w:SelectorSet|
		  (:|w:Selector| :|Name| "DeviceId" "c:"))
		(:|w:OperationTimeout| "PT60.0005")))))

			