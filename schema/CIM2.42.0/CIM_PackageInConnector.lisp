
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PackageInConnector.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PACKAGEINCONNECTOR (CIM_ELEMENTINCONNECTOR)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The Connector into which the Package is inserted.")
                 :KEY)
                :INITFORM "CIM_PhysicalConnector")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MAX "1")
                 (:DESCRIPTION "The Package in the Connector.") :KEY)
                :INITFORM "CIM_PhysicalPackage"))
              (:CIM-NAME "CIM_PackageInConnector")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.18.0")
               (:UML-PACKAGE-PATH "CIM::Physical::Connector")
               (:DESCRIPTION
                "Adapter cards and other 'packaging' are plugged into System Connectors for power and/or to transfer data. This relationship is defined by PackageInConnector. For example, it would be used to describe the insertion of a daughtercard onto another Card. Various subclasses of PackageInConnector are also defined. PackageInSlot and its subclass, CardInSlot, are two examples of subclasses.")))