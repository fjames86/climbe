
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AllocationSchedulingElement.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ALLOCATIONSCHEDULINGELEMENT (CIM_SCHEDULINGELEMENT)
              ((ALLOCATIONUNITS UINT16 :CIM-NAME "AllocationUnits" :QUALIFIERS
                ((:DESCRIPTION
                  "A 16-bit unsigned integer enumeration that identifies the units in which the BandwidthAllocation and BurstAllocation properties are expressed. The following values are defined: 
- Bytes(1) 
- Packets(2) 
- Cells(3) (fixed-size, for example, ATM) 
If no value is specified, 1 (\"Bytes\") should be assumed.")
                 (:VALUE-MAP ("1" "2" "3"))
                 (:VALUES ("Bytes" "Packets" "Cells")))
                :INITFORM NIL)
               (BANDWIDTHALLOCATION UINT32 :CIM-NAME "BandwidthAllocation"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A 32-bit bit unsigned integer defining the number of 'units' per second that should be allocated to the associated input. 'Units' are identified by the AllocationUnits property.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_AllocationSchedulingElement.AllocationUnits")))
                :INITFORM NIL)
               (BURSTALLOCATION UINT32 :CIM-NAME "BurstAllocation" :QUALIFIERS
                ((:DESCRIPTION
                  "A 32-bit bit unsigned integer specifying the amount of temporary or short-term bandwidth (in 'units' per second) that can be allocated to an input, beyond the amount of bandwidth allocated through the BandwidthAllocation property. If the maximum actual bandwidth allocation for the input were to be measured, it would be the sum of the BurstAllocation and the BandwidthAllocation properties. 'Units' are identified by the AllocationUnits property.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_AllocationSchedulingElement.AllocationUnits")))
                :INITFORM NIL)
               (CANSHARE BOOLEAN :CIM-NAME "CanShare" :QUALIFIERS
                ((:DESCRIPTION
                  "A boolean property that, if TRUE, enables unused bandwidth from the associated input to be allocated to other inputs serviced by the Scheduler."))
                :INITFORM NIL)
               (WORKFLEXIBLE BOOLEAN :CIM-NAME "WorkFlexible" :QUALIFIERS
                ((:DESCRIPTION
                  "A boolean property that, if TRUE, indicates that the behavior of the scheduler relative to this input can be altered by changing the value of the inherited property, WorkConserving."))
                :INITFORM NIL)
               (INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. In order to ensure uniqueness within the NameSpace, the value of InstanceID SHOULD be constructed using the following 'preferred' algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon ':', and where <OrgID> MUST include a copyrighted, trademarked or otherwise unique name that is owned by the business entity creating/defining the InstanceID, or is a registered ID that is assigned to the business entity by a recognized global authority. (This is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness <OrgID> MUST NOT contain a colon (':'). When using this algorithm, the first colon to appear in InstanceID MUST appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and SHOULD not be re-used to identify different underlying (real-world) elements. If the above 'preferred' algorithm is not used, the defining entity MUST assure that the resultant InstanceID is not re-used across any InstanceIDs produced by this or other providers for this instance's NameSpace. 
For DMTF defined instances, the 'preferred' algorithm MUST be used with the <OrgID> set to 'CIM'."))
                :INITFORM NIL)
               (WORKCONSERVING BOOLEAN :CIM-NAME "WorkConserving" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "A boolean property indicating whether the PacketSchedulingService tied to this instance (by the ElementInSchedulingService aggregation) is treating the queue/input tied to this instance, in a work-conserving manner. The queue/input is indicated by either the QueueToSchedule or SchedulingServiceToSchedule association. Note that this property is writeable, indicating that an administrator can change the behavior of the SchedulingElement - but only for those elements that can operate in a non-work conserving mode."))
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
                :INITFORM NIL))
              (:CIM-NAME "CIM_AllocationSchedulingElement")
              (:QUALIFIERS (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::QoS")
               (:DESCRIPTION
                "This class is a subclass of the abstract class SchedulingElement. It introduces five new properties to support bandwidth-based scheduling. As is the case with all subclasses of SchedulingElement, the input associated with an instance of AllocationSchedulingElement is of one of two types: either a queue, or another scheduler.")))