
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_MoreOrganizationInfo.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_MOREORGANIZATIONINFO (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The Organization which has more information.")
                 :KEY)
                :INITFORM "CIM_Organization")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MAX "1")
                 (:DESCRIPTION "Additional data concerning the Organization.")
                 :KEY)
                :INITFORM "CIM_OtherOrganizationInformation"))
              (:CIM-NAME "CIM_MoreOrganizationInfo")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::User::Org")
               (:DESCRIPTION
                "CIM_MoreOrganizationInfo is an association used to extend the information in a CIM_Organization class instance.")))