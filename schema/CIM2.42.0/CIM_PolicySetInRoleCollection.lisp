
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PolicySetInRoleCollection.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_POLICYSETINROLECOLLECTION (CIM_MEMBEROFCOLLECTION)
              ((COLLECTION NIL :CIM-NAME "Collection" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "Collection")
                 (:DESCRIPTION "The PolicyRoleCollection.") :KEY)
                :INITFORM "CIM_PolicyRoleCollection")
               (MEMBER NIL :CIM-NAME "Member" :QUALIFIERS
                       ((:OVERRIDE "Member")
                        (:DESCRIPTION
                         "The PolicySet that supports/enforces the PolicyRole for the elements in the PolicyRoleCollection.")
                        :KEY)
                       :INITFORM "CIM_PolicySet"))
              (:CIM-NAME "CIM_PolicySetInRoleCollection")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Policy")
               (:DESCRIPTION
                "PolicySetInRoleCollection aggregates zero or more PolicyRules and PolicyGroups (i.e., the subclasses of PolicySet) into a PolicyRoleCollection object, representing a role supported/enforced by the PolicySet.")))