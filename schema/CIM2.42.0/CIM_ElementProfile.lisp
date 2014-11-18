
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ElementProfile.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ELEMENTPROFILE NIL
              ((MANAGEDELEMENT NIL :CIM-NAME "ManagedElement" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_ElementSettingData.ManagedElement"
                   "CIM_ElementSetting.Element"))
                 :KEY
                 (:DESCRIPTION
                  "Note: The use of this element is deprecated. Deprecated description: The managed element."))
                :INITFORM "CIM_ManagedElement")
               (PROFILE NIL :CIM-NAME "Profile" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_ElementSettingData.SettingData"
                   "CIM_ElementSetting.Setting"))
                 :KEY
                 (:DESCRIPTION
                  "Note: The use of this object is deprecated. Deprecated description: The Profile object that is associated with the element."))
                :INITFORM "CIM_Profile"))
              (:CIM-NAME "CIM_ElementProfile")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_ElementSettingData" "CIM_ElementSetting"))
               (:VERSION "2.10.0") (:UML-PACKAGE-PATH "CIM::Core::Settings")
               (:DESCRIPTION
                "Note: The Profile class is being deprecated in lieu of using a ConcreteComponent relationship to indicate a hierarchy of Setting or SettingData instances. This relationship allows the reuse of the element to Setting or SettingData associations instead of defining a peer association specifically for Profiles. 
Deprecated description: ElementProfile represents the association between ManagedElements and the Profiles (collection of settings) that are defined for them. This association indicates that the settings that are collected by the Profile apply to the associated ManagedElement.")))