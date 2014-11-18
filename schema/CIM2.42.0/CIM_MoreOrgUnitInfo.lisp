
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_MoreOrgUnitInfo.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_MOREORGUNITINFO (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The OrgUnit which has more information.") :KEY)
                :INITFORM "CIM_OrgUnit")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MAX "1")
                 (:DESCRIPTION "Additional data concerning the OrgUnit.") :KEY)
                :INITFORM "CIM_OtherOrgUnitInformation"))
              (:CIM-NAME "CIM_MoreOrgUnitInfo")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::User::Org")
               (:DESCRIPTION
                "CIM_MoreOrgUnitInfo is an association used to extend the information in an CIM_OrgUnit class instance.")))