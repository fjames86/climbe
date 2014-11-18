
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ServiceSAPDependency.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SERVICESAPDEPENDENCY (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The required ServiceAccessPoint.") :KEY)
                :INITFORM "CIM_ServiceAccessPoint")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The Service that is dependent on an underlying SAP.")
                 :KEY)
                :INITFORM "CIM_Service"))
              (:CIM-NAME "CIM_ServiceSAPDependency")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::Service")
               (:DESCRIPTION
                "CIM_ServiceSAPDependency is an association between a Service and a ServiceAccessPoint that indicates that the referenced SAP is utilized by the Service to provide its functionality. For example, Boot Services can invoke BIOS Disk Services (interrupts) in order to function.")))