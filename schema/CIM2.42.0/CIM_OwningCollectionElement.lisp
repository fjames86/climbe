
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_OwningCollectionElement.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_OWNINGCOLLECTIONELEMENT NIL
              ((OWNINGELEMENT NIL :CIM-NAME "OwningElement" :QUALIFIERS
                (:KEY (:MAX "1")
                 (:DESCRIPTION
                  "The ManagedElement acting as the 'owner' or object that isresponsible for the control of the Collection."))
                :INITFORM "CIM_ManagedElement")
               (OWNEDELEMENT NIL :CIM-NAME "OwnedElement" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The Collection owned or controlled by the ManagedElement."))
                :INITFORM "CIM_Collection"))
              (:CIM-NAME "CIM_OwningCollectionElement")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.18.0")
               (:UML-PACKAGE-PATH "CIM::Core::Collection")
               (:DESCRIPTION
                "OwningCollectionElement represents an association between a Collection and the ManagedElement responsible for the control or ownership of the Collection.")))