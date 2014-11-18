
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_FromDirectoryAction.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_FROMDIRECTORYACTION NIL
              ((SOURCEDIRECTORY NIL :CIM-NAME "SourceDirectory" :QUALIFIERS
                (:KEY (:MAX "1")
                 (:DESCRIPTION "The source directory of the Action."))
                :INITFORM "CIM_DirectoryAction")
               (FILENAME NIL :CIM-NAME "FileName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The Action against the directory."))
                :INITFORM "CIM_FileAction"))
              (:CIM-NAME "CIM_FromDirectoryAction")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Application::CheckAction")
               (:DESCRIPTION
                "The FromDirectoryAction association identifies the source directory for a FileAction. When this association is used, the assumption is that the source directory was created by a previous Action. This association cannot co-exist with a FromDirectorySpecification association, since a FileAction can only involve a single source directory.")))