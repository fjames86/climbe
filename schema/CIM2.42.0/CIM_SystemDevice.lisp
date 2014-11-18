
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SystemDevice.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SYSTEMDEVICE (CIM_SYSTEMCOMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The parent system in the Association.") :KEY)
                :INITFORM "CIM_System")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent") :WEAK
                 (:DESCRIPTION
                  "The LogicalDevice that is a component of a System.")
                 :KEY)
                :INITFORM "CIM_LogicalDevice"))
              (:CIM-NAME "CIM_SystemDevice")
              (:QUALIFIERS :ASSOCIATION (NIL "true") :COMPOSITION
               (:VERSION "2.10.0") (:UML-PACKAGE-PATH "CIM::Core::Device")
               (:DESCRIPTION
                "LogicalDevices can be aggregated by a System. This relationship is made explicit by the SystemDevice association.")))