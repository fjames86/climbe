
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_BindsTo.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_BINDSTO (CIM_SAPSAPDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The lower-level endpoint that is accessed by the SAP.")
                 :KEY)
                :INITFORM "CIM_ProtocolEndpoint")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The AccessPoint or ProtocolEndpoint that is dependent on the lower-level endpoint.")
                 :KEY)
                :INITFORM "CIM_ServiceAccessPoint"))
              (:CIM-NAME "CIM_BindsTo")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::Service")
               (:DESCRIPTION
                "This association establishes a ServiceAccessPoint as a requestor of protocol services from a ProtocolEndpoint. Typically, this association runs between SAPs and endpoints on a single system. Because a ProtocolEndpoint is a kind of ServiceAccessPoint, this binding can be used to establish a layering of two protocols, with the upper layer represented by the Dependent and the lower layer represented by the Antecedent.")))