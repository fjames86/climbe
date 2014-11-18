
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ServiceComponent.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SERVICECOMPONENT (CIM_COMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION "The parent Service.") :KEY)
                :INITFORM "CIM_Service")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION "The component Service.") :KEY)
                :INITFORM "CIM_Service"))
              (:CIM-NAME "CIM_ServiceComponent")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Core::Service")
               (:DESCRIPTION
                "The ServiceComponent aggregation models a set of subordinate Services that are aggregated together to form a higher-level service.")))