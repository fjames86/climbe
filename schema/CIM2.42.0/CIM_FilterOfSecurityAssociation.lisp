
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_FilterOfSecurityAssociation.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_FILTEROFSECURITYASSOCIATION (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION
                  "FilterList describing the traffic to be selected/matched.")
                 :KEY)
                :INITFORM "CIM_FilterList")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "SecurityAssociation using the FilterList as its traffic selector.")
                 :KEY)
                :INITFORM "CIM_SecurityAssociationEndpoint"))
              (:CIM-NAME "CIM_FilterOfSecurityAssociation")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Network::IPsec")
               (:DESCRIPTION
                "FilterOfSecurityAssociation associates a network traffic specification (i.e., a FilterList) with a SecurityAssociation Endpoint, to which the filter list applies.")))