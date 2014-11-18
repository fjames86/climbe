
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_QueueAllocation.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_QUEUEALLOCATION (CIM_DEPENDENCY)
              ((ALLOCATIONPERCENTAGE UINT8 :CIM-NAME "AllocationPercentage"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This property is an 8-bit unsigned integer representing a percentage from 0 to 100. It defines the percentage of the BufferPool that should be allocated to the referenced QueuingService. If absolute sizes are desired, this is accomplished by defining individual BufferPools of the specified sizes, with QueueAllocation.AllocationPercentages set to 100.")
                 (NIL "Percent") (:MIN-VALUE "0") (:MAX-VALUE "100"))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The BufferPool supporting packet storage for a QueuingService.")
                 :KEY)
                :INITFORM "CIM_BufferPool")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The QueuingService dependent on the BufferPool for storage space.")
                 :KEY)
                :INITFORM "CIM_QueuingService"))
              (:CIM-NAME "CIM_QueueAllocation")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Network::QoS")
               (:DESCRIPTION
                "Describes the reliance of a QueuingService on the availability of space in a BufferPool.")))