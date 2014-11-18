
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_HostingCS.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_HOSTINGCS (CIM_HOSTEDDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1")
                 (:DESCRIPTION "The hosting ComputerSystem.") (:MAX "1") :KEY)
                :INITFORM "CIM_ComputerSystem")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The VirtualComputerSystem.") :KEY)
                :INITFORM "CIM_VirtualComputerSystem"))
              (:CIM-NAME "CIM_HostingCS")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::System::SystemElements")
               (:DESCRIPTION
                "A VirtualComputerSystem is hosted on another ComputerSystem. This association makes that relationship explicit.")))