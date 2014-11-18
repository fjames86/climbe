
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DatabaseSegmentSettingData.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DATABASESEGMENTSETTINGDATA (CIM_SCOPEDSETTINGDATA)
              ((INITIALEXTENTSIZE UINT64 :CIM-NAME "InitialExtentSize"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The size, in bytes, of the first extent to be allocated when a database segment is created.")
                 (NIL "Bytes") (:P-UNIT "byte"))
                :INITFORM NIL)
               (MINIMUMEXTENTS UINT64 :CIM-NAME "MinimumExtents" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The total number of extents to be allocated when the database segment is created. This setting allows for a large initial segment allocation at creation time, even if contiguous space is not available."))
                :INITFORM NIL)
               (MAXIMUMEXTENTS UINT64 :CIM-NAME "MaximumExtents" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The upper limit on the number of extents that can be allocated for the segment."))
                :INITFORM NIL)
               (NEXTEXTENTSIZE UINT64 :CIM-NAME "NextExtentSize" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The size, in bytes, to be allocated for the next incremental extent for the segment. A NextExtentSize of 0 indicates that the size of incremental extents will be determined based on the value of PercentIncrease.")
                 (NIL "Bytes") (:MIN-VALUE "0")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DatabaseSegmentSettingData.PercentIncrease"))
                 (:P-UNIT "byte"))
                :INITFORM NIL)
               (PERCENTINCREASE UINT16 :CIM-NAME "PercentIncrease" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The percentage by which the next incremental extent will grow over the previously allocated size of all extents for the segment. A PercentIncrease of 0 indicates that all incremental extents will be the same size, as specified by NextExtentSize. This value is ignored and should be set to 0 if NextExtentSize has a value other than 0.")
                 (:MIN-VALUE "0")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DatabaseSegmentSettingData.NextExtentSize")))
                :INITFORM NIL)
               (NUMBEROFFREELISTS UINT32 :CIM-NAME "NumberOfFreeLists"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "A freelist is a list of the free blocks that are associated with a database segment. The freelist is used to determine which segments are eligible for accepting data when a new insert or update request is processed. The NumberOfFreeLists setting identifies the number of freelists that are defined for the database segment. This value is typically set to the expected number of concurrent inserts for the segment."))
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
               (ELEMENTNAME STRING :CIM-NAME "ElementName" :QUALIFIERS
                (:REQUIRED (:OVERRIDE "ElementName")
                 (:DESCRIPTION
                  "The user-friendly name for this instance of SettingData. In addition, the user-friendly name can be used as an index property for a search or query. (Note: The name does not have to be unique within a namespace.)"))
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
              (:CIM-NAME "CIM_DatabaseSegmentSettingData")
              (:QUALIFIERS (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Database::Storage")
               (:DESCRIPTION
                "This class defines the attributes that affect the growth of a DatabaseSegment. The attributes are tied to the DatabaseSegment through an ElementSettingData association. 
This class can also be used to specify the default settings for all DatabaseSegment instances that are created within a CommonDatabase through an ElementSettingData association to the CommonDatabase. Processes that create new instances of DatabaseSegment and the associated setting data should check for a DatabaseSegmentSettingData instance that is associated with the CommonDatabase and should create a new instance of DatabaseSegmentSettingData that is specific to the DatabaseSegment only if the default settings need to be overridden or frozen for the specific DatabaseSegment instance.")))