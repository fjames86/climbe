
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DirectorySpecificationFile.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DIRECTORYSPECIFICATIONFILE NIL
              ((DIRECTORYSPECIFICATION NIL :CIM-NAME "DirectorySpecification"
                :QUALIFIERS
                (:KEY (:MAX "1") (:DESCRIPTION "The directory to be checked."))
                :INITFORM "CIM_DirectorySpecification")
               (FILESPECIFICATION NIL :CIM-NAME "FileSpecification" :QUALIFIERS
                (:KEY (:DESCRIPTION "The file to be checked.")) :INITFORM
                "CIM_FileSpecification"))
              (:CIM-NAME "CIM_DirectorySpecificationFile")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Application::CheckAction")
               (:DESCRIPTION
                "The CIM_DirectorySpecificationFile association identifies the directory that contains the file being checked in the CIM_ FileSpecification class.")))