
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_J2eeResourceAdapterInModule.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_J2EERESOURCEADAPTERINMODULE (CIM_SERVICECOMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MIN "1")
                 (:DESCRIPTION
                  "The ResourceAdapter Module that is comprised of resource adapters.")
                 :KEY)
                :INITFORM "CIM_J2eeResourceAdapterModule")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent") (:MIN "1")
                 (:DESCRIPTION
                  "The resource adapter that is a part of the resource adapter Module.")
                 :KEY)
                :INITFORM "CIM_J2eeResourceAdapter"))
              (:CIM-NAME "CIM_J2eeResourceAdapterInModule")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Application::J2eeAppServer")
               (:DESCRIPTION
                "CIM_J2eeResourceAdapterInModule is an aggregation of the resource adapters contained within a deployed RAR Module.")))