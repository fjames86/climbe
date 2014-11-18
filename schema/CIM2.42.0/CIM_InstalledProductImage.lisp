
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_InstalledProductImage.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_INSTALLEDPRODUCTIMAGE NIL
              ((PRODUCT NIL :CIM-NAME "Product" :QUALIFIERS
                (:KEY :AGGREGATE (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The product that has been installed."))
                :INITFORM "CIM_Product")
               (COLLECTION NIL :CIM-NAME "Collection" :QUALIFIERS
                (:KEY :WEAK
                 (:DESCRIPTION
                  "The collection containing the set of SoftwareFeatures and SoftwareElements that are the result of installing the Product."))
                :INITFORM "CIM_InstalledProduct"))
              (:CIM-NAME "CIM_InstalledProductImage")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Application::InstalledProduct")
               (:DESCRIPTION
                "InstalledProductImage identifies the collection of Software Features and SoftwareElements that are the result of the installation of the referenced Product.")))