
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_HostedAccessPoint.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_HOSTEDACCESSPOINT (CIM_HOSTEDDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The hosting System.") :KEY)
                :INITFORM "CIM_System")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") :WEAK
                 (:DESCRIPTION "The SAPs that are hosted on this System.")
                 :KEY)
                :INITFORM "CIM_ServiceAccessPoint"))
              (:CIM-NAME "CIM_HostedAccessPoint")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::Service")
               (:DESCRIPTION
                "CIM_HostedAccessPoint is an association between a Service AccessPoint and the System on which it is provided. The cardinality of this association is one-to-many and is weak with respect to the System. Each System can host many ServiceAccessPoints. Heuristic: If the implementation of the ServiceAccessPoint is modeled, it must be implemented by a Device or SoftwareFeature that is part of the System that is hosting the ServiceAccessPoint.")))