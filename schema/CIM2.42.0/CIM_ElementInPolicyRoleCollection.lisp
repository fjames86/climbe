
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ElementInPolicyRoleCollection.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ELEMENTINPOLICYROLECOLLECTION (CIM_MEMBEROFCOLLECTION)
              ((COLLECTION NIL :CIM-NAME "Collection" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "Collection")
                 (:DESCRIPTION "The PolicyRoleCollection.") :KEY)
                :INITFORM "CIM_PolicyRoleCollection")
               (MEMBER NIL :CIM-NAME "Member" :QUALIFIERS
                       ((:OVERRIDE "Member")
                        (:DESCRIPTION
                         "The ManagedElement that plays the role represented by the PolicyRoleCollection.")
                        :KEY)
                       :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_ElementInPolicyRoleCollection")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Policy")
               (:DESCRIPTION
                "An ElementInPolicyRoleCollection aggregates zero or more ManagedElement subclass instances into a PolicyRoleCollection object, representing a role played by these ManagedElements. This Collection indicates that the aggregated PolicySets (aggregated by CIM_PolicySetInRoleCollection) MAY BE applied to the referenced elements. To indicate that the PolicySets ARE being enforced for the element, use the PolicySetAppliesToElement association.")))