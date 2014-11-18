
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AllocatedDMA.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ALLOCATEDDMA (CIM_ALLOCATEDRESOURCE)
              ((BUSMASTER BOOLEAN :CIM-NAME "BusMaster" :QUALIFIERS
                ((:DESCRIPTION
                  "Boolean indicating whether the LogicalDevice can act as a bus master on the DMA Channel.")
                 (:MAPPING-STRINGS
                  ("MIF.DMTF|System Resource DMA Info|001.6")))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:DESCRIPTION "The DMA Channel.")
                 :KEY)
                :INITFORM "CIM_DMA")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The LogicalDevice to which the Resource is assigned.")
                 :KEY)
                :INITFORM "CIM_LogicalDevice"))
              (:CIM-NAME "CIM_AllocatedDMA")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::System::SystemResources")
               (:DESCRIPTION
                "An association between a LogicalDevice and a DMA System Resource indicating that the DMA Channel is assigned to the Device.")))