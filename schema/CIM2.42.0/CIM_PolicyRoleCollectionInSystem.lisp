
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PolicyRoleCollectionInSystem.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_POLICYROLECOLLECTIONINSYSTEM (CIM_HOSTEDCOLLECTION)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The parent system responsible for the collection.")
                 :KEY)
                :INITFORM "CIM_System")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:DESCRIPTION "The Collection.") :KEY)
                :INITFORM "CIM_PolicyRoleCollection"))
              (:CIM-NAME "CIM_PolicyRoleCollectionInSystem")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Policy")
               (:DESCRIPTION
                "PolicyRoleCollectionInSystem is an association used to establish a relationship between a collection and an 'owning' System such as an AdminDomain or ComputerSystem.")))