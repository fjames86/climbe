
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_J2eeEJBInModule.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_J2EEEJBINMODULE (CIM_SERVICECOMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The EJB Module that is comprised of EJBs.")
                 :KEY)
                :INITFORM "CIM_J2eeEJBModule")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent") (:MIN "1")
                 (:DESCRIPTION "The EJB that is a part of the EJB Module.")
                 :KEY)
                :INITFORM "CIM_J2eeEJB"))
              (:CIM-NAME "CIM_J2eeEJBInModule")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Application::J2eeAppServer")
               (:DESCRIPTION
                "CIM_J2eeEJBInModule is a aggregation of the EJB components within a deployed EJB JAR module.")))