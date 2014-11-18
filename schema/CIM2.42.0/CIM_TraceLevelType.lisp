
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_TraceLevelType.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_TRACELEVELTYPE (CIM_MANAGEDELEMENT)
              ((INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. In order to ensure uniqueness within the NameSpace, the value of InstanceID SHOULD be constructed using the following 'preferred' algorithm: 
: 
Where and are separated by a colon ':', and where MUST include a copyrighted, trademarked or otherwise unique name that is owned by the business entity creating/defining the InstanceID, or is a registered ID that is assigned to the business entity by a recognized global authority (This is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness MUST NOT contain a colon (':'). When using this algorithm, the first colon to appear in InstanceID MUST appear between and . 
is chosen by the business entity and SHOULD not be re-used to identify different underlying (real-world) elements. If the above 'preferred' algorithm is not used, the defining entity MUST assure that the resultant InstanceID is not re-used across any InstanceIDs produced by this or other providers for this instance's NameSpace. 
For DMTF defined instances, the 'preferred' algorithm MUST be used with the set to 'CIM'.")
                 (:MAX-LEN "16")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_UnitOfWorkDefinition.TraceLevelTypeId")))
                :INITFORM NIL)
               (BASETYPE UINT16 :CIM-NAME "BaseType" :QUALIFIERS
                ((:DESCRIPTION
                  "Describes the technical encoding of the trace level. 
0: bit map = switches to turn on/off appropriate trace production (e.g. 0x00000010, 0x0000F000); the use of bit maps implies that the switches can be or-ed bitwise: Values[1] | Values[2] | ... . 
1: number = plain numbers that define levels (e.g. 1, 2, 7); the recommended and most common encoding scheme 
2: any other encoding scheme you could think of (e.g. mixture of bit maps and numbers).")
                 (:VALUE-MAP ("1" "2" "3"))
                 (:VALUES ("Other" "Bitmap" "Number")))
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
               (TRACEVALUES (ARRAY UINT32) :CIM-NAME "TraceValues" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "Each entry in the array is one possible value of the trace level of this type. Depending on the base type, these are either switches defined as bit maps (e.g. 0x00000001, 0x000000F0, ...) or plain numbers (1, 2, 3, ...). In either encoding, the value 0 is reserved for the equivalent of 'no trace'.")
                 (:ARRAYTYPE "Indexed"))
                :INITFORM NIL)
               (VALUEDESCRIPTIONS (ARRAY STRING) :CIM-NAME "ValueDescriptions"
                :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "The index corresponds to TraceLevelType.TraceValues[]. The array provides human-readable descriptions of the semantics of each value entered in the TraceValues array.")
                 (:ARRAYTYPE "Indexed"))
                :INITFORM NIL))
              (:CIM-NAME "CIM_TraceLevelType")
              (:QUALIFIERS (:VERSION "2.19.0")
               (:UML-PACKAGE-PATH "CIM::Metrics::UnitOfWork")
               (:DESCRIPTION
                "TraceLevelType defines the encoding and semantics of trace levels. A trace is data that is produced during the execution of program code in order to provide information on the behaviour of the code (e.g. textual data written to files). Traces may be used for error detection/analysis or debugging. Trace levels define the granularity and/or type of the traces that are to be produced by the program code. Depending on the program implementation, levels may be applied on the fly. The possible levels are also implementation dependent, since no general rules or standards exist. In consequence, program developers could reuse their existing trace level scheme. 
Traces are valuable information sources for management applications in cases of error detection/analysis. In order to correctly set trace levels to the level needed (exciting exhaustive tracing by accident may result in significant system resources consumption in terms of processing time and storage) and to efficiently interpret which level of detail to expect from traces already produced by some resource, the possible trace level values and their meaning (semantics) must be known by the user and/or the management application. The type does not define the location or access method of the traces, since traces of a particular type can have multiple locations as well as multiple access methods.")))