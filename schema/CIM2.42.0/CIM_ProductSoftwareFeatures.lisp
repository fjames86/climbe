
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ProductSoftwareFeatures.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PRODUCTSOFTWAREFEATURES NIL
              ((PRODUCT NIL :CIM-NAME "Product" :QUALIFIERS
                (:KEY :AGGREGATE (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The Product that scopes the SoftwareFeatures."))
                :INITFORM "CIM_Product")
               (COMPONENT NIL :CIM-NAME "Component" :QUALIFIERS
                (:KEY :WEAK (:DESCRIPTION "The SoftwareFeature in a Product."))
                :INITFORM "CIM_SoftwareFeature"))
              (:CIM-NAME "CIM_ProductSoftwareFeatures")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Application::DeploymentModel")
               (:DESCRIPTION
                "The ProductSoftwareFeatures association identifies the SoftwareFeatures for a particular Product.")))