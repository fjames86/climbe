
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_CollectionSetting.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_COLLECTIONSETTING NIL
              ((COLLECTION NIL :CIM-NAME "Collection" :QUALIFIERS
                (:KEY (:DESCRIPTION "The CollectionOfMSEs.")) :INITFORM
                "CIM_CollectionOfMSEs")
               (SETTING NIL :CIM-NAME "Setting" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The Setting object that is associated with the Collection."))
                :INITFORM "CIM_Setting"))
              (:CIM-NAME "CIM_CollectionSetting")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::Settings")
               (:DESCRIPTION
                "CollectionSetting represents the association between a CollectionOfMSEs class and the Setting classes that are defined for it.")))