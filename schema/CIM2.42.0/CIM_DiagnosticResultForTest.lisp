
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DiagnosticResultForTest.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DIAGNOSTICRESULTFORTEST NIL
              ((DIAGNOSTICRESULT NIL :CIM-NAME "DiagnosticResult" :QUALIFIERS
                ((:DEPRECATED ("No value")) :KEY :WEAK (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The result object."))
                :INITFORM "CIM_DiagnosticResult")
               (DIAGNOSTICTEST NIL :CIM-NAME "DiagnosticTest" :QUALIFIERS
                ((:DEPRECATED ("No value")) :KEY (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The test that generated the result object."))
                :INITFORM "CIM_DiagnosticTest"))
              (:CIM-NAME "CIM_DiagnosticResultForTest")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("No value"))
               (:VERSION "2.9.0")
               (:UML-PACKAGE-PATH "CIM::System::Diagnostics")
               (:DESCRIPTION
                "This class is being deprecated as part of the deprecation of the DiagnosticResult class. 
This is an association class to relate the results of a test to the test itself.")))