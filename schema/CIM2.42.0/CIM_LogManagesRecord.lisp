
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_LogManagesRecord.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_LOGMANAGESRECORD NIL
              ((LOG NIL :CIM-NAME "Log" :QUALIFIERS
                    (:KEY :AGGREGATE (:MIN "1") (:MAX "1")
                     (:DESCRIPTION "The Log."))
                    :INITFORM "CIM_Log")
               (RECORD NIL :CIM-NAME "Record" :QUALIFIERS
                (:KEY (:DESCRIPTION "The record managed by the Log."))
                :INITFORM "CIM_RecordForLog"))
              (:CIM-NAME "CIM_LogManagesRecord")
              (:QUALIFIERS :ASSOCIATION (NIL "true") :COMPOSITION
               (:VERSION "2.9.0") (:UML-PACKAGE-PATH "CIM::System::Logs")
               (:DESCRIPTION
                "LogManagesRecord describes the aggregation or location of Records managed by a Log.")))