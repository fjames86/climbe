
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_J2eeServerUsesJVM.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_J2EESERVERUSESJVM (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1")
                 (:DESCRIPTION "The Java VM that is used by the J2ee Server.")
                 :KEY)
                :INITFORM "CIM_J2eeJVM")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MIN "1")
                 (:DESCRIPTION
                  "The J2ee Server that has threads running on the JVM.")
                 :KEY)
                :INITFORM "CIM_J2eeServer"))
              (:CIM-NAME "CIM_J2eeServerUsesJVM")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Application::J2eeAppServer")
               (:DESCRIPTION
                "The association between a J2EE server and the Java virtual machine on which the J2EE server has running threads.")))