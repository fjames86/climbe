
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ResidesOnExtent.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_RESIDESONEXTENT (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:DESCRIPTION "The StorageExtent.")
                 :KEY)
                :INITFORM "CIM_StorageExtent")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The LogicalElement that is located on the StorageExtent.")
                 :KEY)
                :INITFORM "CIM_LogicalElement"))
              (:CIM-NAME "CIM_ResidesOnExtent")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::System::FileElements")
               (:DESCRIPTION
                "An association between a LogicalElement and the StorageExtent where it is located. Typically, a FileSystem ResidesOn a LogicalDisk. However, it is possible for a logical file or other internal data store to reside directly on a StorageExtent or appropriate subclass.")))