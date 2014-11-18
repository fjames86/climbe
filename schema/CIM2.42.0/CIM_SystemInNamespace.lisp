
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SystemInNamespace.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SYSTEMINNAMESPACE NIL
              ((SCOPEOFCONTAINEDDATA (ARRAY UINT16) :CIM-NAME
                "ScopeOfContainedData" :QUALIFIERS
                (:REQUIRED :WRITE
                 (:DESCRIPTION
                  "A list of enumerated values providing a high level description of the data contained and allowed in the Namespace. Additional clarification is provided in the DescriptionOfContainedData array.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4"))
                 (:VALUES
                  ("Unknown" "Other" "Local System Data"
                   "Data Aggregated from Multiple Systems" "Proxied Data"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SystemInNamespace.DescriptionOfContainedData")))
                :INITFORM NIL)
               (DESCRIPTIONOFCONTAINEDDATA (ARRAY STRING) :CIM-NAME
                "DescriptionOfContainedData" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "An array of free-form strings providing more detailed explanations for the data/objects contained in the Namespace, as described by the ContainedData array. Note, each entry of this array is related to the entry in the ContainedData array that is located at the same index.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SystemInNamespace.ScopeOfContainedData")))
                :INITFORM NIL)
               (MANAGEDNAMESPACE NIL :CIM-NAME "ManagedNamespace" :QUALIFIERS
                (:KEY (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The Namespace containing management objects from one or more systems."))
                :INITFORM "CIM_Namespace")
               (IDENTIFICATION NIL :CIM-NAME "Identification" :QUALIFIERS
                (:KEY :WEAK
                 (:DESCRIPTION
                  "Identification information for systems in the Namespace."))
                :INITFORM "CIM_SystemIdentification"))
              (:CIM-NAME "CIM_SystemInNamespace")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Interop")
               (:DESCRIPTION
                "SystemInNamespace is an association that allows enumeration of the system(s) represented in a Namespace.")))