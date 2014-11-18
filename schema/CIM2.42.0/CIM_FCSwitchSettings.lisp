
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_FCSwitchSettings.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_FCSWITCHSETTINGS (CIM_SETTINGDATA)
              ((PREFERREDDOMAINID UINT8 :CIM-NAME "PreferredDomainID"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The preferred domainID for the switch. If DomainIDLocked is true, then this property will be the required DomainID for the switch.")
                 (:MIN-VALUE "1") (:MAX-VALUE "239")
                 (:MAPPING-STRINGS
                  ("FC-SWAPI.INCITS-T11|UcUnitConfigGetDomainID"
                   "GC-GS.INCITS-T11|InterconnectElement|DomainIdentifier"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_FCSwitchSettings.DomainIDLocked")))
                :INITFORM NIL)
               (DOMAINIDLOCKED BOOLEAN :CIM-NAME "DomainIDLocked" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "Boolean that indicates if the switch can negotiate a new domainID when the configured domainID is unavailable. If this value is true, a domainID conflict will cause the fabric merge process to fail.")
                 (:MAPPING-STRINGS
                  ("FC-SWAPI.INCITS-T11|UcUnitConfigGetDomainIDLocked"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_FCSwitchSettings.PreferredDomainID")))
                :INITFORM NIL)
               (PRINCIPALPRIORITY UINT16 :CIM-NAME "PrincipalPriority"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "This value affects the selection of a principal switch within the fabric. The value indirectly corresponds to the FC-FS switch_priority value used during principal switch selection. 
- Principal: Attempt to become the principal switch in the fabric. 
- Subordinate: Attempt not to become the principal switch in the fabric. 
- Any: No preference.")
                 (:VALUE-MAP ("2" "3" "4"))
                 (:VALUES ("Principal" "Subordinate" "Any"))
                 (:MAPPING-STRINGS
                  ("FC-SWAPI.INCITS-T11|SWAPI_PRINCIPAL_PRIORITY_T")))
                :INITFORM "3")
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
                :INITFORM NIL))
              (:CIM-NAME "CIM_FCSwitchSettings")
              (:QUALIFIERS (:VERSION "2.11.0")
               (:UML-PACKAGE-PATH "CIM::Device::FC")
               (:DESCRIPTION
                "A ComputerSystem that supports FC Switch capabilities and can be configured using the FCSwitchConfig class.")))