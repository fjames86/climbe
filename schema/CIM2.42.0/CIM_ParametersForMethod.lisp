
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ParametersForMethod.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PARAMETERSFORMETHOD NIL
              ((METHODNAME STRING :CIM-NAME "MethodName" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The name of the method that can use the referenced instance of MethodParameters during its invocation.")
                 (:MAX-LEN "64"))
                :INITFORM NIL)
               (PARAMETERS NIL :CIM-NAME "Parameters" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The MethodParameters instance, which can be used by the ParametersForMethod's method invocation."))
                :INITFORM "CIM_MethodParameters")
               (THEMETHOD NIL :CIM-NAME "TheMethod" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The ManagedElement that has a method that can use this instance of MethodParameters."))
                :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_ParametersForMethod")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::MethodParms")
               (:DESCRIPTION
                "ParametersForMethod represents the association between MethodParameters classes and a ManagedElement that has a method that can use the MethodParameters during its invocation. This association is optional. The Method Parameters instance can be passed as a parameter to a method or used to create a method signature before the method is invoked. This association is useful for finding all the valid MethodParameters instances for a particular method. It might be particularly useful for user-oriented interfaces and automated or policy driven method invocations.")))