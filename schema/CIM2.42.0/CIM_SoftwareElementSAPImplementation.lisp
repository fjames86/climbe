
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SoftwareElementSAPImplementation.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SOFTWAREELEMENTSAPIMPLEMENTATION (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The executable SoftwareElement implementing the SAP.")
                 :KEY)
                :INITFORM "CIM_SoftwareElement")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The ServiceAccessPoint implemented by the SoftwareElement.")
                 :KEY)
                :INITFORM "CIM_ServiceAccessPoint"))
              (:CIM-NAME "CIM_SoftwareElementSAPImplementation")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Application::DeploymentModel")
               (:DESCRIPTION
                "An association between a ServiceAccessPoint and how it is implemented by one or more executable SoftwareElements. Note that this association is restricted to 'executable' Elements. In earlier phases of deployment, the Software FeatureSAPImplementation association is adequate and recommended. 
The relationship between this association and Software FeatureSAPImplementation is more fully described here. SoftwareElementSAPImplementation allows the description of greater granularity than SoftwareFeatureSAPImplementation, when a SoftwareFeature is fully deployed and results in several executable Elements. These Elements may implement several different ServiceAccessPoints. 
Since SoftwareFeatures decompose into SoftwareElements, it is possible to describe how software implements a SAP by using either this association or the SoftwareFeatureSAP Implementation relationship. One or the other should be chosen. Both associations should not be used for a particular AccessPoint, since their information is redundant. 
This relationship is especially important when the SoftwareFeature and Product aspects are not described for a SoftwareElement (ie, when the acquisition and deployment of the software is not detailed). In this case, the Software ElementSAPImplementation association is the only one available to describe how an AccessPoint is implemented in software. Since SoftwareFeatures are not instantiated, it is not possible to use the SoftwareFeatureSAP Implementation association. 
The cardinality of this association is many-to-many. A ServiceAccessPoint may be provided by more than one Software Element. (If this is true, it is assumed that the Software Elements operate in conjunction.) And, any SoftwareElement may provide more than one SAP.")))