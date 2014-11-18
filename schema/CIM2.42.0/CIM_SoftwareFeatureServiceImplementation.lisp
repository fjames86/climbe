
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SoftwareFeatureServiceImplementation.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SOFTWAREFEATURESERVICEIMPLEMENTATION (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The SoftwareFeature implementing the Service.")
                 :KEY)
                :INITFORM "CIM_SoftwareFeature")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The Service being implemented.") :KEY)
                :INITFORM "CIM_Service"))
              (:CIM-NAME "CIM_SoftwareFeatureServiceImplementation")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Application::DeploymentModel")
               (:DESCRIPTION
                "An association between a Service and how it is implemented in software. The cardinality of this association is many-to -many. A Service may be provided by more than one SoftwareFeature. When multiple SoftwareFeatures are associated with a single Service, it is assumed that these elements operate in conjunction to provide the Service. Note that any SoftwareFeature may provide more than one Service. 
If different implementations of a Service exist, each of these implementations would result in individual instantiations of the Service object. These individual instantiations would then have their own associations to the unique implementations.")))