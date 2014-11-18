
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_BIOSFeatureBIOSElements.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_BIOSFEATUREBIOSELEMENTS (CIM_SOFTWAREFEATURESOFTWAREELEMENTS)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION "The BIOSFeature.") :KEY)
                :INITFORM "CIM_BIOSFeature")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "The BIOSElement that implements the capabilities described by BIOSFeature.")
                 :KEY)
                :INITFORM "CIM_BIOSElement"))
              (:CIM-NAME "CIM_BIOSFeatureBIOSElements")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Application::BIOS")
               (:DESCRIPTION
                "A link between BIOSFeature and its aggregated BIOSElements.")))