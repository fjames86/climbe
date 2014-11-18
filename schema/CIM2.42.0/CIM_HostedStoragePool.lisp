
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_HostedStoragePool.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_HOSTEDSTORAGEPOOL (CIM_SYSTEMCOMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The parent system in the Association.") :KEY)
                :INITFORM "CIM_System")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "The StoragePool that is a component of a System.")
                 :KEY)
                :INITFORM "CIM_StoragePool"))
              (:CIM-NAME "CIM_HostedStoragePool")
              (:QUALIFIERS :ASSOCIATION (NIL "true") :COMPOSITION
               (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Device::StorageServices")
               (:DESCRIPTION
                "SystemStoragePool is a specialization of SystemComponent association that establishes that the StoragePool is defined in the context of the System.")))