
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_J2eeResourceOnServer.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_J2EERESOURCEONSERVER (CIM_RESOURCEOFSYSTEM)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                ((:OVERRIDE "GroupComponent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The Server exposing the resources.") :AGGREGATE
                 :KEY)
                :INITFORM "CIM_J2eeServer")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "The resource that is a component of the server.")
                 :KEY)
                :INITFORM "CIM_J2eeResource"))
              (:CIM-NAME "CIM_J2eeResourceOnServer")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Application::J2eeAppServer")
               (:DESCRIPTION
                "CIM_J2eeResourceOnServer is an association that establishes the relationship between a J2EE server and its resources.")))