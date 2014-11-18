
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SecurityServiceForSystem.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SECURITYSERVICEFORSYSTEM (CIM_PROVIDESSERVICETOELEMENT)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_ServiceAvailableToElement.ServiceProvided"))
                 (:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The SecurityService that provides services for the system.")
                 :KEY)
                :INITFORM "CIM_SecurityService")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_ServiceAvailableToElement.UserOfService"))
                 (:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The system that is dependent on the security service.")
                 :KEY)
                :INITFORM "CIM_System"))
              (:CIM-NAME "CIM_SecurityServiceForSystem")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_ServiceAvailableToElement"))
               (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::User::SecurityServices")
               (:DESCRIPTION
                "The CIM_SecurityServiceForSystem provides the association between a System and a SecurityService that provides services for that system. This association does not add any constraints or semantics to ServiceAvailableToElement. As a result, it is deprecated.")))