
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_VLANEndpointSettingData.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_VLANENDPOINTSETTINGDATA (CIM_SETTINGDATA)
              ((NATIVEVLAN UINT16 :CIM-NAME "NativeVLAN" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "VLAN Id that is used to tag untagged traffic received on this trunk endpoint/port. This property is applicable only when the endpoint is operating in trunking mode (determined by examining the SwitchEndpointMode property).")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_VLANEndpoint.OperationalEndpointMode")))
                :INITFORM NIL)
               (DEFAULTVLAN UINT16 :CIM-NAME "DefaultVLAN" :QUALIFIERS
                ((:DESCRIPTION
                  "Default value for the native VLAN on this trunk endpoint/port. This property is applicable only when the endpoint is operating in trunking mode (determined by examining the OperationalEndpointMode property).")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_VLANEndpoint.OperationalEndpointMode")))
                :INITFORM NIL)
               (ACCESSVLAN UINT16 :CIM-NAME "AccessVLAN" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The access VLAN for the referenced VLANEndpoint.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_VLANEndpoint.OperationalEndpointMode")))
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
               (PRUNEELIGIBLEVLANLIST (ARRAY UINT16) :CIM-NAME
                "PruneEligibleVLANList" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "If a VLAN Id is part of this array, then the system MAY prune that VLAN on the related trunk endpoint/port. This property is applicable only when the endpoint is operating in trunking mode (determined by examining the OperationalEndpointMode property).")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_VLANEndpoint.OperationalEndpointMode")))
                :INITFORM NIL)
               (TRUNKEDVLANLIST (ARRAY UINT16) :CIM-NAME "TrunkedVLANList"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "If a VLAN Id is part of this array, then the system MAY trunk the traffic on the related endpoint/port. This property is applicable only when the endpoint is operating in trunking mode (determined by examining the OperationalEndpointMode property).")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_VLANEndpoint.OperationalEndpointMode")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_VLANEndpointSettingData")
              (:QUALIFIERS (:VERSION "2.27.0")
               (:UML-PACKAGE-PATH "CIM::Network::VLAN")
               (:DESCRIPTION
                "The VLAN configuration data for an endpoint. Note that certain properties only apply based on the value in the VLANEndpoint. OperationalEndpointMode property. If it is set to trunking mode then NativeVLAN, PruneEligibleVLANList, DefaultVLAN and TrunkedVLANList are applicable. If it is set to in access mode, then AccessVLAN is applicable. An instance of this class is associated to the endpoint to which it applies using ElementSettingData.")))