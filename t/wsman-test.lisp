

(defpackage #:climbe.test.wsman
  (:use #:cl #:climbe))

(in-package #:climbe.test.wsman)

;; get-cimassociatedinstances
(defun get-cim-associated-instances (namespace class-name association-class-name result-class-name)
  (format nil
	  "<s:Envelope xmlns:s=\"http://www.w3.org/2003/05/soap-envelope\" xmlns:a=\"http://schemas.xmlsoap.org/ws/2004/08/addressing\" xmlns:n=\"http://schemas.xmlsoap.org/ws/2004/09/enumeration\" xmlns:w=\"http://schemas.dmtf.org/wbem/wsman/1/wsman.xsd\" xmlns:p=\"http://schemas.microsoft.com/wbem/wsman/1/wsman.xsd\" xmlns:b=\"http://schemas.dmtf.org/wbem/wsman/1/cimbinding.xsd\"><s:Header><a:To>http://localhost:9989/wsman</a:To><w:ResourceURI s:mustUnderstand=\"true\">http://schemas.dmtf.org/wbem/wscim/1/*</w:ResourceURI><a:ReplyTo><a:Address s:mustUnderstand=\"true\">http://schemas.xmlsoap.org/ws/2004/08/addressing/role/anonymous</a:Address></a:ReplyTo><a:Action s:mustUnderstand=\"true\">http://schemas.xmlsoap.org/ws/2004/09/enumeration/Enumerate</a:Action><w:MaxEnvelopeSize s:mustUnderstand=\"true\">512000</w:MaxEnvelopeSize><a:MessageID>uuid:5B008E57-BC4E-479C-904F-136846E5A697</a:MessageID><w:Locale xml:lang=\"en-GB\" s:mustUnderstand=\"false\" /><p:DataLocale xml:lang=\"en-GB\" s:mustUnderstand=\"false\" /><p:SessionId s:mustUnderstand=\"false\">uuid:91A8C559-19BC-4A5E-B99F-8A39CF77253E</p:SessionId><p:OperationID s:mustUnderstand=\"false\">uuid:2A50592F-4DFC-477B-866D-E769B730AE51</p:OperationID><p:SequenceId s:mustUnderstand=\"false\">1</p:SequenceId><w:SelectorSet><w:Selector Name=\"__cimnamespace\">~A</w:Selector></w:SelectorSet><w:OptionSet xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"><w:Option Name=\"__MI_CallbackRegistration\" Type=\"xs:int\">11</w:Option><w:Option Name=\"wmiarray:__MI_OPERATIONOPTIONS_CHANNELVALUE\" Type=\"xs:unsignedInt\">0</w:Option><w:Option Name=\"wmiarray:__MI_OPERATIONOPTIONS_CHANNELVALUE\" Type=\"xs:unsignedInt\">1</w:Option><w:Option Name=\"wmiarray:__MI_OPERATIONOPTIONS_CHANNELVALUE\" Type=\"xs:unsignedInt\">2</w:Option><w:Option Name=\"wmi:__MI_OPERATIONOPTIONS_WRITEERRORMODE\" Type=\"xs:unsignedInt\">1</w:Option><w:Option Name=\"msftwinrm:UsePreciseArrays\" Type=\"xs:boolean\">true</w:Option></w:OptionSet><w:OperationTimeout>PT1.000S</w:OperationTimeout></s:Header><s:Body><n:Enumerate><w:OptimizeEnumeration/><w:MaxElements>32000</w:MaxElements><w:EnumerationMode>EnumerateObjectAndEPR</w:EnumerationMode><w:Filter Dialect=\"http://schemas.dmtf.org/wbem/wsman/1/cimbinding/associationFilter\"><b:AssociatedInstances><b:Object><a:Address>http://schemas.xmlsoap.org/ws/2004/08/addressing/role/anonymous</a:Address><a:ReferenceParameters><w:ResourceURI>http://schemas.dmtf.org/wbem/wscim/1/cim-schema/2/~A</w:ResourceURI><w:SelectorSet><w:Selector Name=\"__cimnamespace\">~A</w:Selector></w:SelectorSet></a:ReferenceParameters></b:Object><b:AssociationClassName>~A</b:AssociationClassName><b:ResultClassName>~A</b:ResultClassName></b:AssociatedInstances></w:Filter></n:Enumerate></s:Body></s:Envelope>" 
	  namespace
	  namespace
	  class-name
	  association-class-name
	  result-class-name))



;; -------------

;; get the class
(defun win32-logical-disk ()
  (call-wsman-get-class "Win32_LogicalDisk" :namespace "root/cimv2"))

;; get all instances
(defun win32-logical-disk* ()
  (call-wsman-enumerate-instances "Win32_LogicalDisk" :namespace "root/cimv2"))

