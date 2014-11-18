
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SnapshotOfExtent.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SNAPSHOTOFEXTENT (CIM_DEPENDENCY)
              ((SNAPSHOTTYPE UINT16 :CIM-NAME "SnapshotType" :QUALIFIERS
                ((:DEPRECATED ("CIM_StorageSynchronized.CopyType"))
                 (:DESCRIPTION "The type of snapshot.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4"))
                 (:VALUES
                  ("Other" "Unknown" "Copy" "Before Delta" "After Delta")))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION "The StorageExtent.") :KEY)
                :INITFORM "CIM_StorageExtent")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "Dependent")
                 (:DESCRIPTION "The Snapshot.") :KEY)
                :INITFORM "CIM_Snapshot"))
              (:CIM-NAME "CIM_SnapshotOfExtent")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("No value"))
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Device::SccExtents")
               (:DESCRIPTION
                "Deprecated. Snapshots are now modeled in a more abstract way using StorageExtent and CIM_StorageSynchronized. 
SnapshotOfExtent is an association between an Extent and its Snapshot. This relationship is made explicit in this association.")))