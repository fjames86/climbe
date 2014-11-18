
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_HostedDependency.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_HOSTEDDEPENDENCY (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION "The scoping ManagedElement.") :KEY)
                :INITFORM "CIM_ManagedElement")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The hosted ManagedElement.") :KEY)
                :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_HostedDependency")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Core::CoreElements")
               (:DESCRIPTION
                "HostedDependency defines a ManagedElement in the context of another ManagedElement in which it resides.")))