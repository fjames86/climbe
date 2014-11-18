
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_CorrespondingSettingDataRecord.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CORRESPONDINGSETTINGDATARECORD NIL
              ((DATARECORD NIL :CIM-NAME "DataRecord" :QUALIFIERS
                (:KEY (:DESCRIPTION "The record containing the result data."))
                :INITFORM "CIM_DiagnosticRecord")
               (SETTINGSRECORD NIL :CIM-NAME "SettingsRecord" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The record containing the DiagnosticSettingData that were used when the result was created."))
                :INITFORM "CIM_DiagnosticSettingDataRecord"))
              (:CIM-NAME "CIM_CorrespondingSettingDataRecord")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.22.0")
               (:UML-PACKAGE-PATH "CIM::System::Diagnostics")
               (:DESCRIPTION
                "CorrespondingSettingDataRecord is used to tie a log record to its corresponding setting data record.")))