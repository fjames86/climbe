
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_StorageSetting.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_STORAGESETTING (CIM_SETTINGDATA)
              ((NOSINGLEPOINTOFFAILURE BOOLEAN :CIM-NAME
                "NoSinglePointOfFailure" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "Indicates the desired value for No Single Point of Failure. Possible values are false = single point of failure, and true = no single point of failure."))
                :INITFORM NIL)
               (DATAREDUNDANCYMAX UINT16 :CIM-NAME "DataRedundancyMax"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "DataRedundancyMax describes the maximum number of complete copies of data to be maintained. Examples would be RAID 5 where 1 copy is maintained and RAID 1 where 2 or more copies are maintained. Possible values are 1 to n. The desired redundancy is specified using DataRedundancyGoal, while the minimum is defined by DataRedundancyMin.")
                 (:MIN-VALUE "1")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageSetting.DataRedundancyMin"
                   "CIM_StorageSetting.DataRedundancyGoal")))
                :INITFORM NIL)
               (DATAREDUNDANCYMIN UINT16 :CIM-NAME "DataRedundancyMin"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "DataRedundancyMin describes the minimum number of complete copies of data to be maintained. Examples would be RAID 5 where 1 copy is maintained and RAID 1 where 2 or more copies are maintained. Possible values are 1 to n. The desired redundancy is specified using DataRedundancyGoal, while the maximum is defined by DataRedundancyMax.")
                 (:MIN-VALUE "1")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageSetting.DataRedundancyMax"
                   "CIM_StorageSetting.DataRedundancyGoal")))
                :INITFORM NIL)
               (DATAREDUNDANCYGOAL UINT16 :CIM-NAME "DataRedundancyGoal"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "DataRedundancyGoal describes the desired number of complete copies of data to be maintained. Examples would be RAID 5 where 1 copy is maintained and RAID 1 where 2 or more copies are maintained. Possible values are 1 to n. The bounds (max and min) for redundancy are defined using the properties, DataRedundancyMax and DataRedundancyMin.")
                 (:MIN-VALUE "1")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageSetting.DataRedundancyMax"
                   "CIM_StorageSetting.DataRedundancyMin")))
                :INITFORM NIL)
               (PACKAGEREDUNDANCYMAX UINT16 :CIM-NAME "PackageRedundancyMax"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "PackageRedundancyMax describes the maximum number of redundant packages to be used. For example, in the storage domain, package redundancy describes how many disk spindles can fail without data loss including, at most, one spare. An example would be RAID5 with a spare disk which would have a PackageRedundancy of 2. Possible values are 0 to n. The desired redundancy is specified using PackageRedundancyGoal, while the minimum is defined by PackageRedundancyMin.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageSetting.PackageRedundancyMin"
                   "CIM_StorageSetting.PackageRedundancyGoal")))
                :INITFORM NIL)
               (PACKAGEREDUNDANCYMIN UINT16 :CIM-NAME "PackageRedundancyMin"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "PackageRedundancyMin describes the minimum number of redundant packages to be used. For example, in the storage domain, package redundancy describes how many disk spindles can fail without data loss including, at most, one spare. An example would be RAID5 with a spare disk which would have a PackageRedundancy of 2. Possible values are 0 to n. The desired redundancy is specified using PackageRedundancyGoal, while the maximum is defined by PackageRedundancyMax.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageSetting.PackageRedundancyMax"
                   "CIM_StorageSetting.PackageRedundancyGoal")))
                :INITFORM NIL)
               (PACKAGEREDUNDANCYGOAL UINT16 :CIM-NAME "PackageRedundancyGoal"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "PackageRedundancyGoal describes the desired number of redundant packages to be used. For example, in the storage domain, package redundancy describes how many disk spindles can fail without data loss including, at most, one spare. An example would be RAID5 with a spare disk which would have a PackageRedundancy of 2. Possible values are 0 to n. The bounds (max and min) for redundancy are defined using the properties, PackageRedundancyMax and PackageRedundancyMin.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageSetting.PackageRedundancyMax"
                   "CIM_StorageSetting.PackageRedundancyMin")))
                :INITFORM NIL)
               (DELTARESERVATIONMAX UINT8 :CIM-NAME "DeltaReservationMax"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "DeltaReservationMax is a number between 1 (1%) and a 100 (100%) which specifies the maximum amount of space that should be reserved in a replica for caching changes. For a complete copy this would be 100%. The desired reservation is specified using DeltaReservationGoal, while the minimum is defined by DeltaReservationMin.")
                 (NIL "Percentage") (:MIN-VALUE "1") (:MAX-VALUE "100")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageSetting.DeltaReservationMin"
                   "CIM_StorageSetting.DeltaReservationGoal")))
                :INITFORM NIL)
               (DELTARESERVATIONMIN UINT8 :CIM-NAME "DeltaReservationMin"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "DeltaReservationMin is a number between 1 (1%) and a 100 (100%) which specifies the minimum amount of space that should be reserved in a replica for caching changes. For a complete copy this would be 100%. The desired reservation is specified using DeltaReservationGoal, while the maximum is defined by DeltaReservationMax.")
                 (NIL "Percentage") (:MIN-VALUE "1") (:MAX-VALUE "100")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageSetting.DeltaReservationMax"
                   "CIM_StorageSetting.DeltaReservationGoal")))
                :INITFORM NIL)
               (DELTARESERVATIONGOAL UINT8 :CIM-NAME "DeltaReservationGoal"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "DeltaReservationGoal is a number between 1 (1%) and a 100 (100%) which specifies the desired amount of space that should be reserved in a replica for caching changes. For a complete copy this would be 100%. The bounds (max and min) for the reservation are defined using the properties, DeltaReservationMax and DeltaReservationMin.")
                 (NIL "Percentage") (:MIN-VALUE "1") (:MAX-VALUE "100")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageSetting.DeltaReservationMin"
                   "CIM_StorageSetting.DeltaReservationMax")))
                :INITFORM NIL)
               (CHANGEABLETYPE UINT16 :CIM-NAME "ChangeableType" :QUALIFIERS
                ((:OVERRIDE "ChangeableType")
                 (:DESCRIPTION
                  "Enumeration indicating the type of setting. \"Fixed - Not Changeable\" settings are primordial. These setting are defined at the implementor of the class. \"Changeable - Transient\" is the type of setting produced by the \"CreateSetting\" method. A client can subsequently request that the implementation persist the generated and potentially modified setting indefinately. Only a \"Changeable - Transient\" setting SHALL be converted to a \"Changeable = Persistent\" setting; the setting SHALL NOT be changed back.")
                 (:VALUE-MAP ("0" "1" "2"))
                 (:VALUES
                  ("Fixed - Not Changeable" "Changeable - Transient"
                   "Changeable - Persistent")))
                :INITFORM NIL)
               (EXTENTSTRIPELENGTH UINT16 :CIM-NAME "ExtentStripeLength"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "ExtentStripeLength describes the number of underlying StorageExtents across which data is striped in the common striping-based storage organizations. This is also known as the number of 'members' or 'columns'. When used in a goal setting instance, ExtentStripeLength is the optimal desired value. The bounds (max and min) for Stripe Length are defined using the properties ExtentStripeLengthMax and ExtentStripeLengthMin. ExtentStripeLength MUST be set to NULL if the scoping StorageCapablities indicates that it is not supported in this context. ExtentStripeLength can be used in conjunction with CreateOrModifyElementFromELements to explicitly configure storage. An example would be RAID 0+1 with mirroring two stripe sets, each set being three wide. In this case CreateOrModifyElementFromElements would be passed a goal setting with DataRedundancy = 2 and ExtentStripeLength = 3. The size of the InElements array would be 6 and would contain the StorageExtents to be used to construct the StorageElement as a RAID 0+1. ExtentStripeLengthMin and ExtentStripeLengthMax are meaningless and wouldbe set to NULL. If the property is supported, and is part of StorageSettingWithHints it MAY be set to NULL. If used it will constrain the effects of Hint selections. When used in a Setting instance associated to a Volume, this property indicates the specific value that the Volume was created with, and ExtentStripeLengthMin and ExtentStripeLengthMax will be set to the same specific value.")
                 (:MIN-VALUE "1")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageSetting.ExtentStripeLengthMax"
                   "CIM_StorageSetting.ExtentStripeLengthMin")))
                :INITFORM NIL)
               (EXTENTSTRIPELENGTHMIN UINT16 :CIM-NAME "ExtentStripeLengthMin"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "ExtentStripeLength describes the number of underlying StorageExtents across which data is striped in the common striping-based storage organizations. This is also known as the number of 'members' or 'columns'. When used in a goal setting instance, ExtentStripeLengthMin is the minimum acceptable value. The desired Stripe Length is specified using ExtentStripeLength, while the maximum is defined by ExtentStripeLengthMax. ExtentStripeLengthMin MUST be set to NULL if the scoping StorageCapablities indicates that it is not supported in this context. If the property is supported, and is part of StorageSettingWithHints it MAY be set to NULL. If used it will constrain the effects of Hint selections. When used in a Setting instance associated to a Volume, this property is set to the specific value of ExtentStripeLength.")
                 (:MIN-VALUE "1")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageSetting.ExtentStripeLengthMax"
                   "CIM_StorageSetting.ExtentStripeLength")))
                :INITFORM NIL)
               (EXTENTSTRIPELENGTHMAX UINT16 :CIM-NAME "ExtentStripeLengthMax"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "ExtentStripeLength describes the number of underlying StorageExtents across which data is striped in the common striping-based storage organizations. This is also known as the number of 'members' or 'columns'. When used in a goal setting instance, ExtentStripeLengthMax is the maximum acceptable value. The desired Stripe Length is specified using ExtentStripeLength, while the minimum is defined by ExtentStripeLengthMin. ExtentStripeLengthMax MUST be set to NULL if the scoping StorageCapablities indicates that it is not supported in this context. If the property is supported, and is part of StorageSettingWithHints it MAY be set to NULL. If used it will constrain the effects of Hint selections. When used in a Setting instance associated to a Volume, this property is set to the specific value of ExtentStripeLength.")
                 (:MIN-VALUE "1")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageSetting.ExtentStripeLengthMin"
                   "CIM_StorageSetting.ExtentStripeLength")))
                :INITFORM NIL)
               (PARITYLAYOUT UINT16 :CIM-NAME "ParityLayout" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "ParityLayout specifies whether a parity-based storage organization is using rotated or non-rotated parity. When used in a goal setting instance, ParityLayout is the desired value. It MUST be set to NULL if the scoping StorageCapablities indicates that it is not supported in this context. If the property is supported, and is part of StorageSettingWithHints it MAY be set to NULL. If used it will constrain the effects of Hint selections. When used in a Setting instance associated to a Volume, this property indicates the specific value that the Volume was created with.")
                 (:VALUE-MAP ("1" "2"))
                 (:VALUES ("Non-rotated Parity" "Rotated Parity")))
                :INITFORM NIL)
               (USERDATASTRIPEDEPTH UINT64 :CIM-NAME "UserDataStripeDepth"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "UserDataStripeDepth describes the number of bytes forming a strip in common striping-based storage organizations. The strip is defined as the size of the portion of a stripe that lies on one extent. Thus, ExtentStripeLength * UserDataStripeDepth will yield the size of one stripe of user data. When used in a goal setting instance, UserDataStripeDepth is the optimal desired value. The bounds (max and min) for Stripe Depth are defined using the properties UserDataStripeDepthMax and UserDataStripeDepthMin. UserDataStripeDepth MUST be set to NULL if the scoping StorageCapablities indicates that it is not supported in this context. If the property is supported, and is part of StorageSettingWithHints it MAY be set to NULL. If used it will constrain the effects of Hint selections. When used in a Setting instance associated to a Volume, this property indicates the specific value that the Volume was created with, and UserDataStripeDepthMin and UserDataStripeDepthMax will be set to the same specific value.")
                 (NIL "Bytes") (:MIN-VALUE "1")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageSetting.UserDataStripeDepthMax"
                   "CIM_StorageSetting.UserDataStripeDepthMin")))
                :INITFORM NIL)
               (USERDATASTRIPEDEPTHMIN UINT64 :CIM-NAME
                "UserDataStripeDepthMin" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "UserDataStripeDepth describes the number of bytes forming a strip in common striping-based storage organizations. The strip is defined as the size of the portion of a stripe that lies on one extent. Thus, ExtentStripeLength * UserDataStripeDepth will yield the size of one stripe of user data. When used in a goal setting instance, UserDataStripeDepthMin is the minimum acceptable value. The desired Stripe Depth is specified using UserDataStripeDepth, while the maximum is defined by UserDataStripeDepthMax. UserDataStripeDepthMin MUST be set to NULL if the scoping StorageCapablities indicates that it is not supported in this context. If the property is supported, and is part of StorageSettingWithHints it MAY be set to NULL. If used it will constrain the effects of Hint selections. When used in a Setting instance associated to a Volume, this property is set to the specific value of UserDataStripeDepth.")
                 (NIL "Bytes") (:MIN-VALUE "1")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageSetting.UserDataStripeDepthMax"
                   "CIM_StorageSetting.UserDataStripeDepth")))
                :INITFORM NIL)
               (USERDATASTRIPEDEPTHMAX UINT64 :CIM-NAME
                "UserDataStripeDepthMax" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "UserDataStripeDepth describes the number of bytes forming a strip in common striping-based storage organizations. The strip is defined as the size of the portion of a stripe that lies on one extent. Thus, ExtentStripeLength * UserDataStripeDepth will yield the size of one stripe of user data. When used in a goal setting instance, UserDataStripeDepthMax is the maximum acceptable value. The desired Stripe Depth is specified using UserDataStripeDepthGoal, while the minimum is defined by UserDataStripeDepthMin. UserDataStripeDepthMax MUST be set to NULL if the scoping StorageCapablities indicates that it is not supported in this context. If the property is supported, and is part of StorageSettingwWithHints it MAY be set to NULL. If used it will constrain the effects of Hint selections. When used in a Setting instance associated to a Volume, this property is set to the specific value of UserDataStripeDepth.")
                 (NIL "Bytes") (:MIN-VALUE "1")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageSetting.UserDataStripeDepthMin"
                   "CIM_StorageSetting.UserDataStripeDepth")))
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
              (:CIM-NAME "CIM_StorageSetting")
              (:QUALIFIERS (:VERSION "2.11.0")
               (:UML-PACKAGE-PATH "CIM::Device::StorageServices")
               (:DESCRIPTION
                "StorageSetting is roughly equivalent to a Service Level Agreement (SLA) It defines the characteristics, qualities of service and goals when used in a CreateOrModifyElement FromStoragePool or CreateOrModifyStoragePool method in the StorageConfigurationService. It specifies a series of properties with Maximum and Minimum values that define the (inclusive) bounds that the object should maintain. Note that the setting is associated to a StorageVolume or LogicalDisk, using ElementSetting. 
The use of these properties differs depending on whether the StorageSetting instance is being used as a goal for a configuration operation or being used as a Service Level Agreement for a created Volume. In addition the properties fall into two categories: The QOS properties(PackageRedundancy, Data Redundancy, & NoSinglePointOfFailure) and the Detailed RAID properties(ExtentStripeLength, ParityLayout, and UserDataStripeDepth). In a Setting used as a goal, the QOS properties are required as a set; The Detailed RAID properties(if supported as indicated by the scoping StorageCapabilities instance) may be used optionally in any combination. The implementation MUST supply it's own best practice in the case where one or more supported RAID properties are not supplied. In this situation the use of StorageSettingWithHints can be useful to provide direction to the implementation. 
In a Setting used as a service agreement for a Volume, the QOS properties reflect the Service Level Agreement, with goal, min, & max. The actual current service level is exposed by corresponding values in StorageExtent. 
The Detailed RAID properties, by contrast, reflect specific values that reflect the RAID construction of the Volume. Only the primary values are meaningful; Min and Max are set to match. 
Certain StorageSetting instances may be classed as \"Fixed\", by using the \"ChangeableType\" property, indicating the setting is preset. Such settings are used when the possible setting variations are low enough to be instantiated in their entirety. The StorageCapabilities \"CreateSetting\" method MAY NOT be used to return settings that are not changeable. 
Other StorageSetting instances are created using the \"CreateSetting\" method. If the capabilities specifies ranges, then the setting can be used by a client to narrow the range to particular values within the range. In other words, the capabilities MAY be broad, but the related setting MUST be as capable or less capable, that is more narrowly defined, before it is used to create or modify resources. 
These created StorageSetting instances MUST have their \"ChangeableType\" property = 1, \"Changeable - Transient\". 
GeneratedSettings MAY not remain after the restart or reset of the implementation. They may be deleted by implementation at any time. A reasonable minimal time to retain the generated transient settings is five minutes, although there is no minimal retention time.")))