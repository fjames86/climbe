
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_OperationLog.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_OPERATIONLOG (CIM_USEOFMESSAGELOG)
              ((RECORDEDDATA STRING :CIM-NAME "RecordedData" :QUALIFIERS
                ((:DESCRIPTION
                  "A free-form string describing the use of the Log by the ManagedSystemElement."))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The Log containing reproducible operations for the associated LogicalElement.")
                 :KEY)
                :INITFORM "CIM_MessageLog")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The LogicalElement for the associated OperationLog.")
                 :KEY)
                :INITFORM "CIM_LogicalElement"))
              (:CIM-NAME "CIM_OperationLog")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::System::Logs")
               (:DESCRIPTION
                "CIM_OperationLog is a specialization of the CIM_UseOfMessageLog association that identifies a reproducible record of operations for a LogicalElement.")))