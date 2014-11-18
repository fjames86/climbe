
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ServiceServiceDependency.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SERVICESERVICEDEPENDENCY (CIM_PROVIDESSERVICETOELEMENT)
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
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The required Service.") :KEY)
                :INITFORM "CIM_Service")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The Service that is dependent on an underlying Service.")
                 :KEY)
                :INITFORM "CIM_Service"))
              (:CIM-NAME "CIM_ServiceServiceDependency")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.16.0")
               (:UML-PACKAGE-PATH "CIM::Core::Service")
               (:DESCRIPTION
                "CIM_ServiceServiceDependency is an association between a Service and another Service, which indicates that the latter cooperates with the former, is required to be present, required to have completed, or must be absent for the former Service to provide its functionality. For example, Boot Services might be dependent upon underlying system initialization Services. In the case of the initialization Services, the Boot Service might be dependent on the completion of the init Services. 
When examining the ServiceServiceDependency class definition, note that its superclass ProvidesServiceToElement is deprecated. Unfortunately, ProvidesServiceToElement cannot be removed from the object hierarchy without a major Schema release. When or if a major release occurs, the ProvidesServiceToElement superclass will be removed, and ServiceServiceDependency will subclass from CIM_Dependency directly.")))