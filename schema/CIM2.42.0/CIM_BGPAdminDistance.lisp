
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_BGPAdminDistance.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_BGPADMINDISTANCE (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The table of (global) administrative distances that are used by the BGPService.")
                 :KEY)
                :INITFORM "CIM_AdministrativeDistance")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The BGPService object that makes BGP routing decisions.")
                 :KEY)
                :INITFORM "CIM_BGPService"))
              (:CIM-NAME "CIM_BGPAdminDistance")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Network::BGP")
               (:DESCRIPTION
                "This is a specialization of the Dependency association, and defines the relationship between a BGPService and the AdministrativeDistances that it uses to control the (BGP) routing decisions that it makes.")))