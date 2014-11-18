
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_OSProcess.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_OSPROCESS (CIM_COMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The OperatingSystem.") :KEY)
                :INITFORM "CIM_OperatingSystem")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent") :WEAK
                 (:DESCRIPTION
                  "The Process running in the context of the OperatingSystem.")
                 :KEY)
                :INITFORM "CIM_Process"))
              (:CIM-NAME "CIM_OSProcess")
              (:QUALIFIERS :ASSOCIATION (NIL "true") :COMPOSITION
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::System::Processing")
               (:DESCRIPTION
                "A link between the OperatingSystem and Process(es) running in the context of this OperatingSystem.")))