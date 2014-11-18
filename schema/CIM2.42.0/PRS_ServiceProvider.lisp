
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/PRS_ServiceProvider.xml"

(in-package #:climbe)


(DEFCIM-CLASS PRS_SERVICEPROVIDER (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The PRS_ServiceIncident.") :KEY)
                :INITFORM "PRS_ServiceIncident")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The PRS_Contact.") :KEY)
                :INITFORM "PRS_Contact"))
              (:CIM-NAME "PRS_ServiceProvider")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "PRS::Support")
               (:DESCRIPTION
                "Associates PRS_ServiceIncident to PRS_Contact to describe the Service Provider.")))