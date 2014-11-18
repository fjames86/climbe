
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ProvidesEndpoint.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PROVIDESENDPOINT (CIM_SERVICEACCESSBYSAP)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The Service that is accessed by the ProtocolEndpoint.")
                 :KEY)
                :INITFORM "CIM_Service")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The ProtocolEndpoint that provides access to the Service.")
                 :KEY)
                :INITFORM "CIM_ProtocolEndpoint"))
              (:CIM-NAME "CIM_ProvidesEndpoint")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::Service")
               (:DESCRIPTION
                "This association represents a ProtocolEndpoint that is provided by a Service to allow access to the Service.")))