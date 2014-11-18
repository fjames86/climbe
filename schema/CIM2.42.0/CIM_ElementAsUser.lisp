
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ElementAsUser.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ELEMENTASUSER (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("CIM_AssignedIdentity.ManagedElement"))
                 (:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The ManagedElement that has UsersAccess.")
                 :KEY)
                :INITFORM "CIM_ManagedElement")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_AssignedIdentity.IdentityInfo"))
                 (:OVERRIDE "Dependent")
                 (:DESCRIPTION "The 'owned' UsersAccess.") :KEY)
                :INITFORM "CIM_UsersAccess"))
              (:CIM-NAME "CIM_ElementAsUser")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("CIM_AssignedIdentity"))
               (:VERSION "2.8.0") (:UML-PACKAGE-PATH "CIM::User::UsersAccess")
               (:DESCRIPTION
                "CIM_ElementAsUser is an association used to establish the 'ownership' of UsersAccess object instances. That is, the ManagedElement may have UsersAccess to systems and, therefore, be 'users' on those systems. UsersAccess instances must have an 'owning' ManagedElement. Typically, the ManagedElements will be limited to Collection, Person, Service and ServiceAccessPoint. Other non-human ManagedElements that might be thought of as having UsersAccess (e.g., a device or system) have services that have the UsersAccess. 

Since the UsersAccess class is deprecated in lieu of CIM_Identity, this association is also deprecated and replaced by one of similar semantics, AssignedIdentity. It should be noted that the new class is NOT defined as a Dependency relationship, since it was felt that the association was not truly a dependency of the element on its access.")))