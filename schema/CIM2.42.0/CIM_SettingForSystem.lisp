
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SettingForSystem.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SETTINGFORSYSTEM (CIM_HOSTEDDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The hosting System.") :KEY)
                :INITFORM "CIM_System")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") :WEAK
                 (:DESCRIPTION "The Setting defined for the System.") :KEY)
                :INITFORM "CIM_SystemSetting"))
              (:CIM-NAME "CIM_SettingForSystem")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::Settings")
               (:DESCRIPTION
                "CIM_SettingForSystem defines a Setting in the context of the System on which it is located.")))