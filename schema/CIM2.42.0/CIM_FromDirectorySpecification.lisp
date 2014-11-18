
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_FromDirectorySpecification.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_FROMDIRECTORYSPECIFICATION NIL
              ((SOURCEDIRECTORY NIL :CIM-NAME "SourceDirectory" :QUALIFIERS
                (:KEY (:MAX "1")
                 (:DESCRIPTION "The source directory of the Action."))
                :INITFORM "CIM_DirectorySpecification")
               (FILENAME NIL :CIM-NAME "FileName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The Action against the directory."))
                :INITFORM "CIM_FileAction"))
              (:CIM-NAME "CIM_FromDirectorySpecification")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Application::CheckAction")
               (:DESCRIPTION
                "The FromDirectorySpecification association identifies the source directory for a FileAction. When this association is used, the assumption is that the source directory already exists. This association cannot co-exist with a FromDirectoryAction association, since a FileAction can only involve a single source directory.")))