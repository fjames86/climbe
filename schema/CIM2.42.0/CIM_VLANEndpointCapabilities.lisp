
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_VLANEndpointCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_VLANENDPOINTCAPABILITIES (CIM_CAPABILITIES)
              ((DOT1QTAGGING BOOLEAN :CIM-NAME "Dot1QTagging" :QUALIFIERS
                ((:DESCRIPTION "Indicates support for dot1Q tagging and GVRP.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|P-BRIDGE-MIB.dot1dPortCapabilities")))
                :INITFORM NIL)
               (DOT1QACCEPTABLEVLANFRAMESTYPES UINT16 :CIM-NAME
                "Dot1qAcceptableVLANFramesTypes" :QUALIFIERS
                ((:DESCRIPTION
                  "Describes the type of frames that are accepted by the port.")
                 (:VALUE-MAP ("0" "2" "3" "4"))
                 (:VALUES
                  ("Unknown" "Accept All" "Admit VLAN Tagged Only"
                   "Not Applicable"))
                 (:MAPPING-STRINGS
                  ("MIB.IETF|P-BRIDGE-MIB.dot1dPortCapabilities")))
                :INITFORM NIL)
               (DOT1QINGRESSFILTERING BOOLEAN :CIM-NAME "Dot1qIngressFiltering"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Supports the discarding of any frame received on a ProtocolEndpoint whose VLAN classification does not include that ProtocolEndpoint in its Member set.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|P-BRIDGE-MIB.dot1dPortCapabilities")))
                :INITFORM NIL)
               (SUPPORTSTRUNKENCAPSULATIONNEGOTIATION BOOLEAN :CIM-NAME
                "SupportsTrunkEncapsulationNegotiation" :QUALIFIERS
                ((:DESCRIPTION
                  "This property indicates whether or not the protocol endpoint supports negotiation of the trunk encapsulation.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_VLANEndpoint.DesiredEndpointMode")))
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
                :INITFORM NIL))
              (:CIM-NAME "CIM_VLANEndpointCapabilities")
              (:QUALIFIERS (:VERSION "2.21.0")
               (:UML-PACKAGE-PATH "CIM::Network::VLAN")
               (:DESCRIPTION "Capabilities supported by the VLAN endpoint.")))