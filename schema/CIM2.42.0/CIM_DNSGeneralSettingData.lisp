
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DNSGeneralSettingData.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DNSGENERALSETTINGDATA (CIM_IPASSIGNMENTSETTINGDATA)
              ((ADDRESSORIGIN UINT16 :CIM-NAME "AddressOrigin" :QUALIFIERS
                ((:OVERRIDE "AddressOrigin")
                 (:DESCRIPTION
                  "AddressOrigin identifies the method by which the IP Address, Subnet Mask, and Gateway were assigned to the IPProtocolEndpoint. This is independent of the DNS configuration, thus this property has the value of 2 (\"Not Applicable\")")
                 (:VALUE-MAP ("0..1" "2" "3..32767" "32768.."))
                 (:VALUES
                  ("DMTF Reserved" "Not Applicable" "DMTF Reserved"
                   "Vendor Reserved")))
                :INITFORM "2")
               (APPENDPRIMARYSUFFIXES BOOLEAN :CIM-NAME "AppendPrimarySuffixes"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "Whether or not the client should automatically append the primary domain suffix to target names prior to attempting to resolve.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DNSProtocolEndpoint.AppendPrimarySuffixes")))
                :INITFORM NIL)
               (APPENDPARENTSUFFIXES BOOLEAN :CIM-NAME "AppendParentSuffixes"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "Whether or not the client should automatically append the parent domain suffix to target names prior to attempting to resolve.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DNSProtocolEndpoint.AppendParentSuffixes")))
                :INITFORM NIL)
               (PROTOCOLIFTYPE UINT16 :CIM-NAME "ProtocolIFType" :QUALIFIERS
                ((:DESCRIPTION "An enumeration that describes the IP version.")
                 (:VALUE-MAP ("0" ".." "4096" "4097" "32768.."))
                 (:VALUES
                  ("Unknown" "DMTF Reserved" "IPv4" "IPv6" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ProtocolEndpoint.ProtocolIFType")))
                :INITFORM NIL)
               (INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. To ensure uniqueness within the NameSpace, the value of InstanceID should be constructed using the following \"preferred\" algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon (:), and where <OrgID> must include a copyrighted, trademarked, or otherwise unique name that is owned by the business entity that is creating or defining the InstanceID or that is a registered ID assigned to the business entity by a recognized global authority. (This requirement is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness, <OrgID> must not contain a colon (:). When using this algorithm, the first colon to appear in InstanceID must appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and should not be reused to identify different underlying (real-world) elements. If the above \"preferred\" algorithm is not used, the defining entity must assure that the resulting InstanceID is not reused across any InstanceIDs produced by this or other providers for the NameSpace of this instance. 
For DMTF-defined instances, the \"preferred\" algorithm must be used with the <OrgID> set to CIM."))
                :INITFORM NIL)
               (ELEMENTNAME STRING :CIM-NAME "ElementName" :QUALIFIERS
                (:REQUIRED (:OVERRIDE "ElementName")
                 (:DESCRIPTION
                  "The user-friendly name for this instance of SettingData. In addition, the user-friendly name can be used as an index property for a search or query. (Note: The name does not have to be unique within a namespace.)"))
                :INITFORM NIL)
               (CHANGEABLETYPE UINT16 :CIM-NAME "ChangeableType" :QUALIFIERS
                ((:DESCRIPTION
                  "Enumeration indicating the type of setting. 0 \"Not Changeable - Persistent\" indicates the instance of SettingData represents primordial settings and shall not be modifiable. 1 \"Changeable - Transient\" indicates the SettingData represents modifiable settings that are not persisted. Establishing persistent settings from transient settings may be supported. 2 \"Changeable - Persistent\" indicates the SettingData represents a persistent configuration that may be modified. 3 \"Not Changeable - Transient\" indicates the SettingData represents a snapshot of the settings of the associated ManagedElement and is not persistent.")
                 (:VALUE-MAP ("0" "1" "2" "3"))
                 (:VALUES
                  ("Not Changeable - Persistent" "Changeable - Transient"
                   "Changeable - Persistent" "Not Changeable - Transient")))
                :INITFORM NIL)
               (CONFIGURATIONNAME STRING :CIM-NAME "ConfigurationName"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An instance of CIM_SettingData may correspond to a well-known configuration that exists for an associated CIM_ManagedElement. If the ConfigurationName property is non-NULL, the instance of CIM_SettingData shall correspond to a well-known configuration for a Managed Element, the value of the ConfigurationName property shall be the name of the configuration, and the ChangeableType property shall have the value 0 or 2. A value of NULL for the ConfigurationName property shall mean that the instance of CIM_SettingData does not correspond to a well-known configuration for a Managed Element or that this information is unknown."))
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
               (DNSSUFFIXESTOAPPEND (ARRAY STRING) :CIM-NAME
                "DNSSuffixesToAppend" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "DNS suffixes to append when attempting to resolve a hostname.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DNSProtocolEndpoint.DNSSuffixesToAppend")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_DNSGeneralSettingData")
              (:QUALIFIERS (:VERSION "2.14.0")
               (:UML-PACKAGE-PATH "CIM::Network::DNS")
               (:DESCRIPTION
                "The DNSGeneralSettingData class represents the system wide configuration options for the DNS client. Therefore, these configuration parameters are scoped to a computer system and are applicable to all of the network interfaces of the scoping system.")))