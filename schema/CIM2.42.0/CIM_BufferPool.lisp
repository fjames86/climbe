
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_BufferPool.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_BUFFERPOOL (CIM_COLLECTIONOFMSES)
              ((COLLECTIONID STRING :CIM-NAME "CollectionID" :QUALIFIERS
                (:KEY (:OVERRIDE "CollectionID")
                 (:DESCRIPTION
                  "This property is defined in the CollectionOfMSEs class, but is overridden here to serve as part of the (composite) key that identifies the BufferPool instance.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (CREATIONCLASSNAME STRING :CIM-NAME "CreationClassName"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "CreationClassName indicates the name of the class or the subclass used in the creation of an instance. When used with the other key properties of this class, this property allows all instances of this class and its subclasses to be uniquely identified.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (NAME STRING :CIM-NAME "Name" :QUALIFIERS
                ((:DESCRIPTION
                  "The Name property defines the label by which the object is known.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (BUFFERSIZE UINT16 :CIM-NAME "BufferSize" :QUALIFIERS
                ((:DEPRECATED ("CIM_BufferPool.SizeOfBuffers"))
                 (:DESCRIPTION
                  "This property is a 16-bit unsigned integer, and defines the number of bytes in each buffer. It is deprecated in lieu of a similar uint32 property.")
                 (NIL "Bytes"))
                :INITFORM NIL)
               (SIZEOFBUFFERS UINT32 :CIM-NAME "SizeOfBuffers" :QUALIFIERS
                ((:DESCRIPTION
                  "This property is a 32-bit unsigned integer, and defines the number of bytes in each buffer.")
                 (NIL "Bytes"))
                :INITFORM NIL)
               (TOTALBUFFERS UINT32 :CIM-NAME "TotalBuffers" :QUALIFIERS
                ((:DESCRIPTION
                  "This property is a 32-bit unsigned integer, and defines the total number of buffers in the Pool."))
                :INITFORM NIL)
               (AVAILABLEBUFFERS UINT32 :CIM-NAME "AvailableBuffers"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This property is a 32-bit unsigned integer, and defines the number of buffers in the Pool that are currently not allocated to any instance of a QueuingService. Buffers allocated to a QueuingService could either be in use (containing packet data), or allocated to a Queue pending the arrival of new packet data."))
                :INITFORM NIL)
               (SHAREDBUFFERS UINT32 :CIM-NAME "SharedBuffers" :QUALIFIERS
                ((:DESCRIPTION
                  "This property is a 32-bit unsigned integer, and defines the number of buffers in the Pool that have been simultaneously allocated to multiple instances of QueuingService."))
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
              (:CIM-NAME "CIM_BufferPool")
              (:QUALIFIERS (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Network::Buffers")
               (:DESCRIPTION
                "This class represents the use of buffers by a Queuing Service. The existence and management of individual buffers will be modeled in a future release. At the current level of abstraction, modeling the existence of the BufferPool is necessary. Long term, it is not sufficient. 

In implementations where there are multiple buffer sizes, an instance of BufferPool should be defined for each set of buffers with identical or similar sizes. These instances of buffer pools can then be grouped together using the CollectedBuffersPool association. 

Note that this class is derived from CollectionOfMSEs, and not from Forwarding or ConditioningService. BufferPool is only a collection of storage, and is NOT a Service.")))