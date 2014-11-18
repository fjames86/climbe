
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_HostedCollection.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_HOSTEDCOLLECTION (CIM_HOSTEDDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The scoping system.") :KEY)
                :INITFORM "CIM_System")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The collection defined in the context of a system.")
                 :KEY)
                :INITFORM "CIM_SystemSpecificCollection"))
              (:CIM-NAME "CIM_HostedCollection")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::Collection")
               (:DESCRIPTION
                "HostedCollection defines a SystemSpecificCollection in the context of a scoping System. It represents a Collection that has meaning only in the context of a System, a Collection whose elements are restricted by the definition of the System, or both of these types of Collections.")))