
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SoftwareFeatureSAPImplementation.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SOFTWAREFEATURESAPIMPLEMENTATION (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The SoftwareFeature implementing the SAP.")
                 :KEY)
                :INITFORM "CIM_SoftwareFeature")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The AccessPoint being implemented.") :KEY)
                :INITFORM "CIM_ServiceAccessPoint"))
              (:CIM-NAME "CIM_SoftwareFeatureSAPImplementation")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Application::DeploymentModel")
               (:DESCRIPTION
                "An association between a ServiceAccessPoint and how it is implemented in software. The cardinality of this association is many-to-many. A SAP may be provided by more than one SoftwareFeature. When multiple SoftwareFeatures are associated with a single SAP, it is assumed that these elements operate in conjunction to provide the AccessPoint. Note that any SoftwareFeature may provide more than one ServiceAccessPoint. 
If different implementations of a SAP exist, each of these implementations would result in individual instantiations of the ServiceAccessPoint object. These individual instantiations would then have their own associations to the unique implementations.")))