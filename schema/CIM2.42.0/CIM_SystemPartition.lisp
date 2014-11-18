
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SystemPartition.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SYSTEMPARTITION (CIM_COMPONENTCS)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                ((:DEPRECATED ("CIM_HostedDependency.Antecedent")) :AGGREGATE
                 (:OVERRIDE "GroupComponent") (:MAX "1")
                 (:DESCRIPTION
                  "The 'underlying' ComputerSystem that hosts a Partition.")
                 :KEY)
                :INITFORM "CIM_ComputerSystem")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:DEPRECATED ("CIM_HostedDependency.Antecedent"))
                 (:OVERRIDE "PartComponent")
                 (:DESCRIPTION "The System Partition.") :KEY)
                :INITFORM "CIM_UnitaryComputerSystem"))
              (:CIM-NAME "CIM_SystemPartition")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("CIM_HostedDependency"))
               (NIL "true") :COMPOSITION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::System::SystemElements")
               (:DESCRIPTION
                "A Partition is an instance of a UnitaryComputerSystem (with its own OperatingSystem and Devices dedicated to the Partition) that is supported by underlying hardware and software. A Partition is not a virtualization of a Computer System, but the segmentation of the System's compute capabilities. Partitions can run independent copies of possibly different OperatingSystems and have dedicated Devices. The 'real', underlying System (perhaps a Cluster or another UnitaryComputerSystem) aggregates its Partitions. These semantics are described by the System Partition association. 
The use of this association has been deprecated in lieu of using HostedDependency.")))