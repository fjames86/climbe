
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_LogicalIdentity.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_LOGICALIDENTITY NIL
              ((SYSTEMELEMENT NIL :CIM-NAME "SystemElement" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "SystemElement represents one aspect of the Managed Element. The use of 'System' in the role name does not limit the scope of the association. The role name was defined in the original association, where the referenced elements were limited to LogicalElements. Since that time, it has been found valuable to instantiate these types of relationships for ManagedElements, such as Collections. So, the referenced elements of the association were redefined to be ManagedElements. Unfortunately, the role name could not be changed without deprecating the entire association. This was not deemed necessary just to correct the role name."))
                :INITFORM "CIM_ManagedElement")
               (SAMEELEMENT NIL :CIM-NAME "SameElement" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "SameElement represents an alternate aspect of the ManagedElement."))
                :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_LogicalIdentity")
              (:QUALIFIERS :ASSOCIATION :ABSTRACT (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::CoreElements")
               (:DESCRIPTION
                "CIM_LogicalIdentity is an abstract and generic association, indicating that two ManagedElements represent different aspects of the same underlying entity. This relationship conveys what could be defined with multiple inheritance. In most scenarios, the Identity relationship is determined by the equivalence of Keys or some other identifying properties of the related Elements. 

This relationship is reasonable in several scenarios. For example, it could be used to represent that a LogicalDevice is both a 'bus' entity and a 'functional' entity. A Device could be both a USB (bus) and a Keyboard (functional) entity.")))