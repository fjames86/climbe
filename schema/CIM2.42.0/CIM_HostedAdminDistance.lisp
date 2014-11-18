
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_HostedAdminDistance.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_HOSTEDADMINDISTANCE (CIM_HOSTEDDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The AdminDomain that scopes the AdministrativeDistance.")
                 :KEY)
                :INITFORM "CIM_AdminDomain")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") :WEAK
                 (:DESCRIPTION
                  "The table of (global) administrative distances that are defined in the context of the AdminDomain.")
                 :KEY)
                :INITFORM "CIM_AdministrativeDistance"))
              (:CIM-NAME "CIM_HostedAdminDistance")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Network::Routes")
               (:DESCRIPTION
                "AdministrativeDistance, being a global object, is weak to the AdminDomain that contains it. This association formalizes that relationship.")))