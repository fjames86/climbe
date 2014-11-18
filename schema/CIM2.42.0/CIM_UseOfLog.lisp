
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_UseOfLog.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_USEOFLOG (CIM_DEPENDENCY)
              ((RECORDEDDATA STRING :CIM-NAME "RecordedData" :QUALIFIERS
                ((:DESCRIPTION
                  "A free-form string describing the use of the Log by the ManagedSystemElement."))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:DESCRIPTION "The Log.") :KEY)
                :INITFORM "CIM_Log")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The ManagedSystemElement whose information is recorded in the Log.")
                 :KEY)
                :INITFORM "CIM_ManagedSystemElement"))
              (:CIM-NAME "CIM_UseOfLog")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.9.0")
               (:UML-PACKAGE-PATH "CIM::System::Logs")
               (:DESCRIPTION
                "ManagedSystemElements may record their event, error or informational data within Logs. The use of a Log to hold a ManagedSystemElement's data is described by this association. The type of Element data captured by the Log can be specified using the RecordedData string property.")))