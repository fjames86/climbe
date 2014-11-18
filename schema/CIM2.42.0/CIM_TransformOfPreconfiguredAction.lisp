
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_TransformOfPreconfiguredAction.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_TRANSFORMOFPRECONFIGUREDACTION (CIM_DEPENDENCY)
              ((SPI UINT32 :CIM-NAME "SPI" :QUALIFIERS
                ((:DESCRIPTION
                  "The SPI property specifies the security parameter index to be used by the pre-configured action for the associated transform.")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|TransformOfPreconfiguredAction.SPI"))
                 (:MODEL-CORRESPONDENCE ("CIM_IPsecSAEndpoint.SPI")))
                :INITFORM NIL)
               (INBOUNDDIRECTION BOOLEAN :CIM-NAME "InboundDirection"
                :QUALIFIERS
                ((:DESCRIPTION
                  "InboundDirection specifies whether the SA applies to inbound (TRUE) or outbound (FALSE) traffic.")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|TransformOfPreconfiguredAction.Direction"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_IPsecSAEndpoint.InboundDirection")))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "2") (:MAX "6")
                 (:DESCRIPTION
                  "This defines the type of transform used by the referenced PreconfiguredSAAction. A minimum of 2 and maximum of 6 transforms can be defined, for the inbound/outbound directions, representing AH, ESP, and/or an IPCOMP transforms.")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|TransformOfPreconfiguredAction.Antecedent"))
                 :KEY)
                :INITFORM "CIM_SATransform")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "This defines the PreconfiguredSAAction which uses the AH, ESP, and/or IPCOMP transforms.")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|TransformOfPreconfiguredAction.Dependent"))
                 :KEY)
                :INITFORM "CIM_PreconfiguredSAAction"))
              (:CIM-NAME "CIM_TransformOfPreconfiguredAction")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::IPsecPolicy")
               (:DESCRIPTION
                "TransformOfPreconfiguredAction defines the transforms used by a preconfigured IPsec action. Two, four or six SATransforms can be associated to a PreconfiguredSAAction (applied to the inbound and outbound traffic, as indicated by the Direction property of this association). The order of application of the SATransforms is implicitly defined in RFC2401.")
               (:MAPPING-STRINGS
                ("IPSP Policy Model.IETF|TransformOfPreconfiguredAction"))))