
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PrintSupply.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PRINTSUPPLY (CIM_PRINTERELEMENT)
              ((LOCALIZEDDESCRIPTION STRING :CIM-NAME "LocalizedDescription"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A free-form text description of this PrintSupply in the localization specified by CIM_Printer.CurrentNaturalLanguage.")
                 (:MAX-LEN "255")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Printer-MIB.prtMarkerSuppliesDescription"
                   "MIB.IETF|Finisher-MIB.finSupplyDescription"
                   "MIB.IETF|Printer-MIB.PrtLocalizedDescriptionStringTC"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Printer.CurrentNaturalLanguage")))
                :INITFORM NIL)
               (CLASSIFICATION UINT32 :CIM-NAME "Classification" :QUALIFIERS
                ((:DESCRIPTION
                  "Indicates whether this PrintSupply instance represents a PrintSupply that is consumed or a receptacle that is filled.")
                 (:VALUE-MAP ("1" "3" "4" ".."))
                 (:VALUES
                  ("Other" "SupplyThatIsConsumed" "ReceptacleThatIsFilled"
                   "DMTF Reserved"))
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Printer-MIB.prtMarkerSuppliesClass"
                   "MIB.IETF|Finisher-MIB.finSupplyClass"
                   "MIB.IETF|Printer-MIB.PrtMarkerSuppliesClassTC"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PrintSupply.OtherClassification")))
                :INITFORM NIL)
               (OTHERCLASSIFICATION STRING :CIM-NAME "OtherClassification"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A free-form string that describes the PrintSupply classification when the value of the Classification property is equal to 1 (Other).")
                 (:MAX-LEN "255")
                 (:MODEL-CORRESPONDENCE ("CIM_PrintSupply.Classification")))
                :INITFORM NIL)
               (TYPE UINT32 :CIM-NAME "Type" :QUALIFIERS
                ((:DESCRIPTION "The type of this PrintSupply.")
                 (:VALUE-MAP
                  ("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14"
                   "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25" "26"
                   "27" "28" "29" "30" "31" "32" "33" "34" ".."))
                 (:VALUES
                  ("Other" "Unknown" "Toner" "WasteToner" "Ink" "InkCartridge"
                   "InkRibbon" "WasteInk" "Opc" "Developer" "FuserOil"
                   "SolidWax" "RibbonWax" "WasteWax" "Fuser" "CoronaWire"
                   "FuserOilWick" "CleanerUnit" "FuserCleaningPad"
                   "TransferUnit" "TonerCartridge" "FuserOiler" "Water"
                   "WasteWater" "GlueWaterAdditive" "WastePaper"
                   "BindingSupply" "BandingSupply" "StitchingWire" "ShrinkWrap"
                   "PaperWrap" "Staples" "Inserts" "Covers" "DMTF Reserved"))
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Printer-MIB.prtMarkerSuppliesType"
                   "MIB.IETF|Finisher-MIB.finSupplyType"
                   "MIB.IETF|IANA-PRINTER-MIB.PrtMarkerSuppliesTypeTC"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PrintSupply.OtherTypeDescription")))
                :INITFORM NIL)
               (OTHERTYPEDESCRIPTION STRING :CIM-NAME "OtherTypeDescription"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A free-form string that describes the PrintSupply type when the value of the Type property is equal to 1 (Other).")
                 (:MAX-LEN "255")
                 (:MODEL-CORRESPONDENCE ("CIM_PrintSupply.Type")))
                :INITFORM NIL)
               (SUPPLYUNIT UINT32 :CIM-NAME "SupplyUnit" :QUALIFIERS
                ((:DESCRIPTION
                  "Unit of measure for this PrintSupply container (for a supply that is consumed) or receptacle (for waste that is produced).")
                 (:VALUE-MAP
                  ("1" "2" "3" "4" "7" "8" "11" "12" "13" "14" "15" "16" "17"
                   "18" "19" ".."))
                 (:VALUES
                  ("Other" "Unknown" "TenThousandthsOfInches" "Micrometers"
                   "Impressions" "Sheets" "Hours" "ThousandthsOfOunces"
                   "TenthsOfGrams" "HundrethsOfFluidOunces"
                   "TenthsOfMilliliters" "Feet" "Meters" "Items" "Percent"
                   "DMTF Reserved"))
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Printer-MIB.prtMarkerSuppliesSupplyUnit"
                   "MIB.IETF|Finisher-MIB.finSupplyUnit"
                   "MIB.IETF|Printer-MIB.PrtMarkerSuppliesSupplyUnitTC"))
                 (:MODEL-CORRESPONDENCE ("CIM_PrintSupply.OtherSupplyUnit")))
                :INITFORM NIL)
               (OTHERSUPPLYUNIT STRING :CIM-NAME "OtherSupplyUnit" :QUALIFIERS
                ((:DESCRIPTION
                  "A free-form string that describes the PrintSupply unit when the value of the SupplyUnit property is equal to 1 (Other).")
                 (:MAX-LEN "255")
                 (:MODEL-CORRESPONDENCE ("CIM_PrintSupply.SupplyUnit")))
                :INITFORM NIL)
               (MAXCAPACITYBASIS UINT16 :CIM-NAME "MaxCapacityBasis"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The basis for the limit property MaxCapacity, that specifies whether a meaningful value is available. 1 (Other) means the Printer places no restrictions on capacity and MaxCapacity shall be null. 2 (Unknown) means the Printer cannot sense a meaningful value and MaxCapacity shall be null. 3 (Actual) means the Printer can sense a meaningful value and MaxCapacity shall be present.")
                 (:VALUE-MAP ("1" "2" "3" ".."))
                 (:VALUES ("Other" "Unknown" "Actual" "DMTF Reserved"))
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Printer-MIB.prtMarkerSuppliesMaxCapacity"
                   "MIB.IETF|Finisher-MIB.finSuppyMaxCapacity"))
                 (:MODEL-CORRESPONDENCE ("CIM_PrintSupply.MaxCapacity")))
                :INITFORM NIL)
               (MAXCAPACITY UINT32 :CIM-NAME "MaxCapacity" :QUALIFIERS
                ((:DESCRIPTION
                  "The maximum capacity of this PrintSupply container (for a supply that is consumed) or receptacle (for waste that is produced) in units specified by CIM_PrintSupply.SupplyUnit. If this Printer can reliably sense this value, the value is sensed by the Printer and cannot be changed by the system administrator; otherwise, the value may be changed out-of-band by the system administrator.")
                 (:MIN-VALUE "0") (:MAX-VALUE "2147483647")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Printer-MIB.prtMarkerSuppliesMaxCapacity"
                   "MIB.IETF|Finisher-MIB.finSuppyMaxCapacity"
                   "MIB.IETF|Printer-MIB.prtMarkerSuppliesSupplyUnit"
                   "MIB.IETF|Finisher-MIB.finSupplyUnit"
                   "MIB.IETF|Printer-MIB.PrtMarkerSuppliesSupplyUnitTC"))
                 (:MODEL-CORRESPONDENCE ("CIM_PrintSupply.MaxCapacityBasis")))
                :INITFORM NIL)
               (REMAININGCAPACITYBASIS UINT16 :CIM-NAME
                "RemainingCapacityBasis" :QUALIFIERS
                ((:DESCRIPTION
                  "The basis for the gauge property RemainingCapacity, that specifies whether a meaningful value is available. 1 (Other) means the Printer places no restrictions on capacity and RemainingCapacity shall be null. 2 (Unknown) means the Printer cannot sense a meaningful value and RemainingCapacity shall be null. 3 (Actual) means the Printer can sense a meaningful value and RemainingCapacity shall be present. 4 (AtLeastOne) means that the Printer can only sense that at least one capacity unit remains and RemainingCapacity shall be present and shall contain the value zero or one.")
                 (:VALUE-MAP ("1" "2" "3" "4" ".."))
                 (:VALUES
                  ("Other" "Unknown" "Actual" "AtLeastOne" "DMTF Reserved"))
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Printer-MIB.prtMarkerSuppliesLevel"
                   "MIB.IETF|Finisher-MIB.finSuppyCurrentLevel"))
                 (:MODEL-CORRESPONDENCE ("CIM_PrintSupply.RemainingCapacity")))
                :INITFORM NIL)
               (REMAININGCAPACITY UINT32 :CIM-NAME "RemainingCapacity"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The current remaining level of the supply if this PrintSupply is a container (for a supply that is consumed) or the remaining capacity if this PrintSupply is a receptacle (for waste that is produced), in units specified by CIM_PrintSupply.SupplyUnit. If this Printer can reliably sense this value, the value is sensed by the Printer and cannot be changed by the system administrator; otherwise, the value may be changed out-of-band by the system administrator.")
                 (:MIN-VALUE "0") (:MAX-VALUE "2147483647")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Printer-MIB.prtMarkerSuppliesLevel"
                   "MIB.IETF|Finisher-MIB.finSuppyCurrentLevel"
                   "MIB.IETF|Printer-MIB.prtMarkerSuppliesSupplyUnit"
                   "MIB.IETF|Finisher-MIB.finSupplyUnit"
                   "MIB.IETF|Printer-MIB.PrtMarkerSuppliesSupplyUnitTC"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PrintSupply.RemainingCapacityBasis")))
                :INITFORM NIL)
               (COLORANTROLE UINT32 :CIM-NAME "ColorantRole" :QUALIFIERS
                ((:DESCRIPTION
                  "If this PrintSupply does not represent a PrintMarker colorant, then this property shall be null. If this PrintSupply does represent a PrintMarker colorant, then this property shall be present and shall denote the role played by this PrintMarker colorant.")
                 (:VALUE-MAP ("1" "3" "4" ".."))
                 (:VALUES ("Other" "Process" "Spot" "DMTF Reserved"))
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Printer-MIB.prtMarkerColorantRole"
                   "MIB.IETF|Printer-MIB.PrtMarkerColorantRoleTC"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PrintSupply.OtherColorantRole"
                   "CIM_PrintMarker.ProcessColorants"
                   "CIM_PrintMarker.SpotColorants")))
                :INITFORM NIL)
               (OTHERCOLORANTROLE STRING :CIM-NAME "OtherColorantRole"
                :QUALIFIERS
                ((:DESCRIPTION
                  "If this PrintSupply does not represent a PrintMarker colorant, then this property shall be null. If this PrintSupply does represent a PrintMarker colorant and the value of the ColorantRole property is equal to 1 (Other), then this property shall be present and shall contain a free-form string that describes the role of the colorant.")
                 (:MAX-LEN "255")
                 (:MODEL-CORRESPONDENCE ("CIM_PrintSupply.ColorantRole")))
                :INITFORM NIL)
               (COLORANTNAME UINT16 :CIM-NAME "ColorantName" :QUALIFIERS
                ((:DESCRIPTION
                  "If this PrintSupply does not represent a PrintMarker colorant, then this property shall be null. If this PrintSupply does represent a PrintMarker colorant, then this property shall be present and shall denote the colorant name using the standardized names from ISO 10175 (DPA) and ISO 10180 (SPDL). Vendors and administrators may specify other colorant names in the OtherColorantName property.")
                 (:VALUE-MAP ("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" ".."))
                 (:VALUES
                  ("Other" "Unknown" "White" "Red" "Green" "Blue" "Cyan"
                   "Magenta" "Yellow" "Black" "DMTF Reserved"))
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Printer-MIB.prtMarkerColorantValue"))
                 (:MODEL-CORRESPONDENCE ("CIM_PrintSupply.OtherColorantName")))
                :INITFORM NIL)
               (OTHERCOLORANTNAME STRING :CIM-NAME "OtherColorantName"
                :QUALIFIERS
                ((:DESCRIPTION
                  "If this PrintSupply does not represent a PrintMarker colorant, then this property shall be null. If this PrintSupply does represent a PrintMarker colorant and the value of the ColorantName property is equal to 1 (Other), then this property shall be present and shall contain a vendor or administrator defined value. The naming conventions in ISO 9070 are recommended in order to avoid potential name clashes.")
                 (:MAX-LEN "255")
                 (:MODEL-CORRESPONDENCE ("CIM_PrintSupply.ColorantName")))
                :INITFORM NIL)
               (COLORANTTONALITY UINT32 :CIM-NAME "ColorantTonality"
                :QUALIFIERS
                ((:DESCRIPTION
                  "If this PrintSupply does not represent a PrintMarker colorant, then this property shall be null. If this PrintSupply does represent a PrintMarker colorant, then this property shall be present and shall denote the distinct levels of tonality realizable by a PrintMarker when using this colorant. This value does not include the number of levels of tonal difference that an interpreter can obtain by techniques such as half toning. This value must be at least 2.")
                 (:MIN-VALUE "2") (:MAX-VALUE "2147483647")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Printer-MIB.prtMarkerColorantTonality")))
                :INITFORM NIL)
               (INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. To ensure uniqueness within the NameSpace, the value of InstanceID should be constructed using the following \"preferred\" algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon (:), and where <OrgID> shall include a copyrighted, trademarked, or otherwise unique name that is owned by the business entity that is creating or defining the InstanceID or that is a registered ID assigned to the business entity by a recognized global authority. (This requirement is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness, <OrgID> shall not contain a colon (:). When using this algorithm, the first colon to appear in InstanceID shall appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and should not be reused to identify different underlying (real-world) elements. If the above \"preferred\" algorithm is not used, the defining entity shall assure that the resulting InstanceID is not reused across any InstanceIDs produced by this or other providers for the NameSpace of this instance. 
For DMTF-defined instances, the \"preferred\" algorithm entity that is creating or defining the InstanceID or that is a registered ID assigned to the business entity by a recognized global authority. (This requirement is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness, <OrgID> shall not contain a colon (:). When using this algorithm, the first colon to appear in InstanceID shall appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and should not be reused to identify different underlying (real-world) elements. If the above \"preferred\" algorithm is not used, the defining entity shall assure that the resulting InstanceID is not reused across any InstanceIDs produced by this or other providers for the NameSpace of this instance. 
For DMTF-defined instances, the \"preferred\" algorithm shall be used with the <OrgID> set to CIM."))
                :INITFORM NIL)
               (SNMPROWID UINT32 :CIM-NAME "SNMPRowId" :QUALIFIERS
                ((:DESCRIPTION
                  "A unique value used by a scoping Printer to identify this component (e.g., PrintMarker) of the scoping Printer. Although these values may change due to a reconfiguration of the Printer (e.g., the addition of new components to the Printer), values should remain stable across successive Printer power cycles. Note: This property is necessary to correlate status and event (alert) information between CIM and SNMP interfaces.")
                 (:MIN-VALUE "1") (:MAX-VALUE "65535")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Printer-MIB.prtCoverIndex"
                   "MIB.IETF|Printer-MIB.prtInputIndex"
                   "MIB.IETF|Printer-MIB.prtOutputIndex"
                   "MIB.IETF|Printer-MIB.prtMarkerIndex"
                   "MIB.IETF|Printer-MIB.prtMarkerSuppliesIndex"
                   "MIB.IETF|Printer-MIB.prtMediaPathIndex"
                   "MIB.IETF|Printer-MIB.prtChannelIndex"
                   "MIB.IETF|Printer-MIB.prtInterpreterIndex"
                   "MIB.IETF|Printer-MIB.prtConsoleLightIndex"
                   "MIB.IETF|Finisher-MIB.finDeviceIndex"
                   "MIB.IETF|Finisher-MIB.finSupplyIndex")))
                :INITFORM NIL)
               (INSTALLDATE DATETIME :CIM-NAME "InstallDate" :QUALIFIERS
                ((:DESCRIPTION
                  "A datetime value that indicates when the object was installed. Lack of a value does not indicate that the object is not installed.")
                 (:MAPPING-STRINGS ("MIF.DMTF|ComponentID|001.5")))
                :INITFORM NIL)
               (NAME STRING :CIM-NAME "Name" :QUALIFIERS
                ((:DESCRIPTION
                  "The Name property defines the label by which the object is known. When subclassed, the Name property can be overridden to be a Key property.")
                 (:MAX-LEN "1024"))
                :INITFORM NIL)
               (STATUS STRING :CIM-NAME "Status" :QUALIFIERS
                ((:DEPRECATED ("CIM_ManagedSystemElement.OperationalStatus"))
                 (:DESCRIPTION
                  "A string indicating the current status of the object. Various operational and non-operational statuses are defined. This property is deprecated in lieu of OperationalStatus, which includes the same semantics in its enumeration. This change is made for 3 reasons: 
1) Status is more correctly defined as an array. This definition overcomes the limitation of describing status using a single value, when it is really a multi-valued property (for example, an element might be OK AND Stopped. 
2) A MaxLen of 10 is too restrictive and leads to unclear enumerated values. 
3) The change to a uint16 data type was discussed when CIM V2.0 was defined. However, existing V1.0 implementations used the string property and did not want to modify their code. Therefore, Status was grandfathered into the Schema. Use of the deprecated qualifier allows the maintenance of the existing property, but also permits an improved definition using OperationalStatus.")
                 (:VALUE-MAP
                  ("OK" "Error" "Degraded" "Unknown" "Pred Fail" "Starting"
                   "Stopping" "Service" "Stressed" "NonRecover" "No Contact"
                   "Lost Comm" "Stopped"))
                 (:MAX-LEN "10"))
                :INITFORM NIL)
               (HEALTHSTATE UINT16 :CIM-NAME "HealthState" :QUALIFIERS
                ((:DESCRIPTION
                  "Indicates the current health of the element. This attribute expresses the health of this element but not necessarily that of its subcomponents. The possible values are 0 to 30, where 5 means the element is entirely healthy and 30 means the element is completely non-functional. The following continuum is defined: 
\"Non-recoverable Error\" (30) - The element has completely failed, and recovery is not possible. All functionality provided by this element has been lost. 
\"Critical Failure\" (25) - The element is non-functional and recovery might not be possible. 
\"Major Failure\" (20) - The element is failing. It is possible that some or all of the functionality of this component is degraded or not working. 
\"Minor Failure\" (15) - All functionality is available but some might be degraded. 
\"Degraded/Warning\" (10) - The element is in working order and all functionality is provided. However, the element is not working to the best of its abilities. For example, the element might not be operating at optimal performance or it might be reporting recoverable errors. 
\"OK\" (5) - The element is fully functional and is operating within normal operational parameters and without error. 
\"Unknown\" (0) - The implementation cannot report on HealthState at this time. 
DMTF has reserved the unused portion of the continuum for additional HealthStates in the future.")
                 (:VALUE-MAP
                  ("0" "5" "10" "15" "20" "25" "30" ".." "32768..65535"))
                 (:VALUES
                  ("Unknown" "OK" "Degraded/Warning" "Minor failure"
                   "Major failure" "Critical failure" "Non-recoverable error"
                   "DMTF Reserved" "Vendor Specific")))
                :INITFORM NIL)
               (COMMUNICATIONSTATUS UINT16 :CIM-NAME "CommunicationStatus"
                :QUALIFIERS
                ((:DESCRIPTION
                  "CommunicationStatus indicates the ability of the instrumentation to communicate with the underlying ManagedElement. CommunicationStatus consists of one of the following values: Unknown, None, Communication OK, Lost Communication, or No Contact. 
A Null return indicates the implementation (provider) does not implement this property. 
\"Unknown\" indicates the implementation is in general capable of returning this property, but is unable to do so at this time. 
\"Not Available\" indicates that the implementation (provider) is capable of returning a value for this property, but not ever for this particular piece of hardware/software or the property is intentionally not used because it adds no meaningful information (as in the case of a property that is intended to add additional info to another property). 
\"Communication OK \" indicates communication is established with the element, but does not convey any quality of service. 
\"No Contact\" indicates that the monitoring system has knowledge of this element, but has never been able to establish communications with it. 
\"Lost Communication\" indicates that the Managed Element is known to exist and has been contacted successfully in the past, but is currently unreachable.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" ".." "0x8000.."))
                 (:VALUES
                  ("Unknown" "Not Available" "Communication OK"
                   "Lost Communication" "No Contact" "DMTF Reserved"
                   "Vendor Reserved")))
                :INITFORM NIL)
               (DETAILEDSTATUS UINT16 :CIM-NAME "DetailedStatus" :QUALIFIERS
                ((:DESCRIPTION
                  "DetailedStatus compliments PrimaryStatus with additional status detail. It consists of one of the following values: Not Available, No Additional Information, Stressed, Predictive Failure, Error, Non-Recoverable Error, SupportingEntityInError. Detailed status is used to expand upon the PrimaryStatus of the element. 
A Null return indicates the implementation (provider) does not implement this property. 
\"Not Available\" indicates that the implementation (provider) is capable of returning a value for this property, but not ever for this particular piece of hardware/software or the property is intentionally not used because it adds no meaningful information (as in the case of a property that is intended to add additional info to another property). 
\"No Additional Information\" indicates that the element is functioning normally as indicated by PrimaryStatus = \"OK\". 
\"Stressed\" indicates that the element is functioning, but needs attention. Examples of \"Stressed\" states are overload, overheated, and so on. 
\"Predictive Failure\" indicates that an element is functioning normally but a failure is predicted in the near future. 
\"Non-Recoverable Error \" indicates that this element is in an error condition that requires human intervention. 
\"Supporting Entity in Error\" indicates that this element might be \"OK\" but that another element, on which it is dependent, is in error. An example is a network service or endpoint that cannot function due to lower-layer networking problems.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" ".." "0x8000.."))
                 (:VALUES
                  ("Not Available" "No Additional Information" "Stressed"
                   "Predictive Failure" "Non-Recoverable Error"
                   "Supporting Entity in Error" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.PrimaryStatus"
                   "CIM_ManagedSystemElement.HealthState")))
                :INITFORM NIL)
               (OPERATINGSTATUS UINT16 :CIM-NAME "OperatingStatus" :QUALIFIERS
                ((:DESCRIPTION
                  "OperatingStatus provides a current status value for the operational condition of the element and can be used for providing more detail with respect to the value of EnabledState. It can also provide the transitional states when an element is transitioning from one state to another, such as when an element is transitioning between EnabledState and RequestedState, as well as other transitional conditions.
OperatingStatus consists of one of the following values: Unknown, Not Available, In Service, Starting, Stopping, Stopped, Aborted, Dormant, Completed, Migrating, Emmigrating, Immigrating, Snapshotting. Shutting Down, In Test 
A Null return indicates the implementation (provider) does not implement this property. 
\"Unknown\" indicates the implementation is in general capable of returning this property, but is unable to do so at this time. 
\"None\" indicates that the implementation (provider) is capable of returning a value for this property, but not ever for this particular piece of hardware/software or the property is intentionally not used because it adds no meaningful information (as in the case of a property that is intended to add additional info to another property). 
\"Servicing\" describes an element being configured, maintained, cleaned, or otherwise administered. 
\"Starting\" describes an element being initialized. 
\"Stopping\" describes an element being brought to an orderly stop. 
\"Stopped\" and \"Aborted\" are similar, although the former implies a clean and orderly stop, while the latter implies an abrupt stop where the state and configuration of the element might need to be updated. 
\"Dormant\" indicates that the element is inactive or quiesced. 
\"Completed\" indicates that the element has completed its operation. This value should be combined with either OK, Error, or Degraded in the PrimaryStatus so that a client can tell if the complete operation Completed with OK (passed), Completed with Error (failed), or Completed with Degraded (the operation finished, but it did not complete OK or did not report an error). 
\"Migrating\" element is being moved between host elements. 
\"Immigrating\" element is being moved to new host element. 
\"Emigrating\" element is being moved away from host element. 
\"Shutting Down\" describes an element being brought to an abrupt stop. 
\"In Test\" element is performing test functions. 
\"Transitioning\" describes an element that is between states, that is, it is not fully available in either its previous state or its next state. This value should be used if other values indicating a transition to a specific state are not applicable.
\"In Service\" describes an element that is in service and operational.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" ".." "0x8000.."))
                 (:VALUES
                  ("Unknown" "Not Available" "Servicing" "Starting" "Stopping"
                   "Stopped" "Aborted" "Dormant" "Completed" "Migrating"
                   "Emigrating" "Immigrating" "Snapshotting" "Shutting Down"
                   "In Test" "Transitioning" "In Service" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.EnabledState")))
                :INITFORM NIL)
               (PRIMARYSTATUS UINT16 :CIM-NAME "PrimaryStatus" :QUALIFIERS
                ((:DESCRIPTION
                  "PrimaryStatus provides a high level status value, intended to align with Red-Yellow-Green type representation of status. It should be used in conjunction with DetailedStatus to provide high level and detailed health status of the ManagedElement and its subcomponents. 
PrimaryStatus consists of one of the following values: Unknown, OK, Degraded or Error. \"Unknown\" indicates the implementation is in general capable of returning this property, but is unable to do so at this time. 
\"OK\" indicates the ManagedElement is functioning normally. 
\"Degraded\" indicates the ManagedElement is functioning below normal. 
\"Error\" indicates the ManagedElement is in an Error condition.")
                 (:VALUE-MAP ("0" "1" "2" "3" ".." "0x8000.."))
                 (:VALUES
                  ("Unknown" "OK" "Degraded" "Error" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ManagedSystemElement.DetailedStatus"
                   "CIM_ManagedSystemElement.HealthState")))
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
               (ELEMENTNAME STRING :CIM-NAME "ElementName" :QUALIFIERS
                ((:DESCRIPTION
                  "A user-friendly name for the object. This property allows each instance to define a user-friendly name in addition to its key properties, identity data, and description information. 
Note that the Name property of ManagedSystemElement is also defined as a user-friendly name. But, it is often subclassed to be a Key. It is not reasonable that the same property can convey both identity and a user-friendly name, without inconsistencies. Where Name exists and is not a Key (such as for instances of LogicalDevice), the same information can be present in both the Name and ElementName properties. Note that if there is an associated instance of CIM_EnabledLogicalElementCapabilities, restrictions on this properties may exist as defined in ElementNameMask and MaxElementNameLen properties defined in that class."))
                :INITFORM NIL)
               (OPERATIONALSTATUS (ARRAY UINT16) :CIM-NAME "OperationalStatus"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Indicates the current statuses of the element. Various operational statuses are defined. Many of the enumeration's values are self-explanatory. However, a few are not and are described here in more detail. 
\"Stressed\" indicates that the element is functioning, but needs attention. Examples of \"Stressed\" states are overload, overheated, and so on. 
\"Predictive Failure\" indicates that an element is functioning nominally but predicting a failure in the near future. 
\"In Service\" describes an element being configured, maintained, cleaned, or otherwise administered. 
\"No Contact\" indicates that the monitoring system has knowledge of this element, but has never been able to establish communications with it. 
\"Lost Communication\" indicates that the ManagedSystem Element is known to exist and has been contacted successfully in the past, but is currently unreachable. 
\"Stopped\" and \"Aborted\" are similar, although the former implies a clean and orderly stop, while the latter implies an abrupt stop where the state and configuration of the element might need to be updated. 
\"Dormant\" indicates that the element is inactive or quiesced. 
\"Supporting Entity in Error\" indicates that this element might be \"OK\" but that another element, on which it is dependent, is in error. An example is a network service or endpoint that cannot function due to lower-layer networking problems. 
\"Completed\" indicates that the element has completed its operation. This value should be combined with either OK, Error, or Degraded so that a client can tell if the complete operation Completed with OK (passed), Completed with Error (failed), or Completed with Degraded (the operation finished, but it did not complete OK or did not report an error). 
\"Power Mode\" indicates that the element has additional power model information contained in the Associated PowerManagementService association. 
\"Relocating\" indicates the element is being relocated.
OperationalStatus replaces the Status property on ManagedSystemElement to provide a consistent approach to enumerations, to address implementation needs for an array property, and to provide a migration path from today's environment to the future. This change was not made earlier because it required the deprecated qualifier. Due to the widespread use of the existing Status property in management applications, it is strongly recommended that providers or instrumentation provide both the Status and OperationalStatus properties. Further, the first value of OperationalStatus should contain the primary status for the element. When instrumented, Status (because it is single-valued) should also provide the primary status of the element.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" "17" "18" "19" ".." "0x8000.."))
                 (:VALUES
                  ("Unknown" "Other" "OK" "Degraded" "Stressed"
                   "Predictive Failure" "Error" "Non-Recoverable Error"
                   "Starting" "Stopping" "Stopped" "In Service" "No Contact"
                   "Lost Communication" "Aborted" "Dormant"
                   "Supporting Entity in Error" "Completed" "Power Mode"
                   "Relocating" "DMTF Reserved" "Vendor Reserved"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ManagedSystemElement.StatusDescriptions")))
                :INITFORM NIL)
               (STATUSDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "StatusDescriptions" :QUALIFIERS
                ((:DESCRIPTION
                  "Strings describing the various OperationalStatus array values. For example, if \"Stopping\" is the value assigned to OperationalStatus, then this property may contain an explanation as to why an object is being stopped. Note that entries in this array are correlated with those at the same array index in OperationalStatus.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ManagedSystemElement.OperationalStatus")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_PrintSupply")
              (:QUALIFIERS (:VERSION "2.31.1")
               (:UML-PACKAGE-PATH "CIM::Device::Printing")
               (:DESCRIPTION
                "This class represents a PrintSupply for a PrintMarker or PrintFinisher component of a Printer (print device). It contains a property that specifies if this instance represents a PrintSupply represents a container (for a supply that is consumed) or a receptacle (for waste that is produced). It also contains properties that describe the PrintSupply type, capacity, and remaining capacity. For PrintMarker colorants, it also contains properties that describe colorant role (spot or process), name, and tonality. Note: A PrintSupply shall be associated with exactly one Printer via an instance of the ConcreteComponent class. A PrintSupply shall be associated with exactly one PrintMarker or PrintFinisher via an instance of AssociatedPrintSupply class. See: Model in section 2 of Printer MIB (RFC 3805) and section 3 of Finisher MIB (RFC 3806).")
               (:MAPPING-STRINGS
                ("MIB.IETF|Printer-MIB.prtMarkerSuppliesEntry"
                 "MIB.IETF|Printer-MIB.prtMarkerColorantEntry"
                 "MIB.IETF|Finisher-MIB.finSupplyEntry"))))