
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/PRS_FeatureResource.xml"

(in-package #:climbe)


(DEFCIM-CLASS PRS_FEATURERESOURCE (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:DESCRIPTION "The PRS_Feature.")
                 :KEY)
                :INITFORM "PRS_Feature")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:DESCRIPTION "The PRS_Resource.")
                 :KEY)
                :INITFORM "PRS_Resource"))
              (:CIM-NAME "PRS_FeatureResource")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "PRS::Support")
               (:DESCRIPTION
                "Associates PRS_Feature with PRS_Resource. This is used to track labor and costs associated with specific tasks defined in a Feature object.")))