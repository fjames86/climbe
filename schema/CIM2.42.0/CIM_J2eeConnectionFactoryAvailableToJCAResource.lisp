
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_J2eeConnectionFactoryAvailableToJCAResource.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_J2EECONNECTIONFACTORYAVAILABLETOJCARESOURCE
              (CIM_HOSTEDDEPENDENCY)
              ((DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The JCA Resource that requires a Connection Factory.")
                 :KEY)
                :INITFORM "CIM_J2eeJCAResource")
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1")
                 (:DESCRIPTION
                  "The Connection Factory being used by a JCA Resource.")
                 (:MAX "1") :KEY)
                :INITFORM "CIM_J2eeJCAConnectionFactory"))
              (:CIM-NAME "CIM_J2eeConnectionFactoryAvailableToJCAResource")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Application::J2eeAppServer")
               (:DESCRIPTION
                "CIM_J2eeConnectionFactoryAvailableToJCAResource is an association that identifies the connection factory that is available to a CIM_J2eeJCAResource object.")))