
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ContainedLocation.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CONTAINEDLOCATION (CIM_COMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MAX "1")
                 (:DESCRIPTION "The containing location.") :KEY)
                :INITFORM "CIM_Location")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION "The contained location.") :KEY)
                :INITFORM "CIM_Location"))
              (:CIM-NAME "CIM_ContainedLocation")
              (:QUALIFIERS :ASSOCIATION (NIL "true") :COMPOSITION
               (:VERSION "2.10.0") (:UML-PACKAGE-PATH "CIM::Core::Physical")
               (:DESCRIPTION
                "ContainedLocation defines one location in the context of another. For example, a campus might 'contain' a building, which in turn 'contains' a floor.")))