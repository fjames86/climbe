
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_LibraryExchange.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_LIBRARYEXCHANGE (CIM_DEPENDENCY)
              ((CURRENTLYACCESSINGPORT UINT16 :CIM-NAME
                "CurrentlyAccessingPort" :QUALIFIERS
                ((:DESCRIPTION
                  "Enumeration indicating whether the Antecedent (value=1), Dependent (value=2), or neither Library (value=3) currently has access to the Port.")
                 (:VALUE-MAP ("0" "1" "2" "3"))
                 (:VALUES ("Unknown" "Antecedent" "Dependent" "Neither")))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The InterLibraryPort of one StorageLibrary.")
                 :KEY)
                :INITFORM "CIM_InterLibraryPort")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The InterLibraryPort of the connected Library.")
                 :KEY)
                :INITFORM "CIM_InterLibraryPort"))
              (:CIM-NAME "CIM_LibraryExchange")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Device::StorageLib")
               (:DESCRIPTION
                "LibraryExchange indicates that two StorageLibraries are connected through their InterLibraryPorts.")))