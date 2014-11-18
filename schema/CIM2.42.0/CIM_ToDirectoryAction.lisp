
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ToDirectoryAction.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_TODIRECTORYACTION NIL
              ((DESTINATIONDIRECTORY NIL :CIM-NAME "DestinationDirectory"
                :QUALIFIERS
                (:KEY (:MAX "1")
                 (:DESCRIPTION "The destination directory of the Action."))
                :INITFORM "CIM_DirectoryAction")
               (FILENAME NIL :CIM-NAME "FileName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The Action against the directory."))
                :INITFORM "CIM_CopyFileAction"))
              (:CIM-NAME "CIM_ToDirectoryAction")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Application::CheckAction")
               (:DESCRIPTION
                "The ToDirectoryAction association identifies the target directory for a FileAction. When this association is used, the assumption is that the target directory was created by a previous Action. This association cannot co-exist with a ToDirectorySpecification association, since a FileAction can only involve a single target directory.")))