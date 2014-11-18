
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SAPSAPDependency.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SAPSAPDEPENDENCY (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The required ServiceAccessPoint.") :KEY)
                :INITFORM "CIM_ServiceAccessPoint")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The ServiceAccessPoint that is dependent on an underlying SAP.")
                 :KEY)
                :INITFORM "CIM_ServiceAccessPoint"))
              (:CIM-NAME "CIM_SAPSAPDependency")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::Service")
               (:DESCRIPTION
                "CIM_SAPSAPDependency is an association between one ServiceAccessPoint and another ServiceAccessPoint that indicates that the latter is required for the former to utilize or connect with its Service. For example, to print to a network printer, local Print Access Points must utilize underlying network-related SAPs, or ProtocolEndpoints, to send the print request.")))