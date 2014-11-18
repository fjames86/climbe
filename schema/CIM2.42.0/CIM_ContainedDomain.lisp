
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ContainedDomain.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CONTAINEDDOMAIN (CIM_SYSTEMCOMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION
                  "An AdminDomain that aggregates other AdminDomains.")
                 :KEY)
                :INITFORM "CIM_AdminDomain")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "An AdminDomain aggregated by another AdminDomain.")
                 :KEY)
                :INITFORM "CIM_AdminDomain"))
              (:CIM-NAME "CIM_ContainedDomain")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Core::CoreElements")
               (:DESCRIPTION
                "A relationship that aggregates one or more lower-level AdminDomain instances into a higher-level AdminDomain.")))