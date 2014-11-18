
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/PRS_ServiceRequester.xml"

(in-package #:climbe)


(DEFCIM-CLASS PRS_SERVICEREQUESTER (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The PRS_ServiceIncident.") :KEY)
                :INITFORM "PRS_ServiceIncident")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The PRS_Contact.") :KEY)
                :INITFORM "PRS_Contact"))
              (:CIM-NAME "PRS_ServiceRequester")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "PRS::Support")
               (:DESCRIPTION
                "PRS_ServiceRequester associates a PRS_ServiceIncident with a PRS_Contact representing the entity requesting service. Note that the Contact class is used for both Requesters and Providers, the context is determined by which association exists.")))