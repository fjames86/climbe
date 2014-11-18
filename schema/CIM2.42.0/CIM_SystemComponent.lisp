
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SystemComponent.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SYSTEMCOMPONENT (CIM_COMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION "The parent System in the Association.") :KEY)
                :INITFORM "CIM_System")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "The child element that is a component of a System.")
                 :KEY)
                :INITFORM "CIM_ManagedSystemElement"))
              (:CIM-NAME "CIM_SystemComponent")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::CoreElements")
               (:DESCRIPTION
                "CIM_SystemComponent is a specialization of the CIM_Component association that establishes 'part of' relationships between a System and any ManagedSystemElements of which it is composed. 
Use this association with caution when using it instead of a subclass such as SystemDevice or a peer association such as HostedService. This class is very broadly defined, which can lead to erroneous use. For example, Access Points that are dependent on (and hosted on) a System are NOT Components of the System. The System is not made up of any AccessPoint 'parts', which is why a Dependency association, HostedAccessPoint, was defined. Similarly, a PhysicalPackage is not a 'part' of a System, because the physical element exists independently of any internal components, software, and so on. In fact, again, a Dependency relationship is true where a ComputerSystem is Dependent on its packaging, as described by the ComputerSystemPackage association.")))