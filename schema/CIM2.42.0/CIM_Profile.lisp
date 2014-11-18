
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_Profile.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PROFILE (CIM_COLLECTION)
              ((INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_SettingData.InstanceID" "CIM_Setting.SettingID"))
                 :KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Note: The use of this element is deprecated. Deprecated description: Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. To ensure uniqueness within the NameSpace, the value of InstanceID should be constructed using the following \"preferred\" algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon (:), and where <OrgID> must include a copyrighted, trademarked, or otherwise unique name that is owned by the business entity that is creating or defining the InstanceID or that is a registered ID assigned to the business entity by a recognized global authority. (This requirement is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness, <OrgID> must not contain a colon (:). When using this algorithm, the first colon to appear in InstanceID must appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and should not be reused to identify different underlying (real-world) elements. If the above \"preferred\" algorithm is not used, the defining entity must assure that the resulting InstanceID is not reused across any InstanceIDs that are produced by this or other providers for the NameSpace of this instance. 
For DMTF-defined instances, the preferred algorithm must be used with the <OrgID> set to CIM."))
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
              (:CIM-NAME "CIM_Profile")
              (:QUALIFIERS
               (:DEPRECATED
                ("CIM_SettingData" "CIM_Setting" "CIM_ConcreteComponent"))
               (:VERSION "2.19.0") (:UML-PACKAGE-PATH "CIM::Core::Settings")
               (:DESCRIPTION
                "Note: The use of CIM_Profile is deprecated in favor of aggregating instances of Setting or SettingData into \"higher-level\" Settings or SettingData objects using the ConcreteComponent association. This use simplifies the use of Settings or SettingData. With Profiles subclassing from Collection, separate associations were needed between an element and either its Profiles or Settings or SettingData. This class introduced unnecessary complexity and redundancy into the model. 
Deprecated description: Profile specifies a general collection of Settings or SettingData objects that are logically grouped together. Note: The CIM_Profile class uses simplified naming or identity algorithms and collection algorithms, as compared to CIM_Configuration. The settings are \"collected\" into the Profile using the MemberOfCollection association. Note that a Profile obtains its setting data and other necessary information from collected Setting and SettingData instances and by the definition of additional properties in subclasses. One example of a Profile is to define the collection of settings for a particular person. Another is to define the collection of settings that are appropriate when initializing a system. 
Profile is tied to a ManagedElement using the ElementProfile association. The ManagedElement provides the context for the Profile, and the settings collected by Profile should be settings of the associated ManagedElement. Note that a ManagedElement cannot exist when the Profile is instantiated. This situation is important to remember when the Profile is used in the creation of the real-world entity that is represented by (and then instantiated in) the ManagedElement.")))