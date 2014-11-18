
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_InstalledOS.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_INSTALLEDOS (CIM_SYSTEMCOMPONENT)
              ((PRIMARYOS BOOLEAN :CIM-NAME "PrimaryOS" :QUALIFIERS
                ((:DESCRIPTION
                  "Boolean indicating that the OperatingSystem is the default OS for the ComputerSystem.")
                 (:MAPPING-STRINGS ("MIF.DMTF|Operating System|001.4")))
                :INITFORM NIL)
               (GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The ComputerSystem.") :KEY)
                :INITFORM "CIM_ComputerSystem")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent") :WEAK
                 (:DESCRIPTION
                  "The OperatingSystem installed on the ComputerSystem.")
                 :KEY)
                :INITFORM "CIM_OperatingSystem"))
              (:CIM-NAME "CIM_InstalledOS")
              (:QUALIFIERS :ASSOCIATION (NIL "true") :COMPOSITION
               (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::System::OperatingSystem")
               (:DESCRIPTION
                "A link between the ComputerSystem and the OperatingSystem(s) installed or loaded on it. An OperatingSystem is 'installed' on a ComputerSystem, when placed on one of its StorageExtents - for example, copied to a disk drive or downloaded to Memory. Using this definition, an OperatingSystem is 'installed' on a NetPC when downloaded via the network.")))