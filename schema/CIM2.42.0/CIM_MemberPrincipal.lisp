
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_MemberPrincipal.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_MEMBERPRINCIPAL (CIM_MEMBEROFCOLLECTION)
              ((USERACCESSBY UINT16 :CIM-NAME "UserAccessBy" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "A MemberPrincipal may be identifed in several ways that may be either direct or indirect membership in the collection. 
-A 'UsersAccess' membership directly identifies the user by the UsersAccess object instance. 
- An 'Account' membership directly identifies the user by the Account object class instance. 
- A 'UsingElement' membership indirectly identifies the user by the ManagedElement object instance that has ElementAsUser associations to UsersAccess object instances. Hence, all UsersAccess instances are indirectly included in the collection.")
                 (:VALUE-MAP ("1" "2" "3" "4"))
                 (:VALUES
                  ("UsersAccess" "Account" "UsingElement"
                   "CredentialManagementService")))
                :INITFORM NIL)
               (COLLECTION NIL :CIM-NAME "Collection" :QUALIFIERS
                ((:DEPRECATED ("CIM_MemberOfCollection.Collection")) :AGGREGATE
                 (:OVERRIDE "Collection") :KEY
                 (:DESCRIPTION "The Collection that aggregates members."))
                :INITFORM "CIM_Collection")
               (MEMBER NIL :CIM-NAME "Member" :QUALIFIERS
                       ((:DEPRECATED ("CIM_MemberOfCollection.Member"))
                        (:OVERRIDE "Member") :KEY
                        (:DESCRIPTION
                         "The aggregated member of the Collection."))
                       :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_MemberPrincipal")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_MemberOfCollection")) (NIL "true")
               (:VERSION "2.8.0") (:UML-PACKAGE-PATH "CIM::User::Org")
               (:DESCRIPTION
                "CIM_MemberPrincipal is an aggregation used to establish membership of principals (i.e., users) in a Collection. That membership can be established either directly or indirectly as indicated in the UsersAccessBy property. For example, a user may be identified directly by their userid (i.e., Account object instance) or the user may be identified indirectly by realm from which a ticket was issued (i.e., CredentialManagementService object instance). 

This association is deprecated in lieu of its superclass. Usage feedback on the class has indicated confusion regarding defining the members of the collection. Also, the UsersAccess aspects of this association have been deprecated.")))