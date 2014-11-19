

(in-package #:climbe.decoding)


;; in order to properly decode the wsman messages we need to be able to understand the 
;; SOAP message format (envelopes). This requires that we can parse the namespaced xml

(defun parse-wsman (stream)
  "Parse some xml from the stream"
  (cxml:parse-stream stream (cxml-xmls:make-xmls-builder)))

(defun parse-wsman-string (string)
  "Parse some xml form the string"
  (let ((octets (babel:string-to-octets string)))
    (flexi-streams:with-input-from-sequence (stream octets)
      (parse-wsman stream))))

(defun decode-wsman (stream)
  "Decode a WS-Man messsage from the stream."
  (decode-wsman-envelope (parse-wsman stream)))






;; structures we use to put the wsman contents into 
(defstruct envelope 
  nslist header body)

(defstruct header 
  to 
  resource-uri 
  reply-address 
  action 
  max-envelope-size 
  message-id 
  locale 
  selector-set 
  timeout)


;; ensure the prefix is set to wsman
(eval-when (:compile-toplevel :load-toplevel :execute)
  (setf *tag-prefix* "WSMAN"))

(deftag envelope () (header body)
  (make-envelope :header header 
                 :body body))

(deftag header () (to resourceuri replyto action maxenvelopesize locale? messageid? selectorset operationtimeout?)
  (make-header :to to
               :resource-uri resourceuri
               :reply-address replyto
               :action action
               :max-envelope-size maxenvelopesize
               :locale locale
               :message-id messageid
               :selector-set selectorset
               :timeout operationtimeout))

(deftag body () instances
  (mapcar (lambda (instance)             
            (destructuring-bind ((classname . ns) attributes &rest slots) instance
              (declare (ignore ns attributes))
              (make-cim-instance :classname classname
                                 :slots 
                                 (mapcar (lambda (slot)
                                           (destructuring-bind ((slot-name . ns) attributes &rest value) slot
                                             (declare (ignore ns attributes))
                                             (list (intern slot-name :keyword) (car value))))
                                         slots))))
          instances))
                                        

(deftag to () uri
  (puri:parse-uri (car uri)))
  
(deftag resourceuri () uri
  (puri:parse-uri (car uri)))

(deftag replyto () (address)
  address)

(deftag address () uri
  (puri:parse-uri (car uri)))

(deftag action () uri
  (puri:parse-uri (car uri)))

(deftag maxenvelopesize () size
  (parse-integer (car size)))

(deftag locale (lang) contents
  (declare (ignore contents))
  lang)

(deftag messageid () uuid
  (car uuid))

(deftag selectorset () (selector*)
  selector)

(deftag selector (name) value
  (list name (car value)))

(deftag operationtimeout () timeout
  (car timeout))












;;; ----------- test for playing with ---------------------


(defun test-wsman ()
  (let ((decoded (parse-wsman-string (climbe.encoding::encode-logical-disk))))
    (decode-wsman-envelope decoded)))

(defun test-wsman-response ()
  "<s:Envelope xml:lang=\"en-US\" xmlns:s=\"http://www.w3.org/2003/05/soap-envelope\" xmlns:a=\"http://schemas.xmlsoap.org/ws/2004/08/addressing\" xmlns:x=\"http://schemas.xmlsoap.org/ws/2004/09/transfer\" xmlns:w=\"http://schemas.dmtf.org/wbem/wsman/1/wsman.xsd\" xmlns:p=\"http://schemas.microsoft.com/wbem/wsman/1/wsman.xsd\"><s:Header><a:Action>http://schemas.xmlsoap.org/ws/2004/09/transfer/GetResponse</a:Action><a:MessageID>uuid:9EA87B97-CAC9-4C2E-9F13-36E0A62AF3EF</a:MessageID><p:ActivityId>37E0568E-F785-0005-9A83-E03785F7CF01</p:ActivityId><a:To>http://schemas.xmlsoap.org/ws/2004/08/addressing/role/anonymous</a:To><a:RelatesTo>uuid:4ED2993C-4339-4E99-81FC-C2FD3812781A</a:RelatesTo></s:Header><s:Body><p:Win32_LogicalDisk xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:p=\"http://schemas.microsoft.com/wbem/wsman/1/wmi/root/cimv2/Win32_LogicalDisk\" xmlns:cim=\"http://schemas.dmtf.org/wbem/wscim/1/common\" xsi:type=\"p:Win32_LogicalDisk_Type\"><p:Access>0</p:Access><p:Availability xsi:nil=\"true\"/><p:BlockSize xsi:nil=\"true\"/><p:Caption>c:</p:Caption><p:Compressed>false</p:Compressed><p:ConfigManagerErrorCode xsi:nil=\"true\"/><p:ConfigManagerUserConfig xsi:nil=\"true\"/><p:CreationClassName>Win32_LogicalDisk</p:CreationClassName><p:Description>Local Fixed Disk</p:Description><p:DeviceID>c:</p:DeviceID><p:DriveType>3</p:DriveType><p:ErrorCleared xsi:nil=\"true\"/><p:ErrorDescription xsi:nil=\"true\"/><p:ErrorMethodology xsi:nil=\"true\"/><p:FileSystem>NTFS</p:FileSystem><p:FreeSpace>840649814016</p:FreeSpace><p:InstallDate xsi:nil=\"true\"/><p:LastErrorCode xsi:nil=\"true\"/><p:MaximumComponentLength>255</p:MaximumComponentLength><p:MediaType>12</p:MediaType><p:Name>c:</p:Name><p:NumberOfBlocks xsi:nil=\"true\"/><p:PNPDeviceID xsi:nil=\"true\"/><p:PowerManagementSupported xsi:nil=\"true\"/><p:ProviderName xsi:nil=\"true\"/><p:Purpose xsi:nil=\"true\"/><p:QuotasDisabled>true</p:QuotasDisabled><p:QuotasIncomplete>false</p:QuotasIncomplete><p:QuotasRebuilding>false</p:QuotasRebuilding><p:Size>999650488320</p:Size><p:Status xsi:nil=\"true\"/><p:StatusInfo xsi:nil=\"true\"/><p:SupportsDiskQuotas>true</p:SupportsDiskQuotas><p:SupportsFileBasedCompression>true</p:SupportsFileBasedCompression><p:SystemCreationClassName>Win32_ComputerSystem</p:SystemCreationClassName><p:SystemName>HYPERB</p:SystemName><p:VolumeDirty>false</p:VolumeDirty><p:VolumeName></p:VolumeName><p:VolumeSerialNumber>ECA22F4F</p:VolumeSerialNumber></p:Win32_LogicalDisk></s:Body></s:Envelope>")




