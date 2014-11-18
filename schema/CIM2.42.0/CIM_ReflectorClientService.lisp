
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ReflectorClientService.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_REFLECTORCLIENTSERVICE (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION
                  "The Cluster for which this Service is being defined.")
                 :KEY)
                :INITFORM "CIM_BGPCluster")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MIN "1")
                 (:DESCRIPTION
                  "The BGPService to handles routing information as a client in the Cluster.")
                 :KEY)
                :INITFORM "CIM_BGPService"))
              (:CIM-NAME "CIM_ReflectorClientService")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Network::BGP")
               (:DESCRIPTION
                "This association will serve as the base class for handling BGP routing information for clients of the reflector of this Cluster.")))