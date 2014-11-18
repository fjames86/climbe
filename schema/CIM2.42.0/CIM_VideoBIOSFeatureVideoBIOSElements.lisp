
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_VideoBIOSFeatureVideoBIOSElements.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_VIDEOBIOSFEATUREVIDEOBIOSELEMENTS
              (CIM_SOFTWAREFEATURESOFTWAREELEMENTS)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION "The VideoBIOSFeature.") :KEY)
                :INITFORM "CIM_VideoBIOSFeature")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "The VideoBIOSElement that implements the capabilities described by VideoBIOSFeature.")
                 :KEY)
                :INITFORM "CIM_VideoBIOSElement"))
              (:CIM-NAME "CIM_VideoBIOSFeatureVideoBIOSElements")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Application::BIOS")
               (:DESCRIPTION
                "A link between VideoBIOSFeature and its aggregated VideoBIOSElements.")))