
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_NetworkServicesInAdminDomain.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_NETWORKSERVICESINADMINDOMAIN (CIM_HOSTEDDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("CIM_Dependency.Antecedent"))
                 (:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The AdminDomain that hosts and administers the various network services.")
                 (:MAX "1") :KEY)
                :INITFORM "CIM_AdminDomain")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_Dependency.Dependent"))
                 (:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The network service that is hosted in the administrative domain.")
                 :KEY)
                :INITFORM "CIM_NetworkService"))
              (:CIM-NAME "CIM_NetworkServicesInAdminDomain")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("CIM_HostedDependency"))
               (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::RoutingForwarding")
               (:DESCRIPTION
                "This association establishes the Dependency relationships that exist between an administrative domain and the Network Services that it hosts. It is deprecated since AdminDomains can contain any ManagedSystemElements. There is no special relationship needed for NetworkServices. In addition, the Min (1) cardinality on AdminDomain is not valid - since it may not be possible to define every NetworkService in the context of one or more Domains.")))