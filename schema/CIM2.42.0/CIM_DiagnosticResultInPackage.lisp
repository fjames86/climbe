
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DiagnosticResultInPackage.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DIAGNOSTICRESULTINPACKAGE NIL
              ((PACKAGERESULT NIL :CIM-NAME "PackageResult" :QUALIFIERS
                ((:DEPRECATED ("No value")) :KEY :AGGREGATE
                 (:DESCRIPTION
                  "The DiagnosticResult object that acts as the container for all the results of the package."))
                :INITFORM "CIM_DiagnosticResult")
               (RESULT NIL :CIM-NAME "Result" :QUALIFIERS
                ((:DEPRECATED ("No value")) :KEY
                 (:DESCRIPTION
                  "The DiagnosticResult object that is one of the elements of the package."))
                :INITFORM "CIM_DiagnosticResult"))
              (:CIM-NAME "CIM_DiagnosticResultInPackage")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("No value")) (NIL "true")
               (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::System::Diagnostics")
               (:DESCRIPTION
                "This class is being deprecated. Tests should be grouped at the test level, not by the model. Therefore, this association is no longer appropriate. /n This is an association class that identifies a Diagnostic Result as made up of lower level Results. In this case, the Result identified as the PackageResult reference (i.e., the higher level result) would have its IsPackage property set to TRUE.")))