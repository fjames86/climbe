
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ManagesAccountOnSystem.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_MANAGESACCOUNTONSYSTEM (CIM_SECURITYSERVICEFORSYSTEM)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_ServiceAvailableToElement.ServiceProvided"))
                 (:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "An AccountManagementService that manages accounts for the system.")
                 :KEY)
                :INITFORM "CIM_AccountManagementService")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_ServiceAvailableToElement.UserOfService"))
                 (:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The system that is dependent on the AccountManagementService.")
                 :KEY)
                :INITFORM "CIM_System"))
              (:CIM-NAME "CIM_ManagesAccountOnSystem")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_ServiceAvailableToElement.UserOfService"))
               (:VERSION "2.37.0") (:UML-PACKAGE-PATH "CIM::User::Account")
               (:DESCRIPTION
                "The CIM_ManagesAccountOnSystem provides the association between a System and the AccountManagementService that manages accounts for that system. This association does not add any constraints or semantics to ServiceAvailableToElement. As a result, it is deprecated.")))