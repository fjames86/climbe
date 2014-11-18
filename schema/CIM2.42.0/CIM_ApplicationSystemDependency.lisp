
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ApplicationSystemDependency.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_APPLICATIONSYSTEMDEPENDENCY (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "Antecedent represents the independent application system in this association.")
                 :KEY)
                :INITFORM "CIM_ApplicationSystem")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "Dependent represents the application system dependent on the Antecedent.")
                 :KEY)
                :INITFORM "CIM_ApplicationSystem"))
              (:CIM-NAME "CIM_ApplicationSystemDependency")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Application::AppRuntime")
               (:DESCRIPTION
                "This dependency expresses use-relationships or other logical interactions between application systems. At the business level, the relationship could be due to a distributed business process. Viewed from the technical level, the relationship is to be interpreted as communication between application systems. ApplicationSystemDependency primarily expresses 'horizontal' relationships, i.e., relationships between distributed or local application systems.")))