
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ServiceAccessBySAP.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SERVICEACCESSBYSAP (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:DESCRIPTION "The Service.") :KEY)
                :INITFORM "CIM_Service")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "An Access Point for a Service. Access points are dependent in this relationship because they have no function without a corresponding Service.")
                 :KEY)
                :INITFORM "CIM_ServiceAccessPoint"))
              (:CIM-NAME "CIM_ServiceAccessBySAP")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::Service")
               (:DESCRIPTION
                "CIM_ServiceAccessBySAP is an association that identifies the access points for a Service. For example, a printer might be accessed by NetWare, MacIntosh or Windows ServiceAccessPoints, which might all be hosted on different Systems.")))