
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ElementCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ELEMENTCAPABILITIES NIL
              ((CHARACTERISTICS (ARRAY UINT16) :CIM-NAME "Characteristics"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Characteristics provides descriptive information about the Capabilities. when the value 2 \"Default\" is specified, the associated Capabilities shall represent the default capabilities of the associated Managed Element 
when the value 2 \"Default\" is not specified, the Capabilities instance may represent the default capabilities of the Managed Element
When the value 3 \"Current\" is specified, the associated Capabilities shall represent the current capabilities of the associated Managed Element
When the value 3 \"Current\" is not specified, the Capabilities instance may represent the current capabilities of the Managed Element.")
                 (:VALUE-MAP ("2" "3" ".." "32768..65535"))
                 (:VALUES
                  ("Default" "Current" "DMTF Reserved" "Vendor Specific")))
                :INITFORM NIL)
               (MANAGEDELEMENT NIL :CIM-NAME "ManagedElement" :QUALIFIERS
                (:KEY (:MIN "1") (:DESCRIPTION "The managed element."))
                :INITFORM "CIM_ManagedElement")
               (CAPABILITIES NIL :CIM-NAME "Capabilities" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The Capabilities object associated with the element."))
                :INITFORM "CIM_Capabilities"))
              (:CIM-NAME "CIM_ElementCapabilities")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.24.0")
               (:UML-PACKAGE-PATH "CIM::Core::Capabilities")
               (:DESCRIPTION
                "ElementCapabilities represents the association between ManagedElements and their Capabilities. Note that the cardinality of the ManagedElement reference is Min(1). This cardinality mandates the instantiation of the ElementCapabilities association for the referenced instance of Capabilities. ElementCapabilities describes the existence requirements and context for the referenced instance of ManagedElement. Specifically, the ManagedElement MUST exist and provides the context for the Capabilities.")))