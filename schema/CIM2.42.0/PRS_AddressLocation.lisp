
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/PRS_AddressLocation.xml"

(in-package #:climbe)


(DEFCIM-CLASS PRS_ADDRESSLOCATION (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1")
                 (:DESCRIPTION "The PRS_Address.") :KEY)
                :INITFORM "PRS_Address")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:DESCRIPTION "The PRS_Location.")
                 :KEY)
                :INITFORM "PRS_Location"))
              (:CIM-NAME "PRS_AddressLocation")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "PRS::Support")
               (:DESCRIPTION "Associates PRS_Address and PRS_Location.")))