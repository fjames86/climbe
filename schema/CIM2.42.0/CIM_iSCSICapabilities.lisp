
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_iSCSICapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ISCSICAPABILITIES (CIM_CAPABILITIES)
              ((MINIMUMSPECIFICATIONVERSIONSUPPORTED UINT8 :CIM-NAME
                "MinimumSpecificationVersionSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "The minimum version number of the iSCSI specification such that this iSCSI instance supports this minimum value, the maximum value indicated by the corresponding property MaximumSpecificationVersionSupported, and all versions in between.")
                 (:MIN-VALUE "0") (:MAX-VALUE "255")
                 (:MAPPING-STRINGS ("MIB.IETF|iSCSI-MIB.iscsiInstVersionMin"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_iSCSICapabilities.MaximumSpecificationVersionSupported"
                   "CIM_iSCSIConnection.ActiveiSCSIVersion")))
                :INITFORM NIL)
               (MAXIMUMSPECIFICATIONVERSIONSUPPORTED UINT8 :CIM-NAME
                "MaximumSpecificationVersionSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "The maximum version number of the iSCSI specification such that this iSCSI instance supports this maximum value, the minimum value indicated by the corresponding property MinimumSpecificationVersionSupported, and all versions in between.")
                 (:MIN-VALUE "0") (:MAX-VALUE "255")
                 (:MAPPING-STRINGS ("MIB.IETF|ISCSI-MIB.iscsiInstVersionMax"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_iSCSICapabilities.MinimumSpecificationVersionSupported"
                   "CIM_iSCSIConnection.ActiveiSCSIVersion")))
                :INITFORM NIL)
               (INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. In order to ensure uniqueness within the NameSpace, the value of InstanceID SHOULD be constructed using the following 'preferred' algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon ':', and where <OrgID> MUST include a copyrighted, trademarked or otherwise unique name that is owned by the business entity creating/defining the InstanceID, or is a registered ID that is assigned to the business entity by a recognized global authority (This is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness <OrgID> MUST NOT contain a colon (':'). When using this algorithm, the first colon to appear in InstanceID MUST appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and SHOULD not be re-used to identify different underlying (real-world) elements. If the above 'preferred' algorithm is not used, the defining entity MUST assure that the resultant InstanceID is not re-used across any InstanceIDs produced by this or other providers for this instance's NameSpace. 
For DMTF defined instances, the 'preferred' algorithm MUST be used with the <OrgID> set to 'CIM'."))
                :INITFORM NIL)
               (ELEMENTNAME STRING :CIM-NAME "ElementName" :QUALIFIERS
                (:REQUIRED (:OVERRIDE "ElementName")
                 (:DESCRIPTION
                  "The user friendly name for this instance of Capabilities. In addition, the user friendly name can be used as a index property for a search of query. (Note: Name does not have to be unique within a namespace.)"))
                :INITFORM NIL)
               (CAPTION STRING :CIM-NAME "Caption" :QUALIFIERS
                ((:DESCRIPTION
                  "The Caption property is a short textual description (one- line string) of the object.")
                 (:MAX-LEN "64"))
                :INITFORM NIL)
               (DESCRIPTION STRING :CIM-NAME "Description" :QUALIFIERS
                ((:DESCRIPTION
                  "The Description property provides a textual description of the object."))
                :INITFORM NIL)
               (AUTHENTICATIONMETHODSSUPPORTED (ARRAY UINT16) :CIM-NAME
                "AuthenticationMethodsSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "An array containing a list of authentication methods supported by this Network Entity.")
                 (:VALUE-MAP ("2" "3" "4" "5"))
                 (:VALUES ("(None" "SRP" "CHAP" "Kerberos"))
                 (:ARRAYTYPE "Indexed")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|IPS-AUTH-MIB.ipsAuthCredAuthMethod"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_iSCSIConnectionSettings.PrimaryAuthenticationMethod"
                   "CIM_iSCSIConnectionSettings.SecondaryAuthenticationMethod"
                   "CIM_iSCSIConnection.AuthenticationMethodUsed")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_iSCSICapabilities")
              (:QUALIFIERS (:VERSION "2.11.0")
               (:UML-PACKAGE-PATH "CIM::Network::iSCSI")
               (:DESCRIPTION
                "The capabilites for an iSCSI Network Entity. An instance of this class will be associated by ElementCapabilities to a instance of ComputerSystem that represents the Network Entity. These capability properties are associated to a Network Entity/ComputerSystem since they affect all login negotiations on all iSCSI ProtocolEndpoints aggregated to the system.")))