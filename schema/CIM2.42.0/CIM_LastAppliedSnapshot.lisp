
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_LastAppliedSnapshot.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_LASTAPPLIEDSNAPSHOT (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "0") (:MAX "1")
                 (:DESCRIPTION
                  "Reference to the instance of the CIM_VirtualSystemSettingData class representing the virtual system snapshot that was last applied to the virtual system.")
                 :KEY)
                :INITFORM "CIM_VirtualSystemSettingData")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MIN "0") (:MAX "1")
                 (:DESCRIPTION
                  "Reference to the instance of the CIM_ComputerSystem class representing the virtual system upon which the virtual system snapshot represented by the instance of the CIM_VirtualSystemSettingData class referenced by the Antecedent property was most recently applied.")
                 :KEY)
                :INITFORM "CIM_ComputerSystem"))
              (:CIM-NAME "CIM_LastAppliedSnapshot")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.32.0")
               (:UML-PACKAGE-PATH "CIM::System::SystemElements")
               (:DESCRIPTION
                "The CIM_LastAppliedSnapshot association associates an instance of the CIM_VirtualSystemSettingData class representing a virtual system snapshot that was most recently applied to a virtual system, and the instance of the CIM_ComputerSystem class representing the related virtual system.
An instance of this assocation indicates that the referenced snapshot is the snapshot the was last applied to the virtual system from the set of snapshots taken from that virtual system. For each virtual system at any time there is at most one snapshot the last applied snapshot.")))