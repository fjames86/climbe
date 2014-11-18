
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_KDCIssuesKerberosTicket.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_KDCISSUESKERBEROSTICKET (CIM_MANAGEDCREDENTIAL)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("CIM_ServiceAffectsElement.AffectingElement"))
                 (:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The issuing KDC.") :KEY)
                :INITFORM "CIM_KerberosKeyDistributionCenter")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_ServiceAffectsElement.AffectedElement"))
                 (:OVERRIDE "Dependent") :WEAK
                 (:DESCRIPTION "The managed credential.") :KEY)
                :INITFORM "CIM_KerberosTicket"))
              (:CIM-NAME "CIM_KDCIssuesKerberosTicket")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_ServiceAffectsElement")) (:VERSION "2.16.0")
               (:UML-PACKAGE-PATH "CIM::User::Kerberos")
               (:DESCRIPTION
                "The KDC issues and owns Kerberos tickets. This association captures the relationship between the KDC and its issued tickets.")))