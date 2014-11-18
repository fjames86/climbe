
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_RoutersInAS.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ROUTERSINAS (CIM_SYSTEMCOMPONENT)
              ((ADDCOMMUNITYVALUE BOOLEAN :CIM-NAME "AddCommunityValue"
                :QUALIFIERS
                ((:DESCRIPTION
                  "TRUE means that the community value of this router is added to the existing community value, and FALSE means that the community value of this router replaces the existing community value."))
                :INITFORM NIL)
               (ROLE UINT16 :CIM-NAME "Role" :QUALIFIERS
                ((:DESCRIPTION
                  "This is an enumeration that defines the function, from the point of view of BGP, of this router.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6" "7"))
                 (:VALUES
                  ("Unknown" "Other" "Conventional BGP Speaker"
                   "Route Reflector" "Router Reflector Client"
                   "Route Reflector Non-Client" "Peer Group Member"
                   "Confederation Member")))
                :INITFORM NIL)
               (OTHERROLEDESCRIPTION STRING :CIM-NAME "OtherRoleDescription"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing the type of function that this router has in its AS when the value of the Role property of this class is set to 1 (i.e., \"Other\"). The format of the string inserted in this property should be similar in format to the values defined for the Role property. This property should be set to NULL when the Role property is any value other than 1.")
                 (:MAX-LEN "64"))
                :INITFORM NIL)
               (BGPSUPPORTEDATTRIBUTES (ARRAY STRING) :CIM-NAME
                "BGPSupportedAttributes" :QUALIFIERS
                ((:DESCRIPTION
                  "This is an array of strings that contain the BGP attributes supported by this router."))
                :INITFORM NIL)
               (GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MAX "1")
                 (:DESCRIPTION
                  "The AutonomousSystem that aggregates the routers belonging to it and administers them.")
                 :KEY)
                :INITFORM "CIM_AutonomousSystem")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION "The Routers that are contained in the AS.")
                 :KEY)
                :INITFORM "CIM_ComputerSystem"))
              (:CIM-NAME "CIM_RoutersInAS")
              (:QUALIFIERS :ASSOCIATION (NIL "true") :COMPOSITION
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Network::Systems")
               (:DESCRIPTION
                "This aggregation establishes 'whole-part' relationships between an AutonomousSystem and the routers that it contains. In addition, the routers in the AS share common configuration information, and are commonly administered.")))