

(defpackage #:climbe.test.wsman
  (:use #:cl #:climbe))

(in-package #:climbe.test.wsman)

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



(defun test-wsman ()
  (let ((decoded (climbe.decoding::parse-wsman-string (climbe.encoding::encode-logical-disk))))
    (climbe.decoding::decode-wsman-envelope decoded)))

(defun test-wsman-response ()
  "<s:Envelope xml:lang=\"en-US\" xmlns:s=\"http://www.w3.org/2003/05/soap-envelope\" xmlns:a=\"http://schemas.xmlsoap.org/ws/2004/08/addressing\" xmlns:x=\"http://schemas.xmlsoap.org/ws/2004/09/transfer\" xmlns:w=\"http://schemas.dmtf.org/wbem/wsman/1/wsman.xsd\" xmlns:p=\"http://schemas.microsoft.com/wbem/wsman/1/wsman.xsd\"><s:Header><a:Action>http://schemas.xmlsoap.org/ws/2004/09/transfer/GetResponse</a:Action><a:MessageID>uuid:9EA87B97-CAC9-4C2E-9F13-36E0A62AF3EF</a:MessageID><p:ActivityId>37E0568E-F785-0005-9A83-E03785F7CF01</p:ActivityId><a:To>http://schemas.xmlsoap.org/ws/2004/08/addressing/role/anonymous</a:To><a:RelatesTo>uuid:4ED2993C-4339-4E99-81FC-C2FD3812781A</a:RelatesTo></s:Header><s:Body><p:Win32_LogicalDisk xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:p=\"http://schemas.microsoft.com/wbem/wsman/1/wmi/root/cimv2/Win32_LogicalDisk\" xmlns:cim=\"http://schemas.dmtf.org/wbem/wscim/1/common\" xsi:type=\"p:Win32_LogicalDisk_Type\"><p:Access>0</p:Access><p:Availability xsi:nil=\"true\"/><p:BlockSize xsi:nil=\"true\"/><p:Caption>c:</p:Caption><p:Compressed>false</p:Compressed><p:ConfigManagerErrorCode xsi:nil=\"true\"/><p:ConfigManagerUserConfig xsi:nil=\"true\"/><p:CreationClassName>Win32_LogicalDisk</p:CreationClassName><p:Description>Local Fixed Disk</p:Description><p:DeviceID>c:</p:DeviceID><p:DriveType>3</p:DriveType><p:ErrorCleared xsi:nil=\"true\"/><p:ErrorDescription xsi:nil=\"true\"/><p:ErrorMethodology xsi:nil=\"true\"/><p:FileSystem>NTFS</p:FileSystem><p:FreeSpace>840649814016</p:FreeSpace><p:InstallDate xsi:nil=\"true\"/><p:LastErrorCode xsi:nil=\"true\"/><p:MaximumComponentLength>255</p:MaximumComponentLength><p:MediaType>12</p:MediaType><p:Name>c:</p:Name><p:NumberOfBlocks xsi:nil=\"true\"/><p:PNPDeviceID xsi:nil=\"true\"/><p:PowerManagementSupported xsi:nil=\"true\"/><p:ProviderName xsi:nil=\"true\"/><p:Purpose xsi:nil=\"true\"/><p:QuotasDisabled>true</p:QuotasDisabled><p:QuotasIncomplete>false</p:QuotasIncomplete><p:QuotasRebuilding>false</p:QuotasRebuilding><p:Size>999650488320</p:Size><p:Status xsi:nil=\"true\"/><p:StatusInfo xsi:nil=\"true\"/><p:SupportsDiskQuotas>true</p:SupportsDiskQuotas><p:SupportsFileBasedCompression>true</p:SupportsFileBasedCompression><p:SystemCreationClassName>Win32_ComputerSystem</p:SystemCreationClassName><p:SystemName>HYPERB</p:SystemName><p:VolumeDirty>false</p:VolumeDirty><p:VolumeName></p:VolumeName><p:VolumeSerialNumber>ECA22F4F</p:VolumeSerialNumber></p:Win32_LogicalDisk></s:Body></s:Envelope>")





(defun test-call (uri password &key (username "administrator"))
  "Call the host with the pre-prepared content, then with the generated content. decode the result."
  (list 
   (call-wsman password (wsman-logical-disk) :uri uri :username username)
   (call-wsman password (climbe.encoding::encode-logical-disk) :uri uri :username username)))




;; --------------------------

;; resverse engineer by setting up a socket listener and sending
;; messages from powershell

;; Get-CimClass

;; enumerate cim classes I just got
(defun get-cim-class (namespace message-id &key (url "http://localhost:9899/wsman") (class-name ""))
  (format nil
	  "<s:Envelope xmlns:s=\"http://www.w3.org/2003/05/soap-envelope\" xmlns:a=\"http://schemas.xmlsoap.org/ws/2004/08/addressing\" xmlns:n=\"http://schemas.xmlsoap.org/ws/2004/09/enumeration\" xmlns:w=\"http://schemas.dmtf.org/wbem/wsman/1/wsman.xsd\" xmlns:p=\"http://schemas.microsoft.com/wbem/wsman/1/wsman.xsd\" xmlns:b=\"http://schemas.dmtf.org/wbem/wsman/1/cimbinding.xsd\"><s:Header><a:To>~A</a:To><w:ResourceURI s:mustUnderstand=\"true\">http://schemas.dmtf.org/wbem/cim-xml/2/cim-schema/2/*</w:ResourceURI><a:ReplyTo><a:Address s:mustUnderstand=\"true\">http://schemas.xmlsoap.org/ws/2004/08/addressing/role/anonymous</a:Address></a:ReplyTo><a:Action s:mustUnderstand=\"true\">http://schemas.xmlsoap.org/ws/2004/09/enumeration/Enumerate</a:Action><w:MaxEnvelopeSize s:mustUnderstand=\"true\">512000</w:MaxEnvelopeSize><a:MessageID>~A</a:MessageID><w:Locale xml:lang=\"en-GB\" s:mustUnderstand=\"false\" /><p:DataLocale xml:lang=\"en-GB\" s:mustUnderstand=\"false\" /><p:SessionId s:mustUnderstand=\"false\">uuid:91A8C559-19BC-4A5E-B99F-8A39CF77253E</p:SessionId><p:OperationID s:mustUnderstand=\"false\">uuid:F524DB49-033D-4942-972D-9701919ECF34</p:OperationID><p:SequenceId s:mustUnderstand=\"false\">1</p:SequenceId><w:SelectorSet><w:Selector Name=\"__cimnamespace\">~A</w:Selector><w:Selector Name=\"ClassName\"></w:Selector>~A</w:SelectorSet><w:OptionSet xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"><w:Option Name=\"IncludeInheritanceHierarchy\" Type=\"xs:boolean\">true</w:Option><w:Option Name=\"IncludeInheritedElements\" Type=\"xs:boolean\">true</w:Option><w:Option Name=\"IncludeQualifiers\" Type=\"xs:boolean\">true</w:Option><w:Option Name=\"__MI_CallbackRegistration\" Type=\"xs:int\">11</w:Option><w:Option Name=\"wmiarray:__MI_OPERATIONOPTIONS_CHANNELVALUE\" Type=\"xs:unsignedInt\">0</w:Option><w:Option Name=\"wmiarray:__MI_OPERATIONOPTIONS_CHANNELVALUE\" Type=\"xs:unsignedInt\">1</w:Option><w:Option Name=\"wmiarray:__MI_OPERATIONOPTIONS_CHANNELVALUE\" Type=\"xs:unsignedInt\">2</w:Option><w:Option Name=\"wmi:__MI_OPERATIONOPTIONS_WRITEERRORMODE\" Type=\"xs:unsignedInt\">1</w:Option><w:Option Name=\"msftwinrm:UsePreciseArrays\" Type=\"xs:boolean\">true</w:Option></w:OptionSet><w:OperationTimeout>PT1.000S</w:OperationTimeout></s:Header><s:Body><n:Enumerate><w:OptimizeEnumeration/><w:MaxElements>32000</w:MaxElements></n:Enumerate></s:Body></s:Envelope>"
	  url 
	  message-id
	  namespace
	  class-name))

;; THIS ACTUALLY WORKS!!1!
(defun works-get-class (class-name &key (namespace "root/cimv2") (username "") (password ""))
  (call-wsman-get-class :uri "http://127.0.0.1:5985/wsman"
			:namespace namespace
			:class-name class-name 
			:username username
			:password password))




;; http://schemas.dmtf.org/wbem/wscim/1/cim-schema/2/Win32_LogicalDisk
(defun get-cim-instance (namespace class-name &key (url-to "http://localhost:5989/wsman"))
  (format nil
	  "<s:Envelope xmlns:s=\"http://www.w3.org/2003/05/soap-envelope\" xmlns:a=\"http://schemas.xmlsoap.org/ws/2004/08/addressing\" xmlns:n=\"http://schemas.xmlsoap.org/ws/2004/09/enumeration\" xmlns:w=\"http://schemas.dmtf.org/wbem/wsman/1/wsman.xsd\" xmlns:p=\"http://schemas.microsoft.com/wbem/wsman/1/wsman.xsd\" xmlns:b=\"http://schemas.dmtf.org/wbem/wsman/1/cimbinding.xsd\"><s:Header><a:To>~A</a:To><w:ResourceURI s:mustUnderstand=\"true\">http://schemas.dmtf.org/wbem/wscim/1/cim-schema/2/~A</w:ResourceURI><a:ReplyTo><a:Address s:mustUnderstand=\"true\">http://schemas.xmlsoap.org/ws/2004/08/addressing/role/anonymous</a:Address></a:ReplyTo><a:Action s:mustUnderstand=\"true\">http://schemas.xmlsoap.org/ws/2004/09/enumeration/Enumerate</a:Action><w:MaxEnvelopeSize s:mustUnderstand=\"true\">512000</w:MaxEnvelopeSize><a:MessageID>uuid:366DF5CE-7321-4A01-A15B-D84EB70484BF</a:MessageID><w:Locale xml:lang=\"en-GB\" s:mustUnderstand=\"false\" /><p:DataLocale xml:lang=\"en-GB\" s:mustUnderstand=\"false\" /><p:SessionId s:mustUnderstand=\"false\">uuid:91A8C559-19BC-4A5E-B99F-8A39CF77253E</p:SessionId><p:OperationID s:mustUnderstand=\"false\">uuid:29FC5235-DB5F-4E11-88FF-76577CF56273</p:OperationID><p:SequenceId s:mustUnderstand=\"false\">1</p:SequenceId><w:SelectorSet><w:Selector Name=\"__cimnamespace\">~A</w:Selector></w:SelectorSet><w:OptionSet xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"><w:Option Name=\"__MI_CallbackRegistration\" Type=\"xs:int\">11</w:Option><w:Option Name=\"wmiarray:__MI_OPERATIONOPTIONS_CHANNELVALUE\" Type=\"xs:unsignedInt\">0</w:Option><w:Option Name=\"wmiarray:__MI_OPERATIONOPTIONS_CHANNELVALUE\" Type=\"xs:unsignedInt\">1</w:Option><w:Option Name=\"wmiarray:__MI_OPERATIONOPTIONS_CHANNELVALUE\" Type=\"xs:unsignedInt\">2</w:Option><w:Option Name=\"wmi:__MI_OPERATIONOPTIONS_WRITEERRORMODE\" Type=\"xs:unsignedInt\">1</w:Option><w:Option Name=\"msftwinrm:UsePreciseArrays\" Type=\"xs:boolean\">true</w:Option></w:OptionSet><w:OperationTimeout>PT1.000S</w:OperationTimeout></s:Header><s:Body><n:Enumerate><w:OptimizeEnumeration/><w:MaxElements>32000</w:MaxElements><w:EnumerationMode>EnumerateObjectAndEPR</w:EnumerationMode></n:Enumerate></s:Body></s:Envelope>" 
	  url-to
	  class-name
	  namespace))

;; get-cimassociatedinstances
(defun get-cim-associated-instances (namespace class-name association-class-name result-class-name)
  (format nil
	  "<s:Envelope xmlns:s=\"http://www.w3.org/2003/05/soap-envelope\" xmlns:a=\"http://schemas.xmlsoap.org/ws/2004/08/addressing\" xmlns:n=\"http://schemas.xmlsoap.org/ws/2004/09/enumeration\" xmlns:w=\"http://schemas.dmtf.org/wbem/wsman/1/wsman.xsd\" xmlns:p=\"http://schemas.microsoft.com/wbem/wsman/1/wsman.xsd\" xmlns:b=\"http://schemas.dmtf.org/wbem/wsman/1/cimbinding.xsd\"><s:Header><a:To>http://localhost:9989/wsman</a:To><w:ResourceURI s:mustUnderstand=\"true\">http://schemas.dmtf.org/wbem/wscim/1/*</w:ResourceURI><a:ReplyTo><a:Address s:mustUnderstand=\"true\">http://schemas.xmlsoap.org/ws/2004/08/addressing/role/anonymous</a:Address></a:ReplyTo><a:Action s:mustUnderstand=\"true\">http://schemas.xmlsoap.org/ws/2004/09/enumeration/Enumerate</a:Action><w:MaxEnvelopeSize s:mustUnderstand=\"true\">512000</w:MaxEnvelopeSize><a:MessageID>uuid:5B008E57-BC4E-479C-904F-136846E5A697</a:MessageID><w:Locale xml:lang=\"en-GB\" s:mustUnderstand=\"false\" /><p:DataLocale xml:lang=\"en-GB\" s:mustUnderstand=\"false\" /><p:SessionId s:mustUnderstand=\"false\">uuid:91A8C559-19BC-4A5E-B99F-8A39CF77253E</p:SessionId><p:OperationID s:mustUnderstand=\"false\">uuid:2A50592F-4DFC-477B-866D-E769B730AE51</p:OperationID><p:SequenceId s:mustUnderstand=\"false\">1</p:SequenceId><w:SelectorSet><w:Selector Name=\"__cimnamespace\">~A</w:Selector></w:SelectorSet><w:OptionSet xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"><w:Option Name=\"__MI_CallbackRegistration\" Type=\"xs:int\">11</w:Option><w:Option Name=\"wmiarray:__MI_OPERATIONOPTIONS_CHANNELVALUE\" Type=\"xs:unsignedInt\">0</w:Option><w:Option Name=\"wmiarray:__MI_OPERATIONOPTIONS_CHANNELVALUE\" Type=\"xs:unsignedInt\">1</w:Option><w:Option Name=\"wmiarray:__MI_OPERATIONOPTIONS_CHANNELVALUE\" Type=\"xs:unsignedInt\">2</w:Option><w:Option Name=\"wmi:__MI_OPERATIONOPTIONS_WRITEERRORMODE\" Type=\"xs:unsignedInt\">1</w:Option><w:Option Name=\"msftwinrm:UsePreciseArrays\" Type=\"xs:boolean\">true</w:Option></w:OptionSet><w:OperationTimeout>PT1.000S</w:OperationTimeout></s:Header><s:Body><n:Enumerate><w:OptimizeEnumeration/><w:MaxElements>32000</w:MaxElements><w:EnumerationMode>EnumerateObjectAndEPR</w:EnumerationMode><w:Filter Dialect=\"http://schemas.dmtf.org/wbem/wsman/1/cimbinding/associationFilter\"><b:AssociatedInstances><b:Object><a:Address>http://schemas.xmlsoap.org/ws/2004/08/addressing/role/anonymous</a:Address><a:ReferenceParameters><w:ResourceURI>http://schemas.dmtf.org/wbem/wscim/1/cim-schema/2/~A</w:ResourceURI><w:SelectorSet><w:Selector Name=\"__cimnamespace\">~A</w:Selector></w:SelectorSet></a:ReferenceParameters></b:Object><b:AssociationClassName>~A</b:AssociationClassName><b:ResultClassName>~A</b:ResultClassName></b:AssociatedInstances></w:Filter></n:Enumerate></s:Body></s:Envelope>" 
	  namespace
	  namespace
	  class-name
	  association-class-name
	  result-class-name))
