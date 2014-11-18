
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_RecordInLog.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_RECORDINLOG NIL
              ((MESSAGELOG NIL :CIM-NAME "MessageLog" :QUALIFIERS
                (:KEY :AGGREGATE (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The Message Log."))
                :INITFORM "CIM_MessageLog")
               (LOGRECORD NIL :CIM-NAME "LogRecord" :QUALIFIERS
                (:KEY :WEAK
                 (:DESCRIPTION
                  "The Log entry contained within the MessageLog."))
                :INITFORM "CIM_LogRecord"))
              (:CIM-NAME "CIM_RecordInLog")
              (:QUALIFIERS :ASSOCIATION (NIL "true") :COMPOSITION
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::System::Logs")
               (:DESCRIPTION
                "RecordInLog describes the aggregation or location of Log entries within a MessageLog.")))