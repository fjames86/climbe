
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_J2eeServletInModule.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_J2EESERVLETINMODULE (CIM_SERVICECOMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The Web Module that is comprised of servlets.")
                 :KEY)
                :INITFORM "CIM_J2eeWebModule")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent") (:MIN "1")
                 (:DESCRIPTION "The Servlet that is a part of the Web Module.")
                 :KEY)
                :INITFORM "CIM_J2eeServlet"))
              (:CIM-NAME "CIM_J2eeServletInModule")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Application::J2eeAppServer")
               (:DESCRIPTION
                "CIM_J2eeServletInModule is a aggregation of the servlet components within a deployed WAR module.")))