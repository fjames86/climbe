
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ApplicationSystemHierarchy.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_APPLICATIONSYSTEMHIERARCHY (CIM_COMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MAX "1")
                 (:DESCRIPTION
                  "The parent ApplicationSystem in the association.")
                 :KEY)
                :INITFORM "CIM_ApplicationSystem")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "The child ApplicationSystem in the association.")
                 :KEY)
                :INITFORM "CIM_ApplicationSystem"))
              (:CIM-NAME "CIM_ApplicationSystemHierarchy")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Application::AppRuntime")
               (:DESCRIPTION
                "Application systems may have arbitrarily complex structures. It may be necessary to build application system hierarchies including the two-step hierarchy of distributed and local systems. ApplicationSystemHierarchy allows building containment trees (only one parent at a time). It should not be used to express use-relationships; use CIM_ApplicationSystemDependency instead.")))