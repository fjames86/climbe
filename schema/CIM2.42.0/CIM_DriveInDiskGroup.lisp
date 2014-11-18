
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DriveInDiskGroup.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DRIVEINDISKGROUP (CIM_COLLECTEDMSES)
              ((COLLECTION NIL :CIM-NAME "Collection" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "Collection") (:MAX "1")
                 (:DESCRIPTION
                  "The DiskGroup. A Drive is a member of at most one DiskGroup.")
                 :KEY)
                :INITFORM "CIM_DiskGroup")
               (MEMBER NIL :CIM-NAME "Member" :QUALIFIERS
                       ((:OVERRIDE "Member")
                        (:DESCRIPTION "The DiskDrive in the Group.") :KEY)
                       :INITFORM "CIM_DiskDrive"))
              (:CIM-NAME "CIM_DriveInDiskGroup")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::DiskGroup")
               (:DESCRIPTION
                "CIM_DriveInDiskGroup defines the DiskDrives that participate in the Group.")))