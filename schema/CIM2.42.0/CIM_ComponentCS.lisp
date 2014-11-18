
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ComponentCS.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_COMPONENTCS (CIM_SYSTEMCOMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MAX "1")
                 (:DESCRIPTION
                  "The ComputerSystem that contains and/or aggregates other Systems.")
                 :KEY)
                :INITFORM "CIM_ComputerSystem")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION "The contained (Sub)ComputerSystem.") :KEY)
                :INITFORM "CIM_ComputerSystem"))
              (:CIM-NAME "CIM_ComponentCS")
              (:QUALIFIERS :ASSOCIATION (NIL "true") :COMPOSITION
               (:VERSION "2.13.0")
               (:UML-PACKAGE-PATH "CIM::System::SystemElements")
               (:DESCRIPTION
                "A ComputerSystem can aggregate another ComputerSystem. This association can be used to model MPP Systems with workstation frontends, an I2O subsystem embedded in a Unitary ComputerSystem, or a System that splits functionality between two processors, potentially running different Operating Systems. For example, if a CISC Processor and its associated OperatingSystem, are used for user interface and file support, and a RISC Processor and its OS are used for complex mathematical operations, this could be modeled as two ComputerSystems where one aggregates the other. In some cases, this could be modeled as a Cluster. The difference is the focus of the relationship. ComponentCS represents that unique and distinct ComputerSystems are aggregated by a higher level CS object. However, each of the component CSs are still distinguishable entities and are only viewed as such. Alternately, with a Cluster, the ComputerSystems that participate in it are inconsequential, when viewed through the 'Cluster System'. 

When instantiating or subclassing the ComponentCS relationship, care should be taken that the component ComputerSystem meets the definitional requirements of a ComputerSystem - ie, a functional whole that provides compute capabilities and aggregates System Devices, an OperatingSystem, etc.")))