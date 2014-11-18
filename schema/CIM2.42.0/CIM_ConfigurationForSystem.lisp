
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ConfigurationForSystem.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CONFIGURATIONFORSYSTEM (CIM_HOSTEDDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_ScopedSetting.Antecedent"
                   "CIM_SettingForSystem.Antecedent"))
                 (:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "Note: The use of this element is deprecated. Deprecated description: The hosting System.")
                 :KEY)
                :INITFORM "CIM_System")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_ScopedSetting.Dependent"
                   "CIM_SettingForSystem.Dependent"))
                 (:OVERRIDE "Dependent") :WEAK
                 (:DESCRIPTION
                  "Note: The use of this element is deprecated. The Configuration that is defined for the System.")
                 :KEY)
                :INITFORM "CIM_SystemConfiguration"))
              (:CIM-NAME "CIM_ConfigurationForSystem")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_ScopedSetting" "CIM_SettingForSystem"))
               (:VERSION "2.10.0") (:UML-PACKAGE-PATH "CIM::Core::Settings")
               (:DESCRIPTION
                "Note: The use of this element is deprecated. Deprecated description: CIM_ConfigurationForSystem defines a Configuration in the context of the System on which it is located. Because the Configuration class is deprecated, this association is similarly deprecated.")))