
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_UseOfMessageLog.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_USEOFMESSAGELOG (CIM_USEOFLOG)
              ((RECORDEDDATA STRING :CIM-NAME "RecordedData" :QUALIFIERS
                ((:DESCRIPTION
                  "A free-form string describing the use of the Log by the ManagedSystemElement."))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:DESCRIPTION "The MessageLog.")
                 :KEY)
                :INITFORM "CIM_MessageLog")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The ManagedSystemElement whose information is recorded in the Log.")
                 :KEY)
                :INITFORM "CIM_ManagedSystemElement"))
              (:CIM-NAME "CIM_UseOfMessageLog")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.9.0")
               (:UML-PACKAGE-PATH "CIM::System::Logs")
               (:DESCRIPTION
                "ManagedSystemElements may record their event, error or informational data within MessageLogs. The use of a Log to hold a ManagedSystemElement's data is described by this association. 
UseOfMessageLog has the same semantics as UseOfLog. Users SHOULD reference UseOfLog in lieu of this association.")))