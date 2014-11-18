
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_CollectionOfMSEs.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_COLLECTIONOFMSES (CIM_COLLECTION)
              ((COLLECTIONID STRING :CIM-NAME "CollectionID" :QUALIFIERS
                ((:DESCRIPTION
                  "The identification of the Collection object. When subclassed, the CollectionID property can be overridden to be a Key property.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                ((:DESCRIPTION
                  "InstanceID is an optional property that may be used to opaquely and uniquely identify an instance of this class within the scope of the instantiating Namespace. Various subclasses of this class may override this property to make it required, or a key. Such subclasses may also modify the preferred algorithms for ensuring uniqueness that are defined below.
To ensure uniqueness within the NameSpace, the value of InstanceID should be constructed using the following \"preferred\" algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon (:), and where <OrgID> must include a copyrighted, trademarked, or otherwise unique name that is owned by the business entity that is creating or defining the InstanceID or that is a registered ID assigned to the business entity by a recognized global authority. (This requirement is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness, <OrgID> must not contain a colon (:). When using this algorithm, the first colon to appear in InstanceID must appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and should not be reused to identify different underlying (real-world) elements. If not null and the above \"preferred\" algorithm is not used, the defining entity must assure that the resulting InstanceID is not reused across any InstanceIDs produced by this or other providers for the NameSpace of this instance. 
If not set to null for DMTF-defined instances, the \"preferred\" algorithm must be used with the <OrgID> set to CIM."))
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
              (:CIM-NAME "CIM_CollectionOfMSEs")
              (:QUALIFIERS :ABSTRACT (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::Collection")
               (:DESCRIPTION
                "The CollectionOfMSEs object allows the grouping of Managed SystemElements for various identification purposes and to reduce the complexity of associating Settings and Configurations. It is abstract to require further definition and semantic refinement in subclasses. The CollectionOfMSEs object does not carry any state or status information, but represents only a grouping or 'bag' of Elements. For this reason, it is incorrect to subclass groups that have state or status from CollectionOfMSEs. An example is CIM_Redundancy Group (which is subclassed from LogicalElement). 
Collections typically aggregate similar ('like') objects,but they are not required to do so. Collections simply identify 'bags' and might represent an optimization. This purpose is especially true with respect to their association to Settings and Configurations. Without Collections, you would need to define individual ElementSetting and ElementConfiguration associations, to tie Settings and Configuration objects to individual ManagedSystemElements. There might be duplication when assigning the same Setting to multiple objects. In addition, using the Collection object allows the determination that the Setting and Configuration associations are indeed the same for the Collection's members. This information would otherwise be obtained by defining the Collection in a proprietary manner, and then querying the ElementSetting and ElementConfiguration associations to determine if the Collection set is completely covered.")))