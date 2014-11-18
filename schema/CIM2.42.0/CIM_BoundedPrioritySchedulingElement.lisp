
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_BoundedPrioritySchedulingElement.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_BOUNDEDPRIORITYSCHEDULINGELEMENT
              (CIM_PRIORITYSCHEDULINGELEMENT)
              ((WORKCONSERVING BOOLEAN :CIM-NAME "WorkConserving" :QUALIFIERS
                ((:OVERRIDE "WorkConserving") :WRITE
                 (:DESCRIPTION
                  "A boolean property indicating whether the PacketSchedulingService tied to this instance (by the ElementInSchedulingService aggregation) is treating the queue/input tied to this instance, in a work-conserving manner. The queue/input is indicated by either the QueueToSchedule or SchedulingServiceToSchedule association. Note that this property is writeable, indicating that an administrator can change the behavior of the SchedulingElement - but only for those elements that can operate in a non-work conserving mode."))
                :INITFORM "true")
               (BANDWIDTHBOUND UINT32 :CIM-NAME "BandwidthBound" :QUALIFIERS
                ((:DESCRIPTION
                  "A 32-bit unsigned integer that defines the upper limit on the amount of traffic that can be handled from the input (through this SchedulingElement). This is not a shaped upper bound, since bursts can occur. It is a strict bound, limiting the impact of the input. Units are kilobits per second.")
                 (NIL "KiloBits per Second"))
                :INITFORM NIL)
               (PRIORITY UINT16 :CIM-NAME "Priority" :QUALIFIERS
                ((:DESCRIPTION
                  "A 16-bit unsigned integer indicating the priority level of this SchedulingElement's input, relative to the other inputs serviced by the SchedulingElement's aggregating PacketSchedulingService. A larger value represents a higher priority."))
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
              (:CIM-NAME "CIM_BoundedPrioritySchedulingElement")
              (:QUALIFIERS (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::QoS")
               (:DESCRIPTION
                "This class is a subclass of the class PriorityScheduling Element, which is itself derived from the abstract class SchedulingElement. As is the case with all subclasses of SchedulingElement, the input associated with an instance of BoundedPrioritySchedulingElement is of one of two types: either a queue, or another scheduler. BoundedPriority SchedulingElement adds an upper bound (BandwidthBound in kilobits per second) on how much traffic can be handled from an input. This data is specific to that one input. It is needed when bounded strict priority scheduling is performed. Note that this class inherits from its superclass the restriction of the inherited boolean property WorkConserving to TRUE.")))