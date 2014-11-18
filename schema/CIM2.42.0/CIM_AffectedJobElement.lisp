
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AffectedJobElement.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_AFFECTEDJOBELEMENT NIL
              ((ELEMENTEFFECTS (ARRAY UINT16) :CIM-NAME "ElementEffects"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration describing the 'effect' on the ManagedElement. This array corresponds to the OtherElementEffectsDescriptions array, where the latter provides details related to the high-level 'effects' enumerated by this property. Additional detail is required if the ElementEffects array contains the value 1, \"Other\".")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5"))
                 (:VALUES
                  ("Unknown" "Other" "Exclusive Use" "Performance Impact"
                   "Element Integrity" "Create"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_AffectedJobElement.OtherElementEffectsDescriptions")))
                :INITFORM NIL)
               (OTHERELEMENTEFFECTSDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "OtherElementEffectsDescriptions" :QUALIFIERS
                ((:DESCRIPTION
                  "Provides details for the 'effect' at the corresponding array position in ElementEffects. This information is required whenever ElementEffects contains the value 1 (\"Other\").")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_AffectedJobElement.ElementEffects")))
                :INITFORM NIL)
               (AFFECTEDELEMENT NIL :CIM-NAME "AffectedElement" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The ManagedElement affected by the execution of the Job."))
                :INITFORM "CIM_ManagedElement")
               (AFFECTINGELEMENT NIL :CIM-NAME "AffectingElement" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The Job that is affecting the ManagedElement."))
                :INITFORM "CIM_Job"))
              (:CIM-NAME "CIM_AffectedJobElement")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.15.0")
               (:UML-PACKAGE-PATH "CIM::System::Processing")
               (:DESCRIPTION
                "AffectedJobElement represents an association between a Job and the ManagedElement(s) that may be affected by its execution. It may not be feasible for the Job to describe all of the affected elements. The main purpose of this association is to provide information when a Job requires exclusive use of the 'affected' ManagedElment(s) or when describing that side effects may result.")))