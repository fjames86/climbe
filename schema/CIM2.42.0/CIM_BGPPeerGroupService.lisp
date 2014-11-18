
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_BGPPeerGroupService.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_BGPPEERGROUPSERVICE (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The BGPPeerGroup in which the BGPService is executing.")
                 :KEY)
                :INITFORM "CIM_BGPPeerGroup")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The BGPService that is executing in the BGPPeerGroup.")
                 :KEY)
                :INITFORM "CIM_BGPService"))
              (:CIM-NAME "CIM_BGPPeerGroupService")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::BGP")
               (:DESCRIPTION
                "This defines the relationship between a BGPService and a specific BGPPeerGroup in which it is executing.")))