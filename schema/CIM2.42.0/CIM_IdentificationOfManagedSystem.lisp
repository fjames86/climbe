
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_IdentificationOfManagedSystem.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_IDENTIFICATIONOFMANAGEDSYSTEM (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION "The System which is identified.") :KEY)
                :INITFORM "CIM_System")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MAX "1")
                 (:DESCRIPTION "The SystemIdentification information.") :KEY)
                :INITFORM "CIM_SystemIdentification"))
              (:CIM-NAME "CIM_IdentificationOfManagedSystem")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Interop")
               (:DESCRIPTION
                "IdentificationOfManagedSystem is an association that links the SystemIdentification object to the CIM_System(s) that are being identified and represented in the Namespace.")))