
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_FileIdentity.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_FILEIDENTITY (CIM_LOGICALIDENTITY)
              ((SYSTEMELEMENT NIL :CIM-NAME "SystemElement" :QUALIFIERS
                ((:OVERRIDE "SystemElement") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The Logical File.") :KEY)
                :INITFORM "CIM_LogicalFile")
               (SAMEELEMENT NIL :CIM-NAME "SameElement" :QUALIFIERS
                ((:OVERRIDE "SameElement") :WEAK (:MAX "1")
                 (:DESCRIPTION
                  "SameElement represents the additional aspects of the Unix/Linux Logical file.")
                 :KEY)
                :INITFORM "CIM_UnixFile"))
              (:CIM-NAME "CIM_FileIdentity")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::System::Unix")
               (:DESCRIPTION
                "CIM_FileIdentity indicates that a UnixFile describes Unix- specific aspects of the various subclasses of LogicalFile. The association exists since it forces UnixFile to be weak to (scoped by) the LogicalFile. This is not true in the association's superclass, LogicalIdentity.")))