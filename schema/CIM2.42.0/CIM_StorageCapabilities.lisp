
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_StorageCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_STORAGECAPABILITIES (CIM_CAPABILITIES)
              ((ELEMENTTYPE UINT16 :CIM-NAME "ElementType" :QUALIFIERS
                ((:DESCRIPTION
                  "Enumeration indicating the type of element to which this StorageCapabilities applies.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6" "7"))
                 (:VALUES
                  ("Unknown" "Reserved" "Any Type" "StorageVolume"
                   "StorageExtent" "StoragePool" "StorageConfigurationService"
                   "LogicalDisk")))
                :INITFORM NIL)
               (NOSINGLEPOINTOFFAILURE BOOLEAN :CIM-NAME
                "NoSinglePointOfFailure" :QUALIFIERS
                ((:DESCRIPTION
                  "Indicates whether or not the associated element supports no single point of failure. Values are: FALSE = does not support no single point of failure, and TRUE = supports no single point of failure.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageCapabilities.NoSinglePointOfFailureDefault")))
                :INITFORM NIL)
               (NOSINGLEPOINTOFFAILUREDEFAULT BOOLEAN :CIM-NAME
                "NoSinglePointOfFailureDefault" :QUALIFIERS
                ((:DESCRIPTION
                  "Indicates the default value for the NoSinglePointOfFailure property.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageCapabilities.NoSinglePointOfFailure")))
                :INITFORM NIL)
               (DATAREDUNDANCYMAX UINT16 :CIM-NAME "DataRedundancyMax"
                :QUALIFIERS
                ((:DESCRIPTION
                  "DataRedundancyMax describes the maximum number of complete copies of data that can be maintained. Examples would be RAID 5 (where 1 copy is maintained) and RAID 1 (where 2 or more copies are maintained). Possible values are 1 to n. The default redundancy is specified using DataRedundancyDefault, while the minimum is defined by DataRedundancyMin.")
                 (:MIN-VALUE "1")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageCapabilities.DataRedundancyMin"
                   "CIM_StorageCapabilities.DataRedundancyDefault")))
                :INITFORM NIL)
               (DATAREDUNDANCYMIN UINT16 :CIM-NAME "DataRedundancyMin"
                :QUALIFIERS
                ((:DESCRIPTION
                  "DataRedundancyMin describes the minimum number of complete copies of data that can be maintained. Examples would be RAID 5 where 1 copy is maintained and RAID 1 where 2 or more copies are maintained). Possible values are 1 to n. The default redundancy is specified using DataRedundancyDefault, while the maximum is defined by DataRedundancyMax.")
                 (:MIN-VALUE "1")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageCapabilities.DataRedundancyMax"
                   "CIM_StorageCapabilities.DataRedundancyDefault")))
                :INITFORM NIL)
               (DATAREDUNDANCYDEFAULT UINT16 :CIM-NAME "DataRedundancyDefault"
                :QUALIFIERS
                ((:DESCRIPTION
                  "DataRedundancyDefault describes the default number of complete copies of data that can be maintained. Examples would be RAID 5 where 1 copy is maintained and RAID 1 where 2 or more copies are maintained. Possible values are 1 to n. The bounds for the redundancy (max and min) are defined by DataRedundancyMax and DataRedundancyMin.")
                 (:MIN-VALUE "1")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageCapabilities.DataRedundancyMax"
                   "CIM_StorageCapabilities.DataRedundancyMin")))
                :INITFORM NIL)
               (PACKAGEREDUNDANCYMAX UINT16 :CIM-NAME "PackageRedundancyMax"
                :QUALIFIERS
                ((:DESCRIPTION
                  "PackageRedundancyMax describes the maximum number of redundant packages that can be used. For example, in the storage domain, package redundancy describes how many disk spindles can fail without data loss including, at most, one spare. An example would be RAID5 with a spare disk which would have a PackageRedundancy of 2. Possible values are 0 to n. The default redundancy is specified using PackageRedundancyDefault, while the maximum is defined by PackageRedundancyMax.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageCapabilities.PackageRedundancyMin"
                   "CIM_StorageCapabilities.PackageRedundancyDefault")))
                :INITFORM NIL)
               (PACKAGEREDUNDANCYMIN UINT16 :CIM-NAME "PackageRedundancyMin"
                :QUALIFIERS
                ((:DESCRIPTION
                  "PackageRedundancyMin describes the minimum number of redundant packages that can be used. For example, in the storage domain, package redundancy describes how many disk spindles can fail without data loss including, at most, one spare. An example would be RAID5 with a spare disk which would have a PackageRedundancy of 2. Possible values are 0 to n. The default redundancy is specified using PackageRedundancyDefault, while the minimum is defined by PackageRedundancyMin.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageCapabilities.PackageRedundancyMax"
                   "CIM_StorageCapabilities.PackageRedundancyDefault")))
                :INITFORM NIL)
               (PACKAGEREDUNDANCYDEFAULT UINT16 :CIM-NAME
                "PackageRedundancyDefault" :QUALIFIERS
                ((:DESCRIPTION
                  "PackageRedundancyDefault describes the default number of redundant packages that will be used. For example, in the storage domain, package redundancy describes how many disk spindles can fail without data loss including, at most, one spare. An example would be RAID5 with a spare disk which would have a PackageRedundancy of 2. Possible values are 0 to n. The bounds for redundancy are specified using the properties, PackageRedundancyMax and PackageRedundancyMin.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageCapabilities.PackageRedundancyMin"
                   "CIM_StorageCapabilities.PackageRedundancyMax")))
                :INITFORM NIL)
               (DELTARESERVATIONMAX UINT16 :CIM-NAME "DeltaReservationMax"
                :QUALIFIERS
                ((:DESCRIPTION
                  "DeltaReservatioMax is a number between 1 (1%) and a 100 (100%) that specifies the maximum amount of space reserved in a replica for caching changes. For a complete copy this would be 100%, but it can be lower in some implementations. This parameter sets the upper limit, while DeltaReservationMin sets the lower limit.")
                 (NIL "Percentage") (:MIN-VALUE "0") (:MAX-VALUE "100")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageCapabilities.DeltaReservationMin"
                   "CIM_StorageCapabilities.DeltaReservationDefault")))
                :INITFORM NIL)
               (DELTARESERVATIONMIN UINT16 :CIM-NAME "DeltaReservationMin"
                :QUALIFIERS
                ((:DESCRIPTION
                  "DeltaReservationMin is a number between 1 (1%) and a 100 (100%) that specifies the minimum amount of space that should be reserved in a replica for caching changes. For a complete copy this would be 100%, but it can be lower in some implementations. This parameter sets the lower limit, while DeltaReservationMax sets the upper limit.")
                 (NIL "Percentage") (:MIN-VALUE "0") (:MAX-VALUE "100")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageCapabilities.DeltaReservationMax"
                   "CIM_StorageCapabilities.DeltaReservationDefault")))
                :INITFORM NIL)
               (DELTARESERVATIONDEFAULT UINT16 :CIM-NAME
                "DeltaReservationDefault" :QUALIFIERS
                ((:DESCRIPTION
                  "Delta reservation is a number between 1 (1%) and a 100 (100%) that specifies how much space should be reserved by default in a replica for caching changes. For a complete copy this would be 100%, but it can be lower in some implementations. This parameter sets the default value, while DeletaReservationMax and DeltReservationMin set the upper and lower bounds.")
                 (NIL "Percentage") (:MIN-VALUE "0") (:MAX-VALUE "100")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageCapabilities.DeltaReservationMax"
                   "CIM_StorageCapabilities.DeltaReservationMin")))
                :INITFORM NIL)
               (EXTENTSTRIPELENGTHDEFAULT UINT16 :CIM-NAME
                "ExtentStripeLengthDefault" :QUALIFIERS
                ((:DESCRIPTION
                  "Extent Stripe Length describes the number of underlying StorageExtents across which data is striped in the common striping-based storage organizations. This is also known as the number of 'members' or 'columns'. 
A NULL value for ExtentStripeLengthDefault indicates that the system does not support configuration of storage by specifying Stripe Length. 
If Extent Stripe Length is supported, and this Capabilities instance is associated with a pool that was created with a range of QOS then ExtentStripeLengthDefault represents the default value. Other available values(such as min, max, and discrete values) can be determined by using the 'GetSupportedStripeLengths' and 'GetSupportedStripeLengthRange' methods. 
If Extent Stripe Length is supported and the pool was created with a single specific QOS, representing a Raid group, set, or rank, then this property represents the current/fixed value for the pool, and Extent Stripe Length is not supported in subsequent creation of elements from this pool. Consequently, the 'GetSupportedStripeLength' methods cannot be used, and in a StorageSetting instance used as a goal when creating or modifying a child element of the pool, ExtentStripeLengthGoal, ExtentStripeLengthMin, and ExtentStripeLengthMax MUST be set to NULL.")
                 (:MIN-VALUE "1"))
                :INITFORM NIL)
               (PARITYLAYOUTDEFAULT UINT16 :CIM-NAME "ParityLayoutDefault"
                :QUALIFIERS
                ((:DESCRIPTION
                  "ParityLayout specifies whether a parity-based storage organization is using rotated or non-rotated parity. If this capabilities instance is associated with a pool that was created with a range of QOS then ParityLayoutDefault represents the default value. Other available values can be determined by using the 'GetSupportedParityLayouts' method. If the pool was created with a single specific QOS, representing a Raid group, set, or rank, then this property represents the current/fixed value for the pool, and ParityLayout is not supported in subsequent creation of elements from this pool. Consequently, the 'GetSupportedParityLayouts' method cannot be used, and the ParityLayoutGoal property in StorageSetting instances used in child element operations on this pool MUST be set to NULL. A NULL value for ParityLayoutDefault indicates that the system does not support configuration of storage by specifying ParityLayout.")
                 (:VALUE-MAP ("2" "3"))
                 (:VALUES ("Non-Rotated Parity" "Rotated Parity")))
                :INITFORM NIL)
               (USERDATASTRIPEDEPTHDEFAULT UINT64 :CIM-NAME
                "UserDataStripeDepthDefault" :QUALIFIERS
                ((:DESCRIPTION
                  "User Data Stripe Depth describes the number of bytes forming a strip in common striping-based storage organizations. The strip is defined as the size of the portion of a stripe that lies on one extent. Thus, ExtentStripeLength * UserDataStripeDepth will yield the size of one stripe of user data. A NULL value for UserDataStripeDepthDefault indicates that the system does not support configuration of storage by specifying Stripe Depth. 
If User Data Stripe Depth is supported, and this Capabilities instance is associated with a pool that was created with a range of QOS then UserDataStripeDepthDefault represents the default value. Other available values(such as min, max, and discrete values) can be determined by using the 'GetSupportedStripeDepths' and 'GetSupportedStripeDepthRange' methods. 
If User Data Stripe Depth is supported and the pool was created with a single specific QOS, representing a Raid group, set, or rank, then this property represents the current/fixed value for the pool, and User Data Stripe Depth is not supported in subsequent creation of elements from this pool. Consequently, the 'GetSupportedStripeDepth' methods cannot be used, and in a StorageSetting instance used as a goal when creating or modifying a child element of the pool, UserDataStripeDepthGoal, UserDataStripeDepthMin, and UserDataStripeDepthMax MUST be set to NULL.")
                 (NIL "Bytes") (:MIN-VALUE "1"))
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
              (:CIM-NAME "CIM_StorageCapabilities")
              (:QUALIFIERS (:VERSION "2.11.0")
               (:UML-PACKAGE-PATH "CIM::Device::StorageServices")
               (:DESCRIPTION
                "A subclass of Capabilities that defines the Capabilities of a StorageService or StoragePool. For example, an instance of StorageCapabilities could be associated with either a StorageConfigurationService or StoragePool by using ElementCapabilities.")))
(DEFCIM-METHOD CREATESETTING
    ((INSTANCE CIM_STORAGECAPABILITIES)
     (SETTINGTYPE UINT16 "SettingType" :IN
      (:DESCRIPTION
       "If 'Default' is passed for the CreateDefault parameter, the Max, Goal, and Min setting attributes are set to the Default values of the parent StorageCapabilities when the instance is created. 
If set to 'Goal' the new StorageSetting attributes are set to the related attributes of the parent StorageCapabilities, e.g. Min to Min, Goal to Default, and Max to Max. 

This method maybe deprecated in lieu of intrinsics once limitations in the CIM Operations are addressed.")
      (:VALUE-MAP ("2" "3")) (:VALUES ("Default" "Goal")))
     (NEWSETTING "CIM_StorageSetting" "NewSetting" :IN :OUT
      (:DESCRIPTION "Reference to the created StorageSetting instance.")))
    ((:CIM-NAME "CreateSetting")
     (:QUALIFIERS
      (:DESCRIPTION
       "Method to create and populate a StorageSetting instance from a StorageCapability instance. This removes the need to populate default settings and other settings in the context of each StorageCapabilities (which could be numerous). If the underlying instrumentation supports the StorageSettingWithHints subclass, then an instance of that class will be created instead.")
      (:VALUE-MAP ("0" "1" "2" "3" "4" "5" ".." "32768..65535"))
      (:VALUES
       ("Success" "Not Supported" "Unspecified Error" "Timeout" "Failed"
        "Invalid Parameter" "DMTF Reserved" "Vendor Specific")))))
(DEFCIM-METHOD GETSUPPORTEDPARITYLAYOUTS
    ((INSTANCE CIM_STORAGECAPABILITIES)
     (PARITYLAYOUT (ARRAY UINT16) "ParityLayout" :IN :OUT
      (:DESCRIPTION
       "List of supported Parity for a Volume/Pool creation or modification.")
      (:VALUE-MAP ("2" "3")) (:VALUES ("Non-Rotated Parity" "Rotated Parity"))
      (:ARRAYTYPE "Indexed")))
    ((:CIM-NAME "GetSupportedParityLayouts")
     (:QUALIFIERS
      (:DESCRIPTION
       "For systems that support Parity-based storage organizations for volume or pool creation, this method can be used to the supported parity layouts.")
      (:VALUE-MAP ("0" "1" "2"))
      (:VALUES
       ("Method completed OK" "Method not supported"
        "Choice not aavailable for this capability")))))