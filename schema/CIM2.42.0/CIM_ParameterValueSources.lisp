
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ParameterValueSources.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PARAMETERVALUESOURCES NIL
              ((PARAMETERS NIL :CIM-NAME "Parameters" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The MethodParameters instance whose property values are to be set."))
                :INITFORM "CIM_MethodParameters")
               (VALUESOURCE NIL :CIM-NAME "ValueSource" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The ManagedElement that contains properties to be used to populate the values of the properties of the MethodParameters instance."))
                :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_ParameterValueSources")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::MethodParms")
               (:DESCRIPTION
                "ParameterValueSources represents the association between a MethodParameters instance and the ManagedElement instances, which contain properties to be used to create values for the MethodParameters properties.")))