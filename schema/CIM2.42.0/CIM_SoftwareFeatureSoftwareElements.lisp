
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SoftwareFeatureSoftwareElements.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SOFTWAREFEATURESOFTWAREELEMENTS (CIM_COMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION
                  "The SoftwareFeature that groups the SoftwareElement.")
                 :KEY)
                :INITFORM "CIM_SoftwareFeature")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "The SoftwareElement that makes up the Feature.")
                 :KEY)
                :INITFORM "CIM_SoftwareElement"))
              (:CIM-NAME "CIM_SoftwareFeatureSoftwareElements")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Application::DeploymentModel")
               (:DESCRIPTION
                "SoftwareFeatureSoftwareElements identifies the Software Elements that make up a particular SoftwareFeature.")))