
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ParticipatesInSet.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PARTICIPATESINSET NIL
              ((SET NIL :CIM-NAME "Set" :QUALIFIERS
                    (:KEY :AGGREGATE (:DESCRIPTION "The ReplacementSet."))
                    :INITFORM "CIM_ReplacementSet")
               (ELEMENT NIL :CIM-NAME "Element" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The PhysicalElement which should be replaced with other Elements, as a Set."))
                :INITFORM "CIM_PhysicalElement"))
              (:CIM-NAME "CIM_ParticipatesInSet")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Physical::Misc")
               (:DESCRIPTION
                "ParticipatesInSet indicates which PhysicalElements should be replaced together.")))