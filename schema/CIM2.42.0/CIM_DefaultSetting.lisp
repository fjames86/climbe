
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DefaultSetting.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DEFAULTSETTING (CIM_ELEMENTSETTING)
              ((SETTING NIL :CIM-NAME "Setting" :QUALIFIERS
                ((:OVERRIDE "Setting") (:MAX "1")
                 (:DESCRIPTION "The Setting object that is the default.") :KEY)
                :INITFORM "CIM_Setting")
               (ELEMENT NIL :CIM-NAME "Element" :QUALIFIERS
                (:KEY (:DESCRIPTION "The ManagedSystemElement.")) :INITFORM
                "CIM_ManagedSystemElement"))
              (:CIM-NAME "CIM_DefaultSetting")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::Settings")
               (:DESCRIPTION
                "DefaultSetting represents the association between a ManagedSystemElement and the single Setting class that is defined to be the default setting for this Element.")))