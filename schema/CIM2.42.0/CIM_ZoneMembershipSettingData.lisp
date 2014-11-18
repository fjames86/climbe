
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ZoneMembershipSettingData.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ZONEMEMBERSHIPSETTINGDATA
              (CIM_CONNECTIVITYMEMBERSHIPSETTINGDATA)
              ((CONNECTIVITYMEMBERTYPE UINT16 :CIM-NAME
                "ConnectivityMemberType" :QUALIFIERS
                ((:OVERRIDE "ConnectivityMemberType")
                 (:DESCRIPTION
                  "ConnectivityMemberType specifies the type of identification used in the ConnectivityMemberID field. For Fibre Channel, several of the enumerated values require additional explanation: 
* A ConnectivityMemberType equal to 2 (Permanent Address) indicates that an NxPort WWN value should be specified in the related ConnectivityMemberID property. 
* A ConnectivityMemberType of 3 (Network Address) indicates that an NxPort Address ID value should be specified in the related ConnectivityMemberID property. 
* A ConnectivityMemberType of 4 (Switch Port ID) indicates that a Domain or Port Number value should be specified in the related ConnectivityMemberID property. 
* A ConnectivityMemberType of 5 (Logical Port Group) indicates that a Node WWN value should be specified in the related ConnectivityMemberID property.")
                 :REQUIRED
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6" ".." "0x8000.."))
                 (:VALUES
                  ("Unknown" "Other" "Permanent Address" "Network Address"
                   "Switch Port ID" "Logical Port Group"
                   "Connectivity Collection" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ConnectivityMembershipSettingData.ConnectivityMemberID"
                   "CIM_ConnectivityMembershipSettingData.OtherConnectivityMemberType")))
                :INITFORM NIL)
               (OTHERCONNECTIVITYMEMBERTYPE STRING :CIM-NAME
                "OtherConnectivityMemberType" :QUALIFIERS
                ((:DESCRIPTION
                  "This property specifies the type of identification used in the ConnectivityMemberID field, when ConnectivityMemberType is 1, \"Other\".")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ConnectivityMembershipSettingData.ConnectivityMemberType")))
                :INITFORM NIL)
               (CONNECTIVITYMEMBERID STRING :CIM-NAME "ConnectivityMemberID"
                :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "The identification of the member, based on the type specified by ConnectivityMemberType.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ConnectivityMembershipSettingData.ConnectivityMemberType")))
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
                :INITFORM NIL))
              (:CIM-NAME "CIM_ZoneMembershipSettingData")
              (:QUALIFIERS (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::FC")
               (:DESCRIPTION
                "ZoneMembershipSettingData provides the identification criteria for possible Zone and ZoneAlias members.")))