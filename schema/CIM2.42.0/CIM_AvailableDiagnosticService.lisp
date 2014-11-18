
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AvailableDiagnosticService.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_AVAILABLEDIAGNOSTICSERVICE (CIM_SERVICEAVAILABLETOELEMENT)
              ((ESTIMATEDDURATIONOFSERVICE UINT16 :CIM-NAME
                "EstimatedDurationOfService" :QUALIFIERS
                ((:DESCRIPTION
                  "Estimated magnitude of time to perform the referenced DiagnosticService on the referenced ManagedElement. 
Since the processing speed of a system can vary immensely due to a variety of factors (e.g., processor speed), this property takes on values that are a statement of magnitude, not absolute time. If greater accuracy can be provided, a quantification may be specified in the corresponding integer property, EstimatedDurationQualifier. 
Since execution times could vary by Element, this property is located in the association between the two entities.")
                 (:VALUE-MAP ("0" "2" "3" "4" "5" "6"))
                 (:VALUES
                  ("Unknown" "Milliseconds" "Seconds" "Minutes" "Hours"
                   "Days"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_AvailableDiagnosticService.EstimatedDurationQualifier")))
                :INITFORM NIL)
               (ESTIMATEDDURATIONQUALIFIER UINT32 :CIM-NAME
                "EstimatedDurationQualifier" :QUALIFIERS
                ((:DESCRIPTION
                  "EstimatedDurationQualifier can be used to further quantify the magnitude of time to perform the service.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_AvailableDiagnosticService.EstimatedDurationOfService")))
                :INITFORM NIL)
               (SERVICEPROVIDED NIL :CIM-NAME "ServiceProvided" :QUALIFIERS
                ((:OVERRIDE "ServiceProvided")
                 (:DESCRIPTION
                  "The diagnostic service that is available to a ManagedElement.")
                 :KEY)
                :INITFORM "CIM_DiagnosticService")
               (USEROFSERVICE NIL :CIM-NAME "UserOfService" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION "The ManagedElement that can use the Service."))
                :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_AvailableDiagnosticService")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.9.0")
               (:UML-PACKAGE-PATH "CIM::System::Diagnostics")
               (:DESCRIPTION
                "This is an association class that relates a DiagnosticService to a ManagedElement. Consumers wishing to 'diagnose' a particular Element could query this association to determine what services are available.")))