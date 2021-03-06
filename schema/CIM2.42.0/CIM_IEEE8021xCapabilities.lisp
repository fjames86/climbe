
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_IEEE8021xCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_IEEE8021XCAPABILITIES (CIM_CAPABILITIES)
              ((ROAMINGSUPPORTED BOOLEAN :CIM-NAME "RoamingSupported"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Indicates whether the associated ProtocolEndpoint supports moving a session due to roaming."))
                :INITFORM NIL)
               (FASTROAMINGSUPPORTED BOOLEAN :CIM-NAME "FastRoamingSupported"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Indicates whether the associated ProtocolEndpoint supports fast reconnection of an IEEE 802.1x session when it roams from one access point to another."))
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
               (SUPPORTEDAUTHENTICATIONPROTOCOLS (ARRAY UINT16) :CIM-NAME
                "SupportedAuthenticationProtocols" :QUALIFIERS
                ((:DESCRIPTION
                  "The IEEE 802.1x Extensible Authentication Protocol types supported by the associated ProtocolEndpoint. See AuthenticationProtocol description in CIM_IEEE8021xSettings for more information.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" ".."))
                 (:VALUES
                  ("EAP-TLS" "EAP-TTLS/MSCHAPv2" "PEAPv0/EAP-MSCHAPv2"
                   "PEAPv1/EAP-GTC" "EAP-FAST/MSCHAPv2" "EAP-FAST/GTC"
                   "EAP-MD5" "EAP-PSK" "EAP-SIM" "EAP-AKA" "EAP-FAST/TLS"
                   "DMTF Reserved")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_IEEE8021xCapabilities")
              (:QUALIFIERS (:VERSION "2.22.0")
               (:UML-PACKAGE-PATH "CIM::Network::IEEE8021x")
               (:DESCRIPTION
                "CIM_IEEE8021xCapabilities describes the IEEE 802.1x security capabilities of a layer 2 ProtocolEndpoint.")))