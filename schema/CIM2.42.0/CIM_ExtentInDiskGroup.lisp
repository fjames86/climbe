
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ExtentInDiskGroup.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_EXTENTINDISKGROUP (CIM_COLLECTEDMSES)
              ((COLLECTION NIL :CIM-NAME "Collection" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "Collection") (:MAX "1")
                 (:DESCRIPTION
                  "The DiskGroup. An Extent is defined within at most one DiskGroup.")
                 :KEY)
                :INITFORM "CIM_DiskGroup")
               (MEMBER NIL :CIM-NAME "Member" :QUALIFIERS
                       ((:OVERRIDE "Member")
                        (:DESCRIPTION
                         "The StorageExtent that is restricted by and participating in the Group.")
                        :KEY)
                       :INITFORM "CIM_StorageExtent"))
              (:CIM-NAME "CIM_ExtentInDiskGroup")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::DiskGroup")
               (:DESCRIPTION
                "CIM_ExtentInDiskGroup defines the StorageExtents that are located within and restricted by the Group.")))