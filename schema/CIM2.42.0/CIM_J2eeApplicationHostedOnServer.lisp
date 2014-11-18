
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_J2eeApplicationHostedOnServer.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_J2EEAPPLICATIONHOSTEDONSERVER (CIM_HOSTEDDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION "The hosting J2ee Server.") :KEY)
                :INITFORM "CIM_J2eeServer")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The hosted J2ee Application.") :KEY)
                :INITFORM "CIM_J2eeApplication"))
              (:CIM-NAME "CIM_J2eeApplicationHostedOnServer")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Application::J2eeAppServer")
               (:DESCRIPTION
                "The CIM_J2eeApplicationHostedOnServer association identifies a hosting J2ee Server for a particular J2EE Application.")))