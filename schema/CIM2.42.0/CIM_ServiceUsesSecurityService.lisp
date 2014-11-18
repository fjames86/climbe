
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ServiceUsesSecurityService.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SERVICEUSESSECURITYSERVICE (CIM_SERVICESERVICEDEPENDENCY)
              ((TYPEOFDEPENDENCY UINT16 :CIM-NAME "TypeOfDependency"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The nature of the Service-to-Service dependency. 2 - Antecedent Service shall have completed before Dependent service's functionality is available.
3 - Antecedent Service shall have started before Dependent service's functionality is available.
4 - Antecedent Service shall not be started in order for Dependent service's functionality to be available.
5 - The two Services cooperate and augment each other's function. There is no requirement implied by this value regarding the execution of the Antecedent service in order for the Dependent service to operate.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5"))
                 (:VALUES
                  ("Unknown" "Other" "Service Must Have Completed"
                   "Service Must Be Started" "Service Must Not Be Started"
                   "Cooperate")))
                :INITFORM NIL)
               (RESTARTSERVICE BOOLEAN :CIM-NAME "RestartService" :QUALIFIERS
                ((:DESCRIPTION
                  "This property describes that the Antecedent Service must be restarted after the Dependent operation is complete."))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("CIM_ServiceServiceDependency.Antecedent"))
                 (:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The required Service.") :KEY)
                :INITFORM "CIM_SecurityService")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_ServiceServiceDependency.Dependent"))
                 (:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The Service that is dependent on an underlying Service.")
                 :KEY)
                :INITFORM "CIM_Service"))
              (:CIM-NAME "CIM_ServiceUsesSecurityService")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_ServiceServiceDependency"))
               (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::User::SecurityServices")
               (:DESCRIPTION
                "This relationship associates a Service with the Security Services that it uses. This association does not add any constraints or semantics to ServiceServiceDependency. As a result, it is deprecated.")))