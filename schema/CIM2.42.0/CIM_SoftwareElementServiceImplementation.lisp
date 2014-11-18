
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SoftwareElementServiceImplementation.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SOFTWAREELEMENTSERVICEIMPLEMENTATION (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The executable SoftwareElement implementing the Service.")
                 :KEY)
                :INITFORM "CIM_SoftwareElement")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The Service implemented by the SoftwareElement.")
                 :KEY)
                :INITFORM "CIM_Service"))
              (:CIM-NAME "CIM_SoftwareElementServiceImplementation")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Application::DeploymentModel")
               (:DESCRIPTION
                "An association between a Service and how it is implemented by one or more executable SoftwareElements. Note that this association is restricted to 'executable' Elements. In earlier phases of deployment, the SoftwareFeatureService Implementation association is adequate and recommended. 
The relationship between this association and Software FeatureServiceImplementation is more fully described here. SoftwareElementServiceImplementation allows the description of greater granularity than SoftwareFeatureService Implementation, when a SoftwareFeature is fully deployed and results in several executable Elements. These Elements may implement several different Services. 
Since SoftwareFeatures decompose into SoftwareElements, it is possible to describe how software implements a Service by using either this association or the SoftwareFeature ServiceImplementation relationship. One or the other should be chosen. Both associations should not be used for a single Service instance, since their information is redundant. 
This relationship is especially important when the SoftwareFeature and Product aspects are not described for a SoftwareElement (ie, when the acquisition and deployment of the software is not detailed). In this case, the Software ElementServiceImplementation association is the only one available to describe how a Service is implemented in software. Since SoftwareFeatures are not instantiated, it is not possible to use the SoftwareFeatureService Implementation association. 
The cardinality of this association is many-to-many. A Service may be provided by more than one SoftwareElement. If this is true, it is assumed that the SoftwareElements operate in conjunction. And, any SoftwareElement may provide more than one Service.")))