
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_OperatingSystemSoftwareFeature.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_OPERATINGSYSTEMSOFTWAREFEATURE (CIM_COMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION "The OperatingSystem.") :KEY)
                :INITFORM "CIM_OperatingSystem")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "The SoftwareFeatures that make up the OperatingSystem.")
                 :KEY)
                :INITFORM "CIM_SoftwareFeature"))
              (:CIM-NAME "CIM_OperatingSystemSoftwareFeature")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Application::SystemSoftware")
               (:DESCRIPTION
                "Indicates the SoftwareFeatures that make up the Operating System. The SoftwareFeatures can be part of different Products.")))