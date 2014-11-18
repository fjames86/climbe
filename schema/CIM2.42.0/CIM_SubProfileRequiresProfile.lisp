
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SubProfileRequiresProfile.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SUBPROFILEREQUIRESPROFILE (CIM_REFERENCEDPROFILE)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("CIM_ReferencedProfile.Antecedent"))
                 (:OVERRIDE "Antecedent") (:MIN "1")
                 (:DESCRIPTION
                  "The RegisteredProfile that is referenced/required by the subprofile.")
                 :KEY)
                :INITFORM "CIM_RegisteredProfile")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_ReferencedProfile.Dependent"))
                 (:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "A RegisteredSubProfile that requires a scoping profile, for context.")
                 :KEY)
                :INITFORM "CIM_RegisteredSubProfile"))
              (:CIM-NAME "CIM_SubProfileRequiresProfile")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("CIM_ReferencedProfile"))
               (:VERSION "2.37.0") (:UML-PACKAGE-PATH "CIM::Interop")
               (:DESCRIPTION
                "A subprofile requires another RegisteredProfile for context. This association mandates the scoping relationship between a subprofile and its scoping profile.")))