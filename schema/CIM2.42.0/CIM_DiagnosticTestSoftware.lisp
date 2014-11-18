
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DiagnosticTestSoftware.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DIAGNOSTICTESTSOFTWARE (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("CIM_ElementSoftwareIdentity.Antecedent"))
                 (:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "This reference is deprecated and replaced (in ServiceSoftwareIdentity) with a reference to the SoftwareIdentity class, which has been determined to be a better choice for diagnostics services. It defines vendor/version and other information about the software that runs as the DiagnosticTest.")
                 :KEY)
                :INITFORM "CIM_SoftwareElement")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_ElementSoftwareIdentity.Dependent"))
                 (:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The DiagnosticTest whose software is described.")
                 :KEY)
                :INITFORM "CIM_DiagnosticTest"))
              (:CIM-NAME "CIM_DiagnosticTestSoftware")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_ElementSoftwareIdentity")) (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Application::SystemSoftware")
               (:DESCRIPTION
                "This class is being deprecated to promote its usage to the DiagnosticService level. 
This is an association class relating DiagnosticTest to the SoftwareElements that provide this test. SoftwareElement describes vendor/version information and other deployment data.")))