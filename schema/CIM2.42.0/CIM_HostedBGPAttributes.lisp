
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_HostedBGPAttributes.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_HOSTEDBGPATTRIBUTES (CIM_HOSTEDDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The AutonomousSystem that scopes the BGP attributes.")
                 :KEY)
                :INITFORM "CIM_AutonomousSystem")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") :WEAK
                 (:DESCRIPTION
                  "The BGP attributes defined in the context of the AutonomousSystem.")
                 :KEY)
                :INITFORM "CIM_BGPAttributes"))
              (:CIM-NAME "CIM_HostedBGPAttributes")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::BGP")
               (:DESCRIPTION
                "The class BGPAttributes is weak to the AutonomousSystem that contains it. This association formalizes that relationship.")))