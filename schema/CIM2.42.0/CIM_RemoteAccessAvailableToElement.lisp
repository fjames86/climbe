
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_RemoteAccessAvailableToElement.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_REMOTEACCESSAVAILABLETOELEMENT (CIM_DEPENDENCY)
              ((ISDEFAULT BOOLEAN :CIM-NAME "IsDefault" :QUALIFIERS
                ((:DESCRIPTION
                  "Indicates that this access information is defined as a default configuration for the system."))
                :INITFORM NIL)
               (ORDEROFACCESS UINT16 :CIM-NAME "OrderOfAccess" :QUALIFIERS
                ((:DESCRIPTION
                  "When an element is accessing remote services and systems, it MAY be necessary to order those accesses. This property defines that ordering - where lower numbers indicate a higher priority for access. A value of 0 (default) indicates that ordering does not apply. If multiple RemoteAccessPoint instances have the same value for OrderOfAccess, then these AccessPoints MAY be used in any sequence defined by the implementation."))
                :INITFORM "0")
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The remote server or system.") :KEY)
                :INITFORM "CIM_RemoteServiceAccessPoint")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The EnabledLogicalElement which has knowledge of the remote server or system.")
                 :KEY)
                :INITFORM "CIM_EnabledLogicalElement"))
              (:CIM-NAME "CIM_RemoteAccessAvailableToElement")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.19.0")
               (:UML-PACKAGE-PATH "CIM::Network::Misc")
               (:DESCRIPTION
                "Describes an element's knowledge regarding accessing other (i.e., remote) Servers and Systems.")))