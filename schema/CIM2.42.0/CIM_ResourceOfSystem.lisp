
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ResourceOfSystem.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_RESOURCEOFSYSTEM (CIM_SYSTEMCOMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The System in whose context the Resource exists and is allocated.")
                 :KEY)
                :INITFORM "CIM_System")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION "A Resource of the System.") :KEY)
                :INITFORM "CIM_SystemResource"))
              (:CIM-NAME "CIM_ResourceOfSystem")
              (:QUALIFIERS :ASSOCIATION (NIL "true") :COMPOSITION
               (:VERSION "2.7.2")
               (:UML-PACKAGE-PATH "CIM::System::SystemResources")
               (:DESCRIPTION
                "An association between a System and a SystemResource that exists and is allocated in the context of the System.")))