
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ProductServiceComponent.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PRODUCTSERVICECOMPONENT (CIM_COMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MAX "1")
                 (:DESCRIPTION "The Product.") :KEY)
                :INITFORM "CIM_Product")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION "The Service which is a part of the Product.")
                 :KEY)
                :INITFORM "CIM_Service"))
              (:CIM-NAME "CIM_ProductServiceComponent")
              (:QUALIFIERS :ASSOCIATION (NIL "true") :COMPOSITION
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Core::ProductFRU")
               (:DESCRIPTION
                "Indicates that the referenced Service is acquired as part of a Product. Examples of Services that may be acquired are outsourced storage and networking services, or support and warranty services. Expanding on the examples, Services represent generic functionality - so, it is possible to model the existence of storage volume management or warranty services as individual instances of subclasses of CIM_Service. These 'Services' may be enabled/disabled, started/stopped, signal an error, etc. (They behave as standard ManagedSystemElements.) Specific requests against the Services - for example, a request for warranty service or increased storage space - are NOT new instances of Service, but may be requested via the methods of the Service subclass, or be instantiated as specific subclasses of ManagedElement.")))