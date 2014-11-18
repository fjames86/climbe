
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ElementConformsToProfile.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ELEMENTCONFORMSTOPROFILE NIL
              ((CONFORMANTSTANDARD NIL :CIM-NAME "ConformantStandard"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The RegisteredProfile to which the ManagedElement conforms."))
                :INITFORM "CIM_RegisteredProfile")
               (MANAGEDELEMENT NIL :CIM-NAME "ManagedElement" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The ManagedElement that conforms to the RegisteredProfile."))
                :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_ElementConformsToProfile")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Interop")
               (:DESCRIPTION
                "The CIM_ElementConformsToProfile association defines the RegisteredProfiles to which the referenced ManagedElement is conformant. Note: This association may apply to any Managed Element. Typical usage will apply it to a higher level instance, such as a System, NameSpace, or Service. When applied to a higher level instance, all constituent parts MUST behave appropriately in support of the ManagedElement's conformance to the named RegisteredProfile.")))