
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_BIOSLoadedInNV.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_BIOSLOADEDINNV (CIM_DEPENDENCY)
              ((STARTINGADDRESS UINT64 :CIM-NAME "StartingAddress" :QUALIFIERS
                ((:DESCRIPTION
                  "The starting address where the BIOS is located in non-volatile storage."))
                :INITFORM NIL)
               (ENDINGADDRESS UINT64 :CIM-NAME "EndingAddress" :QUALIFIERS
                ((:DESCRIPTION
                  "The ending address where the BIOS is located in non-volatile storage."))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:DESCRIPTION "The memory storage.")
                 :KEY)
                :INITFORM "CIM_Memory")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The BIOS stored in the memory.") :KEY)
                :INITFORM "CIM_BIOSElement"))
              (:CIM-NAME "CIM_BIOSLoadedInNV")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Device::Memory")
               (:DESCRIPTION
                "A link between BIOSElement and Memory where the BIOS is loaded.")))