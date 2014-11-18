
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AggregationMetricValue.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_AGGREGATIONMETRICVALUE (CIM_BASEMETRICVALUE)
              ((AGGREGATIONTIMESTAMP DATETIME :CIM-NAME "AggregationTimeStamp"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Identifies the time when the aggregation function was applied to determine the value of the metric instance. Note that this is different from the time when the instance is created. For a given CIM_AggregationMetricValue instance, the AggregationTimeStamp changes whenever the aggregation function is applied to calculate the value.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_AggregationMetricValue.Duration")))
                :INITFORM NIL)
               (AGGREGATIONDURATION DATETIME :CIM-NAME "AggregationDuration"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Property that represents the time duration over which the aggregation was computed. The start of a monitoring interval over which the aggregation function is applied is determined by subtracting the AggregationDuration from the AggregationTimestamp.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_AggregationMetricValue.AggregationTimeStamp")))
                :INITFORM NIL)
               (INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. In order to ensure uniqueness within the NameSpace, the value of InstanceID SHOULD be constructed using the following 'preferred' algorithm: 
: 
Where and are separated by a colon ':', and where MUST include a copyrighted, trademarked or otherwise unique name that is owned by the business entity creating/defining the InstanceID, or is a registered ID that is assigned to the business entity by a recognized global authority (This is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness MUST NOT contain a colon (':'). When using this algorithm, the first colon to appear in InstanceID MUST appear between and . 
is chosen by the business entity and SHOULD not be re-used to identify different underlying (real-world) elements. If the above 'preferred' algorithm is not used, the defining entity MUST assure that the resultant InstanceID is not re-used across any InstanceIDs produced by this or other providers for this instance's NameSpace. 
For DMTF defined instances, the 'preferred' algorithm MUST be used with the set to 'CIM'."))
                :INITFORM NIL)
               (METRICDEFINITIONID STRING :CIM-NAME "MetricDefinitionId"
                :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "The key of the BaseMetricDefinition instance for this CIM_BaseMetricValue instance value.")
                 (:MODEL-CORRESPONDENCE ("CIM_BaseMetricDefinition.Id")))
                :INITFORM NIL)
               (MEASUREDELEMENTNAME STRING :CIM-NAME "MeasuredElementName"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A descriptive name for the element to which the metric value belongs (i.e., the measured element). This property is required by behavior if there is no association defined to a ManagedElement, but may be used in other cases to provide supplemental information. This allows metrics to be captured independently of any ManagedElement. An example is where a metric value belongs to a combination of elements, such as the input and output ports of the traffic in a switch. If there are multiple ManagedElements associated with the metric value, then usually there is one that naturally belongs to the metric value and that one should be used to create the supplemental information. The property is not meant to be used as a foreign key to search on the measured element. Instead, the association to the ManagedElement should be used."))
                :INITFORM NIL)
               (TIMESTAMP DATETIME :CIM-NAME "TimeStamp" :QUALIFIERS
                ((:DESCRIPTION
                  "Identifies the time when the value of a metric instance is computed. Note that this is different from the time when the instance is created. For a given CIM_BaseMetricValue instance, the TimeStamp changes whenever a new measurement snapshot is taken if Volatile is true. A managmenet application may establish a time series of metric data by retrieving the instances of CIM_BaseMetricValue and sorting them according to their TimeStamp.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_BaseMetricDefinition.TimeScope"
                   "CIM_BaseMetricValue.Duration")))
                :INITFORM NIL)
               (DURATION DATETIME :CIM-NAME "Duration" :QUALIFIERS
                ((:DESCRIPTION
                  "Property that represents the time duration over which this metric value is valid. This property should not exist for timestamps that apply only to a point in time but should be defined for values that are considered valid for a certain time period (ex. sampling). If the \"Duration\" property exists and is nonNull, the TimeStamp is to be considered the end of the interval.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_BaseMetricDefinition.TimeScope"
                   "CIM_BaseMetricValue.TimeStamp")))
                :INITFORM NIL)
               (METRICVALUE STRING :CIM-NAME "MetricValue" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "The value of the metric represented as a string. Its original data type is specified in CIM_BaseMetricDefinition."))
                :INITFORM NIL)
               (BREAKDOWNDIMENSION STRING :CIM-NAME "BreakdownDimension"
                :QUALIFIERS
                ((:DESCRIPTION
                  "If present, specifies one BreakdownDimension from the BreakdownDimensions array defined in the associated CIM_ BaseMetricDefinition. This is the dimension along which this set of metric values is broken down. For a description of the concept, see the class CIM_BaseMetricDefinition."))
                :INITFORM NIL)
               (BREAKDOWNVALUE STRING :CIM-NAME "BreakdownValue" :QUALIFIERS
                ((:DESCRIPTION
                  "Defines a value of the BreakdownDimension property defined for this metric value instance. For instance, if the BreakdownDimension is \"TransactionName\", this property could name the actual transaction to which this particular metric value applies."))
                :INITFORM NIL)
               (VOLATILE BOOLEAN :CIM-NAME "Volatile" :QUALIFIERS
                ((:DESCRIPTION
                  "If true, Volatile indicates that the value for the next point in time may use the same object and just change its properties (such as the value or timestamp). If false, the existing objects remain unchanged and a new object is created for the new point in time."))
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
              (:CIM-NAME "CIM_AggregationMetricValue")
              (:QUALIFIERS (:VERSION "2.22.0")
               (:UML-PACKAGE-PATH "CIM::Metrics::BaseMetric")
               (:DESCRIPTION
                "Each CIM_AggregationMetricValue object represents the instance value of a metric defined by an instance of CIM_AggregationMetricDefinition. The properties inherited from CIM_BaseMetricValue provide the actual metric value. The properties introduced in CIM_AggregationMetricValue provide information about the interval over which the aggregation function was applied.")))