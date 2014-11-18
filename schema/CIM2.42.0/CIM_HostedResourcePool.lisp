
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_HostedResourcePool.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_HOSTEDRESOURCEPOOL (CIM_SYSTEMCOMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The parent system in the association") :KEY)
                :INITFORM "CIM_System")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "The ResourcePool that is a component of the system")
                 :KEY)
                :INITFORM "CIM_ResourcePool"))
              (:CIM-NAME "CIM_HostedResourcePool")
              (:QUALIFIERS :ASSOCIATION (NIL "true") :COMPOSITION
               (:VERSION "2.22.0") (:UML-PACKAGE-PATH "CIM::Core::Resource")
               (:DESCRIPTION
                "HostedResourcePool is a specialization of the SystemComponent association that establishes that the ResourcePool is defined in the context of the System")))