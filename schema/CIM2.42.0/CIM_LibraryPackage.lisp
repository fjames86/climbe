
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_LibraryPackage.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_LIBRARYPACKAGE (CIM_SYSTEMPACKAGING)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The PhysicalPackage(s) that realize a StorageLibrary.")
                 :KEY)
                :INITFORM "CIM_PhysicalPackage")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:DESCRIPTION "The StorageLibrary.")
                 :KEY)
                :INITFORM "CIM_StorageLibrary"))
              (:CIM-NAME "CIM_LibraryPackage")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Device::StorageLib")
               (:DESCRIPTION
                "Similar to the way that LogicalDevices are 'Realized' by PhysicalElements, a StorageLibrary can be realized in one or more PhysicalPackages. The LibraryPackage association explicitly defines this relationship.")))