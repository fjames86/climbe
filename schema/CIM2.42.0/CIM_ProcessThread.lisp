
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ProcessThread.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PROCESSTHREAD (CIM_COMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The Process.") :KEY)
                :INITFORM "CIM_Process")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent") :WEAK
                 (:DESCRIPTION
                  "The Thread running in the context of the Process.")
                 :KEY)
                :INITFORM "CIM_Thread"))
              (:CIM-NAME "CIM_ProcessThread")
              (:QUALIFIERS :ASSOCIATION (NIL "true") :COMPOSITION
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::System::Processing")
               (:DESCRIPTION
                "A link between a Process and the Thread(s) running in the context of this Process.")))