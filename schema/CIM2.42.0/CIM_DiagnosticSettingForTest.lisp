
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DiagnosticSettingForTest.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DIAGNOSTICSETTINGFORTEST (CIM_ELEMENTSETTING)
              ((ELEMENT NIL :CIM-NAME "Element" :QUALIFIERS
                ((:DEPRECATED ("CIM_ElementSetting.Element"))
                 (:OVERRIDE "Element")
                 (:DESCRIPTION "The Test that can use the Setting object.")
                 :KEY)
                :INITFORM "CIM_DiagnosticTest")
               (SETTING NIL :CIM-NAME "Setting" :QUALIFIERS
                ((:DEPRECATED ("CIM_ElementSetting.Setting"))
                 (:OVERRIDE "Setting")
                 (:DESCRIPTION
                  "The Setting that can be applied to the execution of the DiagnosticTest.")
                 :KEY)
                :INITFORM "CIM_DiagnosticSetting"))
              (:CIM-NAME "CIM_DiagnosticSettingForTest")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("CIM_ElementSetting"))
               (:VERSION "2.9.0")
               (:UML-PACKAGE-PATH "CIM::System::Diagnostics")
               (:DESCRIPTION
                "This class is no longer required and is being deprecated. Use ElementSetting (its parent) instead if the association is needed. 
This is an association class to relate test settings with diagnostic tests.")))