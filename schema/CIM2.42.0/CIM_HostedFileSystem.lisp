
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_HostedFileSystem.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_HOSTEDFILESYSTEM (CIM_SYSTEMCOMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The System that hosts the FileSystem.") :KEY)
                :INITFORM "CIM_System")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent") :WEAK
                 (:DESCRIPTION
                  "The FileSystem that is part of the System and hosted on it.")
                 :KEY)
                :INITFORM "CIM_FileSystem"))
              (:CIM-NAME "CIM_HostedFileSystem")
              (:QUALIFIERS :ASSOCIATION (NIL "true") :COMPOSITION
               (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::System::FileElements")
               (:DESCRIPTION
                "A link between the System (such as a Computer or Application System) and the FileSystem that is a part of it.")))