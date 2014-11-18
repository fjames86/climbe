
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AllocatedFromStoragePool.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ALLOCATEDFROMSTORAGEPOOL (CIM_DEPENDENCY)
              ((SPACECONSUMED UINT64 :CIM-NAME "SpaceConsumed" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "Space consumed from this Pool, in bytes. This value MUST be maintained so that, relative to the Antecedent StoragePool, it is possible to compute TotalManagedSpace as StoragePool.RemainingManagedSpace plus the sum of SpaceConsumed from all of the AllocatedFromStoragePool references from the antecedent StoragePool.")
                 (NIL "Bytes")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StoragePool.TotalManagedSpace"
                   "CIM_StoragePool.RemainingManagedSpace")))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:DESCRIPTION "The StoragePool.")
                 :KEY)
                :INITFORM "CIM_StoragePool")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The subsidiary element.") :KEY)
                :INITFORM "CIM_LogicalElement"))
              (:CIM-NAME "CIM_AllocatedFromStoragePool")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Device::StorageServices")
               (:DESCRIPTION
                "AllocatedFromStoragePool is an association describing how LogicalElements are allocated from underlying StoragePools. These elements typically would be subclasses of StorageExtents or StoragePools.")))