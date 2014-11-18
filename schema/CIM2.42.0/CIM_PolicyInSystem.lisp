
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PolicyInSystem.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_POLICYINSYSTEM (CIM_HOSTEDDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION "The hosting System.") :KEY)
                :INITFORM "CIM_System")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:DESCRIPTION "The hosted Policy.")
                 :KEY)
                :INITFORM "CIM_Policy"))
              (:CIM-NAME "CIM_PolicyInSystem")
              (:QUALIFIERS :ASSOCIATION :ABSTRACT (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Policy")
               (:DESCRIPTION
                "CIM_PolicyInSystem is a generic association used to establish dependency relationships between Policies and the Systems that host them. These Systems may be ComputerSystems where Policies are 'running' or they may be Policy Repositories where Policies are stored. This relationship is similar to the concept of CIM_Services being dependent on CIM_Systems as defined by the HostedService association. 

Cardinality is Max (1) for the Antecedent/System reference since Policies can only be hosted in at most one System context. Some subclasses of the association will further refine this definition to make the Policies Weak to Systems. Other subclasses of PolicyInSystem will define an optional hosting relationship. Examples of each of these are the PolicyRuleInSystem and PolicyConditionIn PolicyRepository associations, respectively.")))