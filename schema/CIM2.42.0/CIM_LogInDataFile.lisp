
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_LogInDataFile.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_LOGINDATAFILE (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:DESCRIPTION "The DataFile.") :KEY)
                :INITFORM "CIM_DataFile")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The MessageLog residing in the DataFile.")
                 :KEY)
                :INITFORM "CIM_MessageLog"))
              (:CIM-NAME "CIM_LogInDataFile")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::System::Logs")
               (:DESCRIPTION
                "MessageLogs can reside in data files, on specially allocated storage areas such as disks or memory, or output as raw I/O streams. In fact, a single Log may use each of these mechanisms to output or capture its contents. The LogInDataFile association describes a Log stored as a DataFile.")))