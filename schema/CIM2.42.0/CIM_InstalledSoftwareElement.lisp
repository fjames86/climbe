
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_InstalledSoftwareElement.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_INSTALLEDSOFTWAREELEMENT NIL
              ((SOFTWARE NIL :CIM-NAME "Software" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "Reference to the Software Element that is installed."))
                :INITFORM "CIM_SoftwareElement")
               (SYSTEM NIL :CIM-NAME "System" :QUALIFIERS
                (:KEY (:MAX "1")
                 (:DESCRIPTION
                  "Reference to the ComputerSystem hosting a particular SoftwareElement."))
                :INITFORM "CIM_ComputerSystem"))
              (:CIM-NAME "CIM_InstalledSoftwareElement")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Application::SystemSoftware")
               (:DESCRIPTION
                "The InstalledSoftwareElement association allows the identification of the ComputerSystem on which a particular SoftwareElement is installed.")))