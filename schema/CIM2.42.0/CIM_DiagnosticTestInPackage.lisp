
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DiagnosticTestInPackage.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DIAGNOSTICTESTINPACKAGE (CIM_COMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                ((:DEPRECATED ("No value")) :AGGREGATE
                 (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION
                  "The DiagnosticTest object that acts as the container for all the tests of the package.")
                 :KEY)
                :INITFORM "CIM_DiagnosticTest")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "The DiagnosticTest object that is one of the elements of the package.")
                 :KEY)
                :INITFORM "CIM_DiagnosticTest"))
              (:CIM-NAME "CIM_DiagnosticTestInPackage")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("No value")) (NIL "true")
               (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::System::Diagnostics")
               (:DESCRIPTION
                "This class is being deprecated. Tests should be grouped at the test level, not in the model. Therefore, the association is not appropriate. /n This is an association class that identifies a Diagnostic Test as made up of lower level Tests. In this case, the test identified as the GroupComponent reference (i.e, the higher level test) would have the \"Is Package\" enumerated value specified in DiagnosticTest. Characteristics.")))