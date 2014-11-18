
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SATransform.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SATRANSFORM (CIM_SCOPEDSETTINGDATA)
              ((ELEMENTNAME STRING :CIM-NAME "ElementName" :QUALIFIERS
                ((:OVERRIDE "ElementName")
                 (:MAPPING-STRINGS ("IPSP Model.IETF|SATransform.CommonName"))
                 :REQUIRED
                 (:DESCRIPTION
                  "The user-friendly name for this instance of SettingData. In addition, the user-friendly name can be used as an index property for a search or query. (Note: The name does not have to be unique within a namespace.)"))
                :INITFORM NIL)
               (MAXLIFETIMESECONDS UINT64 :CIM-NAME "MaxLifetimeSeconds"
                :QUALIFIERS
                ((:DESCRIPTION
                  "MaxLifetimeSeconds specifies the maximum time that the Security Association should be considered valid after it has been created. A value of 0, the default, indicates that 8 hours should be used. A non-zero value indicates the maximum lifetime in seconds.")
                 (NIL "Seconds")
                 (:MAPPING-STRINGS
                  ("IPSP Model.IETF|SATransform.MaxLifetimeSeconds")))
                :INITFORM "0")
               (MAXLIFETIMEKILOBYTES UINT64 :CIM-NAME "MaxLifetimeKilobytes"
                :QUALIFIERS
                ((:DESCRIPTION
                  "MaxLifetimeKilobytes specifies the maximum kilobyte lifetime for a Security Association. Different lifetimes are used, depending on the strength of the encryption algorithm. A value of 0, the default, indicates that no maximum should be defined. A non-zero value specifies the desired kilobyte lifetime.")
                 (NIL "KiloBytes")
                 (:MAPPING-STRINGS
                  ("IPSP Model.IETF|SATransform.MaxLifetimeKilobytes")))
                :INITFORM "0")
               (VENDORID STRING :CIM-NAME "VendorID" :QUALIFIERS
                ((:DESCRIPTION
                  "VendorID identifies vendor-defined transforms. If this field is empty (the default), then this is a standard transform.")
                 (:MAPPING-STRINGS ("IPSP Model.IETF|SATransform.VendorID")))
                :INITFORM NIL)
               (INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. To ensure uniqueness within the NameSpace, the value of InstanceID should be constructed using the following \"preferred\" algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon (:), and where <OrgID> must include a copyrighted, trademarked, or otherwise unique name that is owned by the business entity that is creating or defining the InstanceID or that is a registered ID assigned to the business entity by a recognized global authority. (This requirement is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness, <OrgID> must not contain a colon (:). When using this algorithm, the first colon to appear in InstanceID must appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and should not be reused to identify different underlying (real-world) elements. If the above \"preferred\" algorithm is not used, the defining entity must assure that the resulting InstanceID is not reused across any InstanceIDs produced by this or other providers for the NameSpace of this instance. 
For DMTF-defined instances, the \"preferred\" algorithm must be used with the <OrgID> set to CIM."))
                :INITFORM NIL)
               (CHANGEABLETYPE UINT16 :CIM-NAME "ChangeableType" :QUALIFIERS
                ((:DESCRIPTION
                  "Enumeration indicating the type of setting. 0 \"Not Changeable - Persistent\" indicates the instance of SettingData represents primordial settings and shall not be modifiable. 1 \"Changeable - Transient\" indicates the SettingData represents modifiable settings that are not persisted. Establishing persistent settings from transient settings may be supported. 2 \"Changeable - Persistent\" indicates the SettingData represents a persistent configuration that may be modified. 3 \"Not Changeable - Transient\" indicates the SettingData represents a snapshot of the settings of the associated ManagedElement and is not persistent.")
                 (:VALUE-MAP ("0" "1" "2" "3"))
                 (:VALUES
                  ("Not Changeable - Persistent" "Changeable - Transient"
                   "Changeable - Persistent" "Not Changeable - Transient")))
                :INITFORM NIL)
               (CONFIGURATIONNAME STRING :CIM-NAME "ConfigurationName"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An instance of CIM_SettingData may correspond to a well-known configuration that exists for an associated CIM_ManagedElement. If the ConfigurationName property is non-NULL, the instance of CIM_SettingData shall correspond to a well-known configuration for a Managed Element, the value of the ConfigurationName property shall be the name of the configuration, and the ChangeableType property shall have the value 0 or 2. A value of NULL for the ConfigurationName property shall mean that the instance of CIM_SettingData does not correspond to a well-known configuration for a Managed Element or that this information is unknown."))
                :INITFORM NIL)
               (CAPTION STRING :CIM-NAME "Caption" :QUALIFIERS
                ((:DESCRIPTION
                  "The Caption property is a short textual description (one- line string) of the object.")
                 (:MAX-LEN "64"))
                :INITFORM NIL)
               (DESCRIPTION STRING :CIM-NAME "Description" :QUALIFIERS
                ((:DESCRIPTION
                  "The Description property provides a textual description of the object."))
                :INITFORM NIL))
              (:CIM-NAME "CIM_SATransform")
              (:QUALIFIERS :ABSTRACT (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Network::IPsec")
               (:DESCRIPTION
                "SATransform is the base class for the various types of transforms that are in effect for an existing IPsecSAEndpoint, or aggregated into phase 2 proposals used during the IPsec negotiation process. This class is defined as a kind of ScopedSettingData, since it describes the set of transform properties that MUST be applied together, if negotiated. This subclassing is different than that defined in IETF's IPSP Policy draft - where it is subclassed from Policy. The definition as SettingData is more consistent with the application of the properties as a set, to the negotiated Security Association. 

Note that an instance of this class is 'scoped' or contained by a System (either a ComputerSystem or AdminDomain), rather than by a SecurityAssociationEndpoint. This is indicated by instantiating the ScopedSetting association, and is necessary since the transform data is used in IPsec negotiation policies (also scoped by Systems) before ever being associated with a SecurityAssociationEndpoint. The latter semantics (i.e., that 'this' transform is negotiated for 'this' Security Association) is conveyed via a subclass of ElementSettingData, TransformOfSecurityAssociation.")
               (:MAPPING-STRINGS ("IPSP Model.IETF|SATransform"))))