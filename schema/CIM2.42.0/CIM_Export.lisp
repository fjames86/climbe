
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_Export.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_EXPORT NIL
              ((EXPORTEDDIRECTORYNAME STRING :CIM-NAME "ExportedDirectoryName"
                :QUALIFIERS
                ((:DESCRIPTION "Name under which the Directory is exported."))
                :INITFORM NIL)
               (LOCALFS NIL :CIM-NAME "LocalFS" :QUALIFIERS
                (:KEY (:MAX "1") (:DESCRIPTION "The LocalFileSystem."))
                :INITFORM "CIM_LocalFileSystem")
               (DIRECTORY NIL :CIM-NAME "Directory" :QUALIFIERS
                          (:KEY
                           (:DESCRIPTION "The Directory exported for mount."))
                          :INITFORM "CIM_Directory"))
              (:CIM-NAME "CIM_Export")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::System::FileElements")
               (:DESCRIPTION
                "An association between a LocalFileSystem and its Directories indicating that the specified Directories are available for mount. When exporting an entire FileSystem, the Directory should reference the topmost directory of the FileSystem.")))