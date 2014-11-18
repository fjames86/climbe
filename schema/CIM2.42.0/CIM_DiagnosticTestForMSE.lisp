
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DiagnosticTestForMSE.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DIAGNOSTICTESTFORMSE (CIM_PROVIDESSERVICETOELEMENT)
              ((ESTIMATEDTIMEOFPERFORMING UINT32 :CIM-NAME
                "EstimatedTimeOfPerforming" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_AvailableDiagnosticService.EstimatedDurationOfService"))
                 (:DESCRIPTION
                  "Estimated number of seconds to perform the referenced DiagnosticTest against the ManagedSystemElement. Since execution times could vary by Element, this property is located in the association between the two entities. It is also captured in DiagnosticResult, in the EstimatedTimeOfPerforming property. 
A CIM Consumer can compare this value with the value in DiagnosticResult to get an idea of what impact their settings have on test execution.")
                 (NIL "Seconds")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DiagnosticResult.EstimatedTimeOfPerforming"))
                 (:P-UNIT "second"))
                :INITFORM NIL)
               (ISEXCLUSIVEFORMSE BOOLEAN :CIM-NAME "IsExclusiveForMSE"
                :QUALIFIERS
                ((:DEPRECATED ("CIM_ServiceAffectsElement.ElementEffects"))
                 (:DESCRIPTION
                  "This property is being deprecated since the same characterisitic can be published in the CIM_ServiceAffectsElement.ElementEffects array as Value = 2, \"Exclusive Use\". 
If the DiagnosticTest referenced in this object can be run concurrently against multiple SystemElements, but only run one at a time for the referenced ManagedSystemElement, then this boolean is set to TRUE. Alternately, if the test can NOT be run concurrently irregardless of the System Elements being tested, then the more general \"Is Exclusive\" enumerated value (2) should be set in DiagnosticTest. Characteristics."))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_AvailableDiagnosticService.ServiceProvided"))
                 (:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The test that may be run against a ManagedSystemElement.")
                 :KEY)
                :INITFORM "CIM_DiagnosticTest")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_AvailableDiagnosticService.UserOfService"))
                 (:OVERRIDE "Dependent")
                 (:DESCRIPTION "The ManagedSystemElement that can be tested.")
                 :KEY)
                :INITFORM "CIM_ManagedSystemElement"))
              (:CIM-NAME "CIM_DiagnosticTestForMSE")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_AvailableDiagnosticService"))
               (:VERSION "2.9.0")
               (:UML-PACKAGE-PATH "CIM::System::Diagnostics")
               (:DESCRIPTION
                "This class is being deprecated to promote its usage to the DiagnosticService level. 
This is an association class that relates a DiagnosticTest to a ManagedSystemElement. Consumers wishing to 'diagnose' a particular Element could query this association, for the Element, to determine what tests are available.")))