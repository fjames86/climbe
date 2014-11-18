
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_HostedACI.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_HOSTEDACI (CIM_HOSTEDDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "Antecedent") (:MIN "1")
                 (:MAX "1") (:DESCRIPTION "The hosting system.") :KEY)
                :INITFORM "CIM_System")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "Dependent") :WEAK
                 (:DESCRIPTION "The hosted AccessControlInformation.") :KEY)
                :INITFORM "CIM_AccessControlInformation"))
              (:CIM-NAME "CIM_HostedACI")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("No value"))
               (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::User::AccessControl")
               (:DESCRIPTION
                "CIM_HostedACI is an association used to provide the namespace scoping of AccessControlInformation. Since the referenced class, AccessControlInformation, is deprecated, this Weak association is similarly deprecated. Also, although Privileges/access control can be defined in the context of a System, this is not a mandatory association nor does it provide any additional semantics for the Privilege. Therefore, HostedACI is deprecated with no replacement association.")))