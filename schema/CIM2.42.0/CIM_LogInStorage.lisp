
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_LogInStorage.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_LOGINSTORAGE (CIM_DEPENDENCY)
              ((STARTINGOFFSET UINT64 :CIM-NAME "StartingOffset" :QUALIFIERS
                ((:DESCRIPTION
                  "StartingOffset indicates where in the Extent that the Log begins."))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:DESCRIPTION "The StorageExtent.")
                 :KEY)
                :INITFORM "CIM_StorageExtent")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The MessageLog located within the Extent.")
                 :KEY)
                :INITFORM "CIM_MessageLog"))
              (:CIM-NAME "CIM_LogInStorage")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::System::Logs")
               (:DESCRIPTION
                "MessageLogs can reside in data files, on specially allocated storage areas such as disks or memory, or output as raw I/O streams. In fact, a single Log may use each of these mechanisms to output or capture its contents. The LogInStorage association describes a Log located in a specially allocated portion of a StorageExtent. The offset of the Log, within the Extent, is defined using a property of the association, StartingOffset.")))