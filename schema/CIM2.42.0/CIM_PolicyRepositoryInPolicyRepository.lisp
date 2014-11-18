
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PolicyRepositoryInPolicyRepository.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_POLICYREPOSITORYINPOLICYREPOSITORY (CIM_SYSTEMCOMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_PolicyContainerInPolicyContainer.GroupComponent"))
                 :AGGREGATE (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION
                  "A PolicyRepository that aggregates other Repositories.")
                 :KEY)
                :INITFORM "CIM_PolicyRepository")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_PolicyContainerInPolicyContainer.PartComponent"))
                 (:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "A PolicyRepository aggregated by another Repository.")
                 :KEY)
                :INITFORM "CIM_PolicyRepository"))
              (:CIM-NAME "CIM_PolicyRepositoryInPolicyRepository")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_PolicyContainerInPolicyContainer"))
               (NIL "true") (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Policy")
               (:DESCRIPTION
                "The term 'PolicyRepository' has been confusing to both developers and users of the model. The replacement class name describes model element properly and is less likely to be confused with a data repository. ContainedDomain is a general purpose mechanism for expressing domain hierarchy. 

A relationship that aggregates one or more lower-level PolicyRepositories into a higher-level Repository.")))