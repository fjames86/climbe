
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_LogicalPortGroup.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_LOGICALPORTGROUP (CIM_SYSTEMSPECIFICCOLLECTION)
              ((NAME STRING :CIM-NAME "Name" :QUALIFIERS
                ((:DESCRIPTION
                  "The Name property defines the identity by which the LogicalPortGroup is known.")
                 (:MAX-LEN "256")
                 (:MODEL-CORRESPONDENCE ("CIM_LogicalPortGroup.NameFormat")))
                :INITFORM NIL)
               (NAMEFORMAT STRING :CIM-NAME "NameFormat" :QUALIFIERS
                ((:DESCRIPTION
                  "The NameFormat property identifies how the Name of the LogicalPortGroup is generated.")
                 (:VALUE-MAP ("Unknown" "Other" "WWN" "GUID")) (:MAX-LEN "64")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_LogicalPortGroup.Name"
                   "CIM_LogicalPortGroup.OtherNameFormat")))
                :INITFORM NIL)
               (OTHERNAMEFORMAT STRING :CIM-NAME "OtherNameFormat" :QUALIFIERS
                ((:DESCRIPTION
                  "A string that describes how the LogicalPortGroup is identified when the NameFormat is \"Other\".")
                 (:MODEL-CORRESPONDENCE ("CIM_LogicalPortGroup.Name")))
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
              (:CIM-NAME "CIM_LogicalPortGroup")
              (:QUALIFIERS (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::Ports")
               (:DESCRIPTION
                "A collection of one or more ports that are logically grouped for administrative and discovery or topology purposes. LogicalPortGroups define port collections for access control, or for use in routing policy or other management tasks. For example, in Fibre Channel and Infiniband, a LogicalPortGroup represents the concept of a 'node'.")))