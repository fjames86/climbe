
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DirectoryContainsFile.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DIRECTORYCONTAINSFILE (CIM_COMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MAX "1")
                 (:DESCRIPTION "The Directory.") :KEY)
                :INITFORM "CIM_Directory")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "The LogicalFile 'contained within' the Directory.")
                 :KEY)
                :INITFORM "CIM_LogicalFile"))
              (:CIM-NAME "CIM_DirectoryContainsFile")
              (:QUALIFIERS :ASSOCIATION (NIL "true") :COMPOSITION
               (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::System::FileElements")
               (:DESCRIPTION
                "Specifies the hierarchical arrangement of LogicalFiles in a Directory.")))