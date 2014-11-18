
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_NetworkAdapterRedundancyComponent.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_NETWORKADAPTERREDUNDANCYCOMPONENT (CIM_REDUNDANCYCOMPONENT)
              ((SCOPEOFBALANCING UINT16 :CIM-NAME "ScopeOfBalancing"
                :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "Note: The use of this method has been deprecated. 
Deprecated description: Indicates the scope of load balancing for the NetworkAdapters that is involved in the RedundancyGroup. Load balancing can be restricted to transmitting data only (value=1), receiving data only (value=2), or used for both transmit and receive (value=3).")
                 (:VALUE-MAP ("0" "1" "2" "3"))
                 (:VALUES
                  ("Unknown" "Load Balancing - Transmit Only"
                   "Load Balancing - Receive Only" "Full Load Balancing")))
                :INITFORM NIL)
               (PRIMARYADAPTER UINT16 :CIM-NAME "PrimaryAdapter" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_OrderedMemberOfCollection.AssignedSequence"))
                 (:DESCRIPTION
                  "Note: The use of this method has been deprecated. 
Deprecated description: A Boolean that indicates whether the Network Adapter is an original primary adapter (value=1), a preferred primary adapter (value=2), or both (value=3). Values of \"Unknown\" and \"Not Applicable\" can also be specified.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4"))
                 (:VALUES
                  ("Unknown" "Original Primary" "Preferred Primary" "Both"
                   "Not Applicable")))
                :INITFORM NIL)
               (GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                ((:DEPRECATED ("CIM_OrderedMemberOfCollection.Collection"))
                 :AGGREGATE (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION
                  "Note: The use of this method has been deprecated. 
Deprecated description: The RedundancyGroup that represents a set of load-balanced NetworkAdapters.")
                 :KEY)
                :INITFORM "CIM_ExtraCapacityGroup")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:DEPRECATED ("CIM_OrderedMemberOfCollection.Member"))
                 (:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "Note: The use of this method has been deprecated. 
Deprecated description: The Network Adapters that belong to the RedundancyGroup.")
                 :KEY)
                :INITFORM "CIM_NetworkAdapter"))
              (:CIM-NAME "CIM_NetworkAdapterRedundancyComponent")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_OrderedMemberOfCollection")) (NIL "true")
               (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::NetworkAdapter")
               (:DESCRIPTION
                "Note: The use of the CIM_NetworkAdapterRedundancyComponent class has been deprecated because a specific association is not needed. Instead use the CIM_ OrderedMemberOf Collection class. 
Deprecated description: CIM_NetworkAdapterRedundancyComponent indicates the role that a NetworkAdapter plays in an ExtraCapacityGroup, providing load balancing.")))