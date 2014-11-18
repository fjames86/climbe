
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_BootOSFromFS.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_BOOTOSFROMFS (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The FileSystem from which the OperatingSystem is loaded.")
                 :KEY)
                :INITFORM "CIM_FileSystem")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:DESCRIPTION "The OperatingSystem.")
                 :KEY)
                :INITFORM "CIM_OperatingSystem"))
              (:CIM-NAME "CIM_BootOSFromFS")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::System::OperatingSystem")
               (:DESCRIPTION
                "A link between the OperatingSystem and the FileSystem(s) from which this OperatingSystem is loaded. The association is many- to-many since a Distributed OS could depend on several File Systems in order to correctly and completely load.")))