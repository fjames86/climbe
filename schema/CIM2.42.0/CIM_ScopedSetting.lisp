
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ScopedSetting.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SCOPEDSETTING (CIM_HOSTEDDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The scoping ManagedElement.") :KEY)
                :INITFORM "CIM_ManagedElement")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The setting that is defined for the ManagedElement.")
                 :KEY)
                :INITFORM "CIM_ScopedSettingData"))
              (:CIM-NAME "CIM_ScopedSetting")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::Settings")
               (:DESCRIPTION
                "ScopedSetting defines a setting in the context of the ManagedElement in which it is located.")))