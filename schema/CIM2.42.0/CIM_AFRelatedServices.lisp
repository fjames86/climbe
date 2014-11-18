
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AFRelatedServices.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_AFRELATEDSERVICES NIL
              ((AFLOWERDROPPRECEDENCE NIL :CIM-NAME "AFLowerDropPrecedence"
                :QUALIFIERS
                (:KEY (:MAX "1")
                 (:DESCRIPTION
                  "The AFService with a lower drop precedence (ie, lower probability of dropping packets)."))
                :INITFORM "CIM_AFService")
               (AFHIGHERDROPPRECEDENCE NIL :CIM-NAME "AFHigherDropPrecedence"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "An AFService at the same IP packet-forwarding class level, but at a higher drop precedence."))
                :INITFORM "CIM_AFService"))
              (:CIM-NAME "CIM_AFRelatedServices")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Network::QoS")
               (:DESCRIPTION
                "The IETF's RFC2597 describes a Differentiated Services Per-Hop-Behavior (PHB) Group called Assured Forwarding (AF). Quoting from the RFC, 'The AF PHB group provides delivery of IP packets in four independently forwarded AF classes. Within each AF class, an IP packet can be assigned one of three different levels of drop precedence.' The AFRelatedServices association describes the precedence of the individual AF drop-related Services within an AF IP packet-forwarding class.")))