
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_CollectionConfiguration.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_COLLECTIONCONFIGURATION NIL
              ((COLLECTION NIL :CIM-NAME "Collection" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_ElementSettingData.ManagedElement"
                   "CIM_CollectionSetting.Collection"))
                 :KEY
                 (:DESCRIPTION
                  "Note: The use of this element is deprecated. Deprecated description: The CollectionOfMSEs."))
                :INITFORM "CIM_CollectionOfMSEs")
               (CONFIGURATION NIL :CIM-NAME "Configuration" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_ElementSettingData.SettingData"
                   "CIM_CollectionSetting.Setting"))
                 :KEY
                 (:DESCRIPTION
                  "Note: The use of this element is deprecated. Deprecated description: The Configuration object that groups the Settings and dependencies that are associated with the Collection."))
                :INITFORM "CIM_Configuration"))
              (:CIM-NAME "CIM_CollectionConfiguration")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_ElementSettingData" "CIM_CollectionSetting"))
               (:VERSION "2.10.0") (:UML-PACKAGE-PATH "CIM::Core::Settings")
               (:DESCRIPTION
                "Note: The Configuration class is being deprecated in lieu of using a ConcreteComponent relationship to indicate a hierarchy of instances of Setting or SettingData. This relationship allows the reuse of the collection-to-Setting and element-to-SettingData associations instead of defining peer associations specifically for Configurations. 
Deprecated description: This association relates a Configuration object to one or more CollectionOfMSEs objects. The Configuration object represents a certain behavior or a desired functional state for the associated Collection.")))