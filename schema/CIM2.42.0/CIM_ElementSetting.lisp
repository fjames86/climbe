
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ElementSetting.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ELEMENTSETTING NIL
              ((ELEMENT NIL :CIM-NAME "Element" :QUALIFIERS
                (:KEY (:DESCRIPTION "The ManagedSystemElement.")) :INITFORM
                "CIM_ManagedSystemElement")
               (SETTING NIL :CIM-NAME "Setting" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The Setting object that is associated with the ManagedSystemElement."))
                :INITFORM "CIM_Setting"))
              (:CIM-NAME "CIM_ElementSetting")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::Settings")
               (:DESCRIPTION
                "ElementSetting represents the association between ManagedSystemElements and the Setting classes defined for them.")))