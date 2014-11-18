
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AssociatedProcessorMemory.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ASSOCIATEDPROCESSORMEMORY (CIM_ASSOCIATEDMEMORY)
              ((BUSSPEED UINT32 :CIM-NAME "BusSpeed" :QUALIFIERS
                ((:DESCRIPTION
                  "Speed of the bus, in MHertz, between the Processor and Memory.")
                 (NIL "MegaHertz") (:P-UNIT "hertz * 10^6"))
                :INITFORM NIL)
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The Processor that accesses the Memory or uses the Cache.")
                 :KEY)
                :INITFORM "CIM_Processor")
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "Memory installed on or associated with a Device.")
                 :KEY)
                :INITFORM "CIM_Memory"))
              (:CIM-NAME "CIM_AssociatedProcessorMemory")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Device::Memory")
               (:DESCRIPTION
                "Associates the Processor and system Memory, or a Processor's Cache.")))