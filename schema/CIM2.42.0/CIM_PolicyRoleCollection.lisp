
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PolicyRoleCollection.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_POLICYROLECOLLECTION (CIM_SYSTEMSPECIFICCOLLECTION)
              ((POLICYROLE STRING :CIM-NAME "PolicyRole" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "The PolicyRole name for the PolicySets and other ManagedElements that are identified and aggregated by the Collection. Note that the aggregated PolicySets define the rules and groups of rules that may be applied to the associated ManagedElements. 

Although not officially designated as 'role combinations', multiple roles may be specified using the form: 
<RoleName>[&&<RoleName>]* 
where the individual role names appear in alphabetical order (according to the collating sequence for UCS-2). Implementations may treat PolicyRole values that are specified as 'role combinations' as simple strings."))
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
                :INITFORM NIL))
              (:CIM-NAME "CIM_PolicyRoleCollection")
              (:QUALIFIERS (:VERSION "2.8.0") (:UML-PACKAGE-PATH "CIM::Policy")
               (:DESCRIPTION
                "PolicyRoleCollection is used to represent a collection of ManagedElements that share a common policy role, and the PolicySets that CAN BE applied to those elements. (Note that the PolicySets that are CURRENTLY applied are indicated via instances of the association, PolicySetAppliesToElement.) The PolicyRoleCollection always exists in the context of a System, specified using the PolicyRoleCollectionInSystem aggregation. The value of the PolicyRole property in this class specifies the role. It is defined as a free-form string. ManagedElements that share the role defined in this collection are aggregated into the Collection via the ElementInPolicyRoleCollection association.")))
(DEFCIM-METHOD ACTIVATEPOLICYSET
    ((INSTANCE CIM_POLICYROLECOLLECTION)
     (ELEMENT "CIM_ManagedElement" "Element" :IN
      (:DESCRIPTION
       "The ManagedElement to which the aggregated PolicySets of this Collection are applied.")))
    ((:CIM-NAME "ActivatePolicySet")
     (:QUALIFIERS
      (:DESCRIPTION
       "Activates/applies the PolicySets aggregated into this Collection to the specified ManagedElement. The ManagedElement MUST be a member of the Collection, associated via ElementInPolicyRoleCollection. The result of this method, if it is successfully executed, is that the aggregated PolicySets are deployed and enforced for the Element. This is reflected by the instantiation of the PolicySetAppliesToElement association between the named Element and each PolicySet.")
      (:VALUE-MAP ("0" "1" "2" "3" "4" ".." "0x8000.."))
      (:VALUES
       ("Success" "Not Supported" "Unknown" "Timeout" "Failed" "DMTF Reserved"
        "Vendor Specific")))))
(DEFCIM-METHOD DEACTIVATEPOLICYSET
    ((INSTANCE CIM_POLICYROLECOLLECTION)
     (ELEMENT "CIM_ManagedElement" "Element" :IN
      (:DESCRIPTION
       "The ManagedElement to which the aggregated PolicySets of this Collection MUST NOT apply.")))
    ((:CIM-NAME "DeactivatePolicySet")
     (:QUALIFIERS
      (:DESCRIPTION
       "Deactivates the aggregated PolicySets for the specified ManagedElement. The result of this method, if it is successfully executed, is that the aggregated PolicySets are NOT enforced for the Element. This is reflected by the removal of the PolicySetAppliesToElement association between the named Element and each PolicySet. If a PolicySet is not currently enforced for the ManagedElement, then this method has no effect for that Set.")
      (:VALUE-MAP ("0" "1" "2" "3" "4" ".." "0x8000..0xFFFF"))
      (:VALUES
       ("Success" "Not Supported" "Unknown" "Timeout" "Failed" "DMTF Reserved"
        "Vendor Specific")))))