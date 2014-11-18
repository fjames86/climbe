
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_CorrespondingSettingsRecord.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CORRESPONDINGSETTINGSRECORD NIL
              ((DATARECORD NIL :CIM-NAME "DataRecord" :QUALIFIERS
                (:KEY (:DESCRIPTION "The record containing the result data."))
                :INITFORM "CIM_DiagnosticRecord")
               (SETTINGSRECORD NIL :CIM-NAME "SettingsRecord" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The record containing the DiagnosticSetting data that were used when the result was created."))
                :INITFORM "CIM_DiagnosticSettingRecord"))
              (:CIM-NAME "CIM_CorrespondingSettingsRecord")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.9.0")
               (:UML-PACKAGE-PATH "CIM::System::Diagnostics")
               (:DESCRIPTION
                "CorrespondingSettingsRecord is used to tie a log record to its corresponding setting data record.")))