
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ToDirectorySpecification.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_TODIRECTORYSPECIFICATION NIL
              ((DESTINATIONDIRECTORY NIL :CIM-NAME "DestinationDirectory"
                :QUALIFIERS
                (:KEY (:MAX "1")
                 (:DESCRIPTION "The destination directory of the Action."))
                :INITFORM "CIM_DirectorySpecification")
               (FILENAME NIL :CIM-NAME "FileName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The Action against the directory."))
                :INITFORM "CIM_CopyFileAction"))
              (:CIM-NAME "CIM_ToDirectorySpecification")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Application::CheckAction")
               (:DESCRIPTION
                "The ToDirectorySpecification association identifies the target directory for a FileAction. When this association is used, the assumption is that the target directory already exists. This association cannot co-exist with a ToDirectoryAction association, since a FileAction can only involve a single target directory.")))