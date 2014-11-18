
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ApplicationSystemSoftwareFeature.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_APPLICATIONSYSTEMSOFTWAREFEATURE (CIM_SYSTEMCOMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION
                  "The ApplicationSystem that aggregates the Features.")
                 :KEY)
                :INITFORM "CIM_ApplicationSystem")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION "The Features in an ApplicationSystem.") :KEY)
                :INITFORM "CIM_SoftwareFeature"))
              (:CIM-NAME "CIM_ApplicationSystemSoftwareFeature")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Application::DeploymentModel")
               (:DESCRIPTION
                "The ApplicationSystemSoftwareFeature association identifies the Features that make up a particular ApplicationSystem. The SoftwareFeatures can be scoped by different Products.")))