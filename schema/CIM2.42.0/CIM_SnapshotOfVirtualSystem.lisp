
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SnapshotOfVirtualSystem.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SNAPSHOTOFVIRTUALSYSTEM (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "0") (:MAX "1")
                 (:DESCRIPTION
                  "Reference to the instance of the CIM_ComputerSystem class representing a virtual system.")
                 :KEY)
                :INITFORM "CIM_ComputerSystem")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "Reference to the instance of the CIM_VirtualSystemSettingData class representing a snapshot that was captured from the virtual system.")
                 :KEY)
                :INITFORM "CIM_VirtualSystemSettingData"))
              (:CIM-NAME "CIM_SnapshotOfVirtualSystem")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.32.0")
               (:UML-PACKAGE-PATH "CIM::System::SystemElements")
               (:DESCRIPTION
                "The CIM_SnapshotOfVirtuaSystem association associates an instance of the CIM_ComputerSystem class representing a virtual system, and an instance of the CIM_VirtualSystemSettingData class representing a snapshot that was captured from the virtual system.")))