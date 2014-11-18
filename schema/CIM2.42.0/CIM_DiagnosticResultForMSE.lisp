
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DiagnosticResultForMSE.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DIAGNOSTICRESULTFORMSE NIL
              ((RESULT NIL :CIM-NAME "Result" :QUALIFIERS
                ((:DEPRECATED ("No value")) :KEY
                 (:DESCRIPTION "The diagnostic result."))
                :INITFORM "CIM_DiagnosticResult")
               (SYSTEMELEMENT NIL :CIM-NAME "SystemElement" :QUALIFIERS
                ((:DEPRECATED ("No value")) :KEY
                 (:DESCRIPTION
                  "The ManagedSystemElement to which the diagnostic result applies."))
                :INITFORM "CIM_ManagedSystemElement"))
              (:CIM-NAME "CIM_DiagnosticResultForMSE")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("No value"))
               (:VERSION "2.9.0")
               (:UML-PACKAGE-PATH "CIM::System::Diagnostics")
               (:DESCRIPTION
                "This class is being deprecated as part of the deprecation of the DiagnosticResult class. 
This is an association class relating diagnostic test results to the ManagedSystemElement that is/was tested.")))