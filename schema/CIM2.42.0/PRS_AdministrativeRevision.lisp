
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/PRS_AdministrativeRevision.xml"

(in-package #:climbe)


(DEFCIM-CLASS PRS_ADMINISTRATIVEREVISION (CIM_HOSTEDDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The PRS_Administrative.") :KEY)
                :INITFORM "PRS_Administrative")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:DESCRIPTION "The PRS_Revision.")
                 :KEY)
                :INITFORM "PRS_Revision"))
              (:CIM-NAME "PRS_AdministrativeRevision")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "PRS::Support")
               (:DESCRIPTION
                "Associates PRS_Administrative with PRS_Revision.")))