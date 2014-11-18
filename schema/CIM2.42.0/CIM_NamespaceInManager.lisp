
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_NamespaceInManager.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_NAMESPACEINMANAGER (CIM_HOSTEDDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The ObjectManager containing a Namespace.")
                 :KEY)
                :INITFORM "CIM_ObjectManager")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") :WEAK
                 (:DESCRIPTION "The Namespace in an ObjectManager.") :KEY)
                :INITFORM "CIM_Namespace"))
              (:CIM-NAME "CIM_NamespaceInManager")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("CIM_HostedDependency"))
               (:VERSION "2.39.0") (:UML-PACKAGE-PATH "CIM::Interop")
               (:DESCRIPTION
                "CIM_NamespaceInManager is deprecated. See CIM_WBEMServerNamespace and CIM_HostedDependency to model the relationship between a WBEMServer and the hosted namespaces.
NamespaceInManager is an association describing the Namespaces hosted by a CIM ObjectManager.")))