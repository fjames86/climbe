
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SoftwareFeatureComponent.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SOFTWAREFEATURECOMPONENT (CIM_COMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION "The parent SoftwareFeature.") :KEY)
                :INITFORM "CIM_SoftwareFeature")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION "The component SoftwareFeature.") :KEY)
                :INITFORM "CIM_SoftwareFeature"))
              (:CIM-NAME "CIM_SoftwareFeatureComponent")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Application::DeploymentModel")
               (:DESCRIPTION
                "The SoftwareFeatureComponent aggregation models a set of subordinate or independent Software Features of a Product. These are aggregated together to form a higher-level or large grain Feature under the same Product.")))