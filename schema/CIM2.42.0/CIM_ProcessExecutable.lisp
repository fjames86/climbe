
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ProcessExecutable.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PROCESSEXECUTABLE (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The DataFile participating in the execution of the Process.")
                 :KEY)
                :INITFORM "CIM_DataFile")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:DESCRIPTION "The Process.") :KEY)
                :INITFORM "CIM_Process"))
              (:CIM-NAME "CIM_ProcessExecutable")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::System::Processing")
               (:DESCRIPTION
                "A link between a Process and a DataFile indicating that the File participates in the execution of the Process.")))