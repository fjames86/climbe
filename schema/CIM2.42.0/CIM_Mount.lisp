
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_Mount.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_MOUNT (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION "The Directory mounted.") :KEY)
                :INITFORM "CIM_Directory")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The FileSystem the Directory is mounted on.")
                 :KEY)
                :INITFORM "CIM_FileSystem"))
              (:CIM-NAME "CIM_Mount")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::System::FileElements")
               (:DESCRIPTION
                "An association between a FileSystem and a Directory which indicates that the Directory is being attached to the FileSystem. The semantics of this relationship require that the mounted Directory be contained by a FileSystem (via the FileStorage association) that is different from the FileSystem referenced as the Dependent. The Directory's containing FileSystem could be either local or remote. For example, a LocalFileSystem on a Solaris ComputerSystem can mount a Directory from the FileSystem accessed via the machine's CDROM drive, i.e., another LocalFile System. On the other hand, in a 'remote' case, the Directory is first exported by its FileSystem, which is hosted on another ComputerSystem acting (for example) as a file server. In order to distinguish these two types of Mount, it is recommended that a CIM_Export association always be defined for the remotely accessed/mounted Directories.")))