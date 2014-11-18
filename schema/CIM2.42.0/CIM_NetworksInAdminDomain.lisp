
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_NetworksInAdminDomain.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_NETWORKSINADMINDOMAIN NIL
              ((DOMAIN NIL :CIM-NAME "Domain" :QUALIFIERS
                ((:DEPRECATED ("CIM_HostedCollection.Antecedent")) :KEY
                 (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The AdminDomain that hosts the various LogicalNetworks."))
                :INITFORM "CIM_AdminDomain")
               (NETWORK NIL :CIM-NAME "Network" :QUALIFIERS
                ((:DEPRECATED ("CIM_HostedCollection.Dependent")) :KEY :WEAK
                 (:DESCRIPTION
                  "The LogicalNetworks that are hosted by the AdminDomain."))
                :INITFORM "CIM_LogicalNetwork"))
              (:CIM-NAME "CIM_NetworksInAdminDomain")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("CIM_HostedCollection"))
               (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::Collections")
               (:DESCRIPTION
                "This association is used to define the set of Logical Networks contained in an AdminDomain. This has the implied semantics that this set of LogicalNetworks are all managed by the same network administrator that manages the domain. 

Since the LogicalNetwork class is deprecated in lieu of ConnectivityCollection, this association is no longer necessary. It is deprecated to the HostedCollection association, that is inherited by ConnectivityCollection from its superclass, SystemSpecificCollection.")))