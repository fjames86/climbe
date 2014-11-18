
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_RecordAppliesToElement.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_RECORDAPPLIESTOELEMENT (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:DESCRIPTION "The Record.") :KEY)
                :INITFORM "CIM_RecordForLog")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The ManagedSystemElement that participated in the creation of the Record.")
                 :KEY)
                :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_RecordAppliesToElement")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.9.0")
               (:UML-PACKAGE-PATH "CIM::System::Logs")
               (:DESCRIPTION
                "ManagedSystemElements may create RecordForLog objects to record their event, error or informational data within Logs. The relationship between these managed elements and the records they create is described by this association.")))