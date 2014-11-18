
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_StorageRedundancySet.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_STORAGEREDUNDANCYSET (CIM_REDUNDANCYSET)
              ((TYPEOFALGORITHM UINT16 :CIM-NAME "TypeOfAlgorithm" :QUALIFIERS
                ((:DESCRIPTION
                  "TypeOfAlgorithm specifies the algorithm used for storage data redundancy and reconstruction. For example, 'P+Q' (=5) or 'P+S' (=7) may be specified.")
                 (:VALUE-MAP ("0" "1" "3" "4" "5" "6" "7"))
                 (:VALUES ("Unknown" "Other" "Copy" "XOR" "P+Q" "S" "P+S"))
                 (:MAPPING-STRINGS ("MIF.DMTF|Redundancy Group|001.2"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageRedundancySet.OtherAlgorithm")))
                :INITFORM NIL)
               (OTHERALGORITHM STRING :CIM-NAME "OtherAlgorithm" :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing the redundancy algorithm when the TypeOfAlgorithm is set to 1 'Other'.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageRedundancySet.TypeOfAlgorithm")))
                :INITFORM NIL)
               (REDUNDANCYSTATUS UINT16 :CIM-NAME "RedundancyStatus"
                :QUALIFIERS
                ((:DESCRIPTION
                  "RedundancyStatus provides information on the state of the RedundancyGroup. 'Fully Redundant' (value=2) means that all of the configured redundancy is still available; 'Degraded Redundancy' (3) means that some configured elements are degraded, missing or failed but that the number of elements in the set is still greater than the minimum required ('MinNumberNeeded'); 'Redundancy Lost' (4) means that sufficient configured elements are missing or failed that no redundancy is available and the next failure experienced will cause overall failure. 'Overall Failure' (5) means that there has been an overall failure of the RedundancySet.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5"))
                 (:VALUES
                  ("Unknown" "DMTF Reserved" "Fully Redundant"
                   "Degraded Redundancy" "Redundancy Lost" "Overall Failure"))
                 (:MODEL-CORRESPONDENCE ("CIM_RedundancySet.MinNumberNeeded")))
                :INITFORM NIL)
               (MINNUMBERNEEDED UINT32 :CIM-NAME "MinNumberNeeded" :QUALIFIERS
                ((:DESCRIPTION
                  "MinNumberNeeded indicates the smallest number of elements that MUST be operational in order to function. For example, in an N+1 redundancy relationship, the MinNumberNeeded property is set equal to N. In a 'LimitedSparing' environment, this property is meaningless and SHOULD be set to zero.")
                 (:MIN-VALUE "0"))
                :INITFORM NIL)
               (MAXNUMBERSUPPORTED UINT32 :CIM-NAME "MaxNumberSupported"
                :QUALIFIERS
                ((:DESCRIPTION
                  "MaxNumberSupported indicates the largest number of elements that can participate in the RedundancySet. A value of 0 indicates there is no limit on the number of elements."))
                :INITFORM NIL)
               (VENDORIDENTIFYINGINFO STRING :CIM-NAME "VendorIdentifyingInfo"
                :QUALIFIERS
                ((:DESCRIPTION
                  "VendorIdentifyingInfo captures the vendor identifying data for the RedundancySet. One example is the product name for a cluster."))
                :INITFORM NIL)
               (LOADBALANCEALGORITHM UINT16 :CIM-NAME "LoadBalanceAlgorithm"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION "The current load balance algorithm. 
Least Blocks, Least IO, and Address Region are used in storage device path redundancy drivers to optimize load balancing by routing requests to a path with the least queued blocks or IO requests, or based on locality of reference. 
'Product Specific' indicates that the algorithm is optimized for a particular type of product. Information about that product SHOULD be provided in an associated CIM_Product instance.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6" "7"))
                 (:VALUES
                  ("Unknown" "Other" "No Load Balancing" "Round Robin"
                   "Least Blocks" "Least IO" "Address Region"
                   "Product Specific"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_RedundancySet.OtherLoadBalanceAlgorithm")))
                :INITFORM "2")
               (OTHERLOADBALANCEALGORITHM STRING :CIM-NAME
                "OtherLoadBalanceAlgorithm" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "When LoadBalanceAlgorithm is Other, this property describes the algorithm.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_RedundancySet.LoadBalanceAlgorithm")))
                :INITFORM NIL)
               (INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. To ensure uniqueness within the NameSpace, the value of InstanceID should be constructed using the following 'preferred' algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon ':', and where <OrgID> must include a unique name. It can be a copyrighted, trademarked, or otherwise unique name that is owned by the business entity that is creating or defining the InstanceID. Or, it could be a registered ID that is assigned to the business entity by a recognized global authority.(This requirement is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness <OrgID> must not contain a colon (':'). When using this algorithm, the first colon to appear in InstanceID must appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and should not be re-used to identify different underlying (real-world) elements. If the above 'preferred' algorithm is not used, the defining entity must ensure that the resulting InstanceID is not re-used as any of InstanceIDs produced by this or other providers for the NameSpace of this instance. 
For DMTF-defined instances, the 'preferred' algorithm must be used with the <OrgID> set to 'CIM'."))
                :INITFORM NIL)
               (CAPTION STRING :CIM-NAME "Caption" :QUALIFIERS
                ((:DESCRIPTION
                  "The Caption property is a short textual description (one- line string) of the object.")
                 (:MAX-LEN "64"))
                :INITFORM NIL)
               (DESCRIPTION STRING :CIM-NAME "Description" :QUALIFIERS
                ((:DESCRIPTION
                  "The Description property provides a textual description of the object."))
                :INITFORM NIL)
               (ELEMENTNAME STRING :CIM-NAME "ElementName" :QUALIFIERS
                ((:DESCRIPTION
                  "A user-friendly name for the object. This property allows each instance to define a user-friendly name in addition to its key properties, identity data, and description information. 
Note that the Name property of ManagedSystemElement is also defined as a user-friendly name. But, it is often subclassed to be a Key. It is not reasonable that the same property can convey both identity and a user-friendly name, without inconsistencies. Where Name exists and is not a Key (such as for instances of LogicalDevice), the same information can be present in both the Name and ElementName properties. Note that if there is an associated instance of CIM_EnabledLogicalElementCapabilities, restrictions on this properties may exist as defined in ElementNameMask and MaxElementNameLen properties defined in that class."))
                :INITFORM NIL)
               (TYPEOFSET (ARRAY UINT16) :CIM-NAME "TypeOfSet" :QUALIFIERS
                ((:DESCRIPTION
                  "TypeOfSet provides information on the type of redundancy. N+1 (=2) indicates all members are active, are unaware and function independent of one another. However, there exist at least one extra member to achieve functionality. 'Sparing' is implied (i.e. each member can be a spare for the other(s). An example of N+1 is a system that has 2 power supplies, but needs only 1 power supply to functioning properly. N+1 is a special case of N+M redundancy where M=1. A value of N+1 (=2) shall be used for N+M redundancy. - Load Balanced (=3) indicates all members are active. However, there functionality is not independent of each other. Their functioning is determined by some sort of load balancing algrothim (implemented in hardware and/or software). 'Sparing' is implied (i.e. each member can be a spare for the other(s). 
- Sparing (=4) indicates that all members are active and are aware of each others. However, their functionality is independent until failover. Each member can be a spare for the other(s). 
- Limited Sparing (=5) indicates that all members are active, and they may or may not be aware of each and they are not spares for each other. Instead, their redundancy is indicated by the IsSpare relationship.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" ".." "0x8000.."))
                 (:VALUES
                  ("Unknown" "Other" "N+1" "Load Balanced" "Sparing"
                   "Limited Sparing" "DMTF Reserved" "Vendor Reserved"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE ("CIM_RedundancySet.OtherTypeOfSet")))
                :INITFORM NIL)
               (OTHERTYPEOFSET (ARRAY STRING) :CIM-NAME "OtherTypeOfSet"
                :QUALIFIERS
                ((:DESCRIPTION
                  "When the corresponding array entry in TypeOfSet[] is 'Other', this entry provides a string describing the type of set.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE ("CIM_RedundancySet.TypeOfSet")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_StorageRedundancySet")
              (:QUALIFIERS (:VERSION "2.8.1000")
               (:UML-PACKAGE-PATH "CIM::Core::Redundancy")
               (:DESCRIPTION
                "A class derived from RedundancySet describing storage-related redundancy information. StorageRedundancySets are used to protect user data. They aggregate one or more underlying StorageExtents, associated via MemberOfCollection, and produce one or more higher-level Extents. The Extents are related to each other via a BasedOn association. And, the higher level Extent is related to the StorageRedundancy Set via the LogicalIdentity association. 
Note that StorageRedundancySets may overlap in their aggregation of members. If this occurs, the overlapping Extents SHOULD NOT contain any check data.")))
(DEFCIM-METHOD FAILOVER
    ((INSTANCE CIM_STORAGEREDUNDANCYSET)
     (FAILOVERFROM "CIM_ManagedElement" "FailoverFrom" :IN
      (:DESCRIPTION
       "The primary ManagedSystemElement that will become inactive after the method."))
     (FAILOVERTO "CIM_ManagedElement" "FailoverTo" :IN
      (:DESCRIPTION
       "The ManagedSystemElement that will take over from the primary MSE.")))
    ((:CIM-NAME "Failover")
     (:QUALIFIERS
      (:DESCRIPTION
       "This method forces a failover from one ManagedElement to another. There are two parameters to the Failover method. 
- FailoverFrom is a reference to an 'active' ManagedElement that will become inactive after the method. This element SHOULD be part of the RedundancySet via a MemberOfCollection relationship. 
- FailoverTo is a reference to the ManagedElement that will take over for the FailoverFrom element. This element SHOULD either be a member of the RedundancySet or be associated with the RedundancySet via an IsSpare relationship. 

Upon sucessful completion: 
- the FailoverTo element SHOULD be associated to the RedundancySet via MemberOfCollection. 
- the FailFrom element SHOULD either still be associated to the RedundandySet via MemberOfCollection with a OperationalStatus or EnableState that indicates it not active, or it SHOULD be associated to the 'Spared' collection via the MemberOfCollection association.")
      (:VALUE-MAP ("0" "1" "2" "3" "4" ".." "32768..65535"))
      (:VALUES
       ("Completed with No Error" "Not Supported" "Unknown/Unspecified Error"
        "Busy/In Use" "Paramter Error" "DMTF Reserved" "Vendor Reserved")))))