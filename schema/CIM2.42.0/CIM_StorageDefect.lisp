
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_StorageDefect.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_STORAGEDEFECT NIL
              ((EXTENT NIL :CIM-NAME "Extent" :QUALIFIERS
                (:KEY :AGGREGATE (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The Extent reference defines the StorageExtent on which the errors occurred."))
                :INITFORM "CIM_StorageExtent")
               (ERROR NIL :CIM-NAME "Error" :QUALIFIERS
                      (:KEY :WEAK
                       (:DESCRIPTION
                        "Error references the Error object, defining the starting and ending addresses that are 'mapped out' of the Storage Extent."))
                      :INITFORM "CIM_StorageError"))
              (:CIM-NAME "CIM_StorageDefect")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Device::StorageExtents")
               (:DESCRIPTION
                "The StorageDefect aggregation collects the StorageErrors for a StorageExtent.")))