
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_J2eeServerInDomain.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_J2EESERVERINDOMAIN (CIM_SYSTEMCOMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The J2ee Management Domain.") :KEY)
                :INITFORM "CIM_J2eeDomain")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent") (:MIN "1")
                 (:DESCRIPTION
                  "The J2ee Server that is a member of the domain.")
                 :KEY)
                :INITFORM "CIM_J2eeServer"))
              (:CIM-NAME "CIM_J2eeServerInDomain")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Application::J2eeAppServer")
               (:DESCRIPTION
                "The CIM_J2eeServerInDomain association identifies the J2EE Server that are part of a J2EE Domain for management purposes.")))