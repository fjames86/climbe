
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_FileStorage.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_FILESTORAGE (CIM_COMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The FileSystem.") :KEY)
                :INITFORM "CIM_FileSystem")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent") :WEAK
                 (:DESCRIPTION
                  "The LogicalFile stored in the context of the FileSystem.")
                 :KEY)
                :INITFORM "CIM_LogicalFile"))
              (:CIM-NAME "CIM_FileStorage")
              (:QUALIFIERS :ASSOCIATION (NIL "true") :COMPOSITION
               (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::System::FileElements")
               (:DESCRIPTION
                "A link between the FileSystem and the LogicalFile(s) addressed through this FileSystem.")))