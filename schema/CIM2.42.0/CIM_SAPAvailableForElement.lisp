
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SAPAvailableForElement.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SAPAVAILABLEFORELEMENT NIL
              ((AVAILABLESAP NIL :CIM-NAME "AvailableSAP" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION "The Service Access Point that is available."))
                :INITFORM "CIM_ServiceAccessPoint")
               (MANAGEDELEMENT NIL :CIM-NAME "ManagedElement" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The ManagedElement for which the SAP is available."))
                :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_SAPAvailableForElement")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::Service")
               (:DESCRIPTION
                "CIM_SAPAvailableForElement conveys the semantics of a Service Access Point that is available for a ManagedElement. When CIM_SAPAvailableForElement is not instantiated, then the SAP is assumed to be generally available. If instantiated, the SAP is available only for the associated ManagedElements. For example, a device might provide management access through a URL. This association allows the URL to be advertised for the device.")))