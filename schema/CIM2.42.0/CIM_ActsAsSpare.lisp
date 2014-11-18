
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ActsAsSpare.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ACTSASSPARE NIL
              ((HOTSTANDBY BOOLEAN :CIM-NAME "HotStandby" :QUALIFIERS
                ((:DEPRECATED ("CIM_IsSpare.SpareStatus"))
                 (:DESCRIPTION
                  "HotStandby is a boolean indicating that the spare is operating as a hot standby."))
                :INITFORM NIL)
               (GROUP NIL :CIM-NAME "Group" :QUALIFIERS
                ((:DEPRECATED ("CIM_IsSpare.Dependent")) :KEY
                 (:DESCRIPTION "The SpareGroup."))
                :INITFORM "CIM_SpareGroup")
               (SPARE NIL :CIM-NAME "Spare" :QUALIFIERS
                ((:DEPRECATED ("CIM_IsSpare.Antecedent")) :KEY
                 (:DESCRIPTION
                  "A ManagedSystemElement acting as a spare and participating in the SpareGroup."))
                :INITFORM "CIM_ManagedSystemElement"))
              (:CIM-NAME "CIM_ActsAsSpare")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("CIM_IsSpare"))
               (:VERSION "2.8.1000")
               (:UML-PACKAGE-PATH "CIM::Core::Redundancy")
               (:DESCRIPTION
                "The ActsAsSpare association indicates which elements can spare or replace the other aggregated elements. The fact that a spare can operate in \"hot standby\" mode is specified on an element by element basis. 
The use of this class is being deprecated in lieu of using the IsSpare relationship.")))