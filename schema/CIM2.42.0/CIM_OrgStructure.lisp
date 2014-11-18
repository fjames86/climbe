
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_OrgStructure.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ORGSTRUCTURE NIL
              ((PARENT NIL :CIM-NAME "Parent" :QUALIFIERS
                (:KEY :AGGREGATE (:MAX "1")
                 (:DESCRIPTION
                  "The organizational parent in this association."))
                :INITFORM "CIM_OrganizationalEntity")
               (CHILD NIL :CIM-NAME "Child" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The organizational child in this association, i.e., the sub-unit or other owned object instance."))
                :INITFORM "CIM_OrganizationalEntity"))
              (:CIM-NAME "CIM_OrgStructure")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::User::Org")
               (:DESCRIPTION
                "CIM_OrgStructure is an association used to establish parent-child relationships between OrganizationalEntity instances. This is used to capture organizational relationships between object instances such as those that are imported from an LDAP-accessible directory.")))