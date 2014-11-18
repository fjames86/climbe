
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_BGPAttributesForRoute.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_BGPATTRIBUTESFORROUTE (CIM_DEPENDENCY)
              ((PATHATTRPEER STRING :CIM-NAME "PathAttrPeer" :QUALIFIERS
                ((:DESCRIPTION
                  "This defines the IP address of the peer where the path information was learned.")
                 (:MAPPING-STRINGS ("MIB.IETF|BGP4-MIB.bgp4PathAttrPeer"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_BGPAttributesForRoute.PathAttrIPAddrPrefixLen"
                   "CIM_BGPAttributesForRoute.PathAttrIPAddrPrefix")))
                :INITFORM NIL)
               (PATHATTRIPADDRPREFIXLEN UINT8 :CIM-NAME
                "PathAttrIPAddrPrefixLen" :QUALIFIERS
                ((:DESCRIPTION
                  "This defines the length in bits of the IP address prefix for the property, PathAttrPeer. The range is 0 to 32.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|BGP4-MIB.bgp4PathAttrIpAddrPrefixLen"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_BGPAttributesForRoute.PathAttrPeer")))
                :INITFORM NIL)
               (PATHATTRIPADDRPREFIX STRING :CIM-NAME "PathAttrIPAddrPrefix"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The IP address prefix of the property, PathAttrPeer. Its length is specified by the property, PathAttrIpAddrPrefixLen.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|BGP4-MIB.bgp4PathAttrIpAddrPrefix"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_BGPAttributesForRoute.PathAttrPeer"
                   "CIM_BGPAttributesForRoute.PathAttrIPAddrPrefixLen")))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION
                  "The BGPPathAttribute object that may be associated with a BGPIPRoute.")
                 :KEY)
                :INITFORM "CIM_BGPPathAttributes")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MAX "1")
                 (:DESCRIPTION
                  "The BGPIPRoute that may have an associated set of per-peer attributes.")
                 :KEY)
                :INITFORM "CIM_BGPIPRoute"))
              (:CIM-NAME "CIM_BGPAttributesForRoute")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::BGP")
               (:DESCRIPTION
                "This defines the attributes that are transmitted between BGP peers on a per-route basis.")))