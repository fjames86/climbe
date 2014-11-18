
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ReferencedProfile.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_REFERENCEDPROFILE (CIM_REFERENCEDSPECIFICATION)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The RegisteredProfile that is referenced by the Dependent Profile.")
                 :KEY)
                :INITFORM "CIM_RegisteredProfile")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "A RegisteredProfile that references other profiles.")
                 :KEY)
                :INITFORM "CIM_RegisteredProfile"))
              (:CIM-NAME "CIM_ReferencedProfile")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.37.0")
               (:UML-PACKAGE-PATH "CIM::Interop")
               (:DESCRIPTION
                "A profile that is referenced by another RegisteredProfile.")))