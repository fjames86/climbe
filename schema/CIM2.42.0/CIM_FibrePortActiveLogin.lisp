
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_FibrePortActiveLogin.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_FIBREPORTACTIVELOGIN NIL
              ((NEGOTIATEDCOS UINT16 :CIM-NAME "NegotiatedCOS" :QUALIFIERS
                ((:DEPRECATED ("CIM_FCPort.ActiveCOS")) :KEY
                 (:DESCRIPTION
                  "Note: The use of this method has been deprecated. 
Deprecated description: The Fibre Channel Class of Service that is currently running between the Ports. Because two Ports can be simultaneously connected at different Classes of Service, this property had to be part of the key of the object and therefore, the identity of the instance.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6"))
                 (:VALUES ("Unknown" "1" "2" "3" "4" "6" "F"))
                 (:MAPPING-STRINGS
                  ("MIF.DMTF|Fibre Channel Bus PortExtensions|001.5"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_FibreChannelAdapter.SupportedCOS")))
                :INITFORM NIL)
               (NEGOTIATEDFRAMESIZE UINT64 :CIM-NAME "NegotiatedFrameSize"
                :QUALIFIERS
                ((:DEPRECATED ("CIM_FCPort.ActiveMaximumTransmissionUnit"))
                 (:DESCRIPTION
                  "Note: The use of this method has been deprecated. 
Deprecated description: The Fibre Channel frame size, in bytes, that is currently negotiated between the two Ports.")
                 (NIL "Bytes") (:P-UNIT "byte"))
                :INITFORM NIL)
               (NEGOTIATEDSPEED UINT64 :CIM-NAME "NegotiatedSpeed" :QUALIFIERS
                ((:DEPRECATED ("CIM_FCPort.Speed"))
                 (:DESCRIPTION
                  "Note: The use of this method has been deprecated. 
Deprecated description: The speed for communications that is currently negotiated between the two Ports. Speed is specified in Bits per Second. If this information is not available, the property should be set to 0.")
                 (NIL "Bits per Second") (:P-UNIT "bit / second"))
                :INITFORM NIL)
               (ACKMODEL UINT16 :CIM-NAME "ACKModel" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "Note: The use of this method has been deprecated. 
Deprecated description: Acknowledgement model that is negotiated during Port login. For example, ACK-1 indicates that each frame should be acknowledged.")
                 (:VALUE-MAP ("0" "1" "2" "3"))
                 (:VALUES ("Unknown" "ACK-0" "ACK-1" "ACK-N"))
                 (:MAPPING-STRINGS
                  ("MIF.DMTF|Fibre Channel Bus PortExtensions|001.6")))
                :INITFORM NIL)
               (BUFFERTOBUFFERMODEL UINT16 :CIM-NAME "BufferToBufferModel"
                :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "Note: The use of this method has been deprecated. 
Deprecated description: The buffer-to-buffer model that was negotiated during Port login. Either the model defined by the FC-PH standard is used (value=1, \"Regular\") or an \"Alternate\" model is negotiated.")
                 (:VALUE-MAP ("0" "1" "2"))
                 (:VALUES ("Unknown" "Regular" "Alternate")))
                :INITFORM NIL)
               (ORIGINATORBUFFERCREDIT UINT64 :CIM-NAME
                "OriginatorBufferCredit" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "Note: The use of this method has been deprecated. 
Deprecated description: OriginatorBufferCredit reflects the buffer credit of the Port that is defined as the LoginOriginator. This method is the number of frame buffers that were made available by the originating Port to the responder Port. Buffer credits are used in point-to- point connections, when an NL-Local Port is logged into another NL-Local Port, and when Nx Ports are logged into Fx Ports. In other scenarios, this value is undefined.")
                 (:MAPPING-STRINGS
                  ("MIF.DMTF|Fibre Channel Bus PortExtensions|001.3")))
                :INITFORM NIL)
               (RESPONDERBUFFERCREDIT UINT64 :CIM-NAME "ResponderBufferCredit"
                :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "Note: The use of this method has been deprecated. 
Deprecated description: ResponderBufferCredit reflects the buffer credit of the Port that is defined as the LoginResponder. This method is the number of frame buffers that were made available by the responder Port to the originating Port. Buffer credits are used in point-to-point connections, when an NL-Local Port is logged into another NL-Local Port, and when Nx Ports are logged into Fx Ports. In other scenarios, this value is undefined.")
                 (:MAPPING-STRINGS
                  ("MIF.DMTF|Fibre Channel Bus PortExtensions|001.3")))
                :INITFORM NIL)
               (ORIGINATORENDCREDIT UINT64 :CIM-NAME "OriginatorEndCredit"
                :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "Note: The use of this method has been deprecated. 
Deprecated description: OriginatorEndCredit reflects the end credit of the Port that is defined as the LoginOriginator. This method is the number of frame buffers that were made available by the originating Port to the responder Port. End credits are used in point-to-point connections, when an NL-Local Port is logged into another NL-Local Port, and when Nx Ports are logged into remote Nx Ports. In other scenarios, this value is undefined.")
                 (:MAPPING-STRINGS
                  ("MIF.DMTF|Fibre Channel Bus PortExtensions|001.2")))
                :INITFORM NIL)
               (RESPONDERENDCREDIT UINT64 :CIM-NAME "ResponderEndCredit"
                :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "Note: The use of this method has been deprecated. 
Deprecated description: ResponderEndCredit reflects the end credit of the Port that is defined as the LoginResponder. This method is the number of frame buffers that were made available by the responder Port to the originating Port. End credits are used in point-to-point connections, when an NL-Local Port is logged into another NL-Local Port, and when Nx Ports are logged into remote Nx Ports. In other scenarios, this value is undefined.")
                 (:MAPPING-STRINGS
                  ("MIF.DMTF|Fibre Channel Bus PortExtensions|001.2")))
                :INITFORM NIL)
               (LOGINORIGINATOR NIL :CIM-NAME "LoginOriginator" :QUALIFIERS
                ((:DEPRECATED ("CIM_ActiveConnection.Dependent")) :KEY
                 (:DESCRIPTION
                  "Note: The use of this method has been deprecated. 
Deprecated description: The originator of the login."))
                :INITFORM "CIM_FibrePort")
               (LOGINRESPONDER NIL :CIM-NAME "LoginResponder" :QUALIFIERS
                ((:DEPRECATED ("CIM_ActiveConnection.Antecedent")) :KEY
                 (:DESCRIPTION
                  "Note: The use of this method has been deprecated. 
Deprecated description: The responder to the login."))
                :INITFORM "CIM_FibrePort"))
              (:CIM-NAME "CIM_FibrePortActiveLogin")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_ActiveConnection" "CIM_FCPort"))
               (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::NetworkAdapter")
               (:DESCRIPTION
                "Note: The use of FibrePortActiveLogin is deprecated because FibrePort is deprecated. 
Deprecated description: Information for FibrePortActiveLogin is found by examining the individual FCPorts, and an ActiveConnection between the FCProtocolEndpoints that are associated with the ports. FibrePortActiveLogin indicates that two FibrePorts are connected through a login and have negotiated their Class Of Service, frame size, and other link characteristics, as specified by an instance of this class.")))