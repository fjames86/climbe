
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_J2eeApplicationModule.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_J2EEAPPLICATIONMODULE (CIM_SYSTEMCOMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION
                  "The J2ee Application that is comprised of modules.")
                 :KEY)
                :INITFORM "CIM_J2eeApplication")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "The Module that is part of a J2ee Application.")
                 :KEY)
                :INITFORM "CIM_J2eeModule"))
              (:CIM-NAME "CIM_J2eeApplicationModule")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Application::J2eeAppServer")
               (:DESCRIPTION
                "The CIM_J2eeApplicationModule association identifies a software module for a particular J2EE Application.")))