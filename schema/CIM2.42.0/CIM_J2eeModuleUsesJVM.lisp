
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_J2eeModuleUsesJVM.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_J2EEMODULEUSESJVM (CIM_HOSTEDDEPENDENCY)
              ((DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The Module that uses a Java Virtual Machine.")
                 :KEY)
                :INITFORM "CIM_J2eeModule")
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1")
                 (:DESCRIPTION "The Java VM on which the module is running.")
                 (:MAX "1") :KEY)
                :INITFORM "CIM_J2eeJVM"))
              (:CIM-NAME "CIM_J2eeModuleUsesJVM")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Application::J2eeAppServer")
               (:DESCRIPTION
                "The CIM_J2eeModuleUsesJVM association identifies the JVM that a specific Module runs in.")))