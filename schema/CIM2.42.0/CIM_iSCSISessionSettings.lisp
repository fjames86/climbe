
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_iSCSISessionSettings.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ISCSISESSIONSETTINGS (CIM_SETTINGDATA)
              ((MAXCONNECTIONSPERSESSION UINT32 :CIM-NAME
                "MaxConnectionsPerSession" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The maximum number of connections allowed in each session to and/or from this node.")
                 (:MIN-VALUE "1") (:MAX-VALUE "65535")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|iSCSI-MIB.iscsiNodeMaxConnections"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_iSCSISession.MaxConnectionsPerSession")))
                :INITFORM "1")
               (INITIALR2TPREFERENCE BOOLEAN :CIM-NAME "InitialR2TPreference"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "This property indicates the InitialR2T preference for this node: true = YES, false = will try to negotiate NO, will accept YES.")
                 (:MAPPING-STRINGS ("MIB.IETF|iSCSI-MIB.iscsiNodeInitialR2T"))
                 (:MODEL-CORRESPONDENCE ("CIM_iSCSISession.InitialR2T")))
                :INITFORM "true")
               (IMMEDIATEDATAPREFERENCE BOOLEAN :CIM-NAME
                "ImmediateDataPreference" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "This property indicates ImmediateData preference for this node True = YES (but will accept NO), False = NO.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|iSCSI-MIB.iscsiNodeImmediateData"))
                 (:MODEL-CORRESPONDENCE ("CIM_iSCSISession.ImmediateData")))
                :INITFORM "true")
               (MAXOUTSTANDINGR2T UINT32 :CIM-NAME "MaxOutstandingR2T"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "Maximum number of outstanding R2Ts allowed per ISCSI task.")
                 (:MIN-VALUE "1") (:MAX-VALUE "65535")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|iSCSI-MIB.iscsiNodeMaxOutstandingR2T"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_iSCSISession.MaxOutstandingR2T")))
                :INITFORM "1")
               (MAXUNSOLICITEDFIRSTDATABURSTLENGTH UINT32 :CIM-NAME
                "MaxUnsolicitedFirstDataBurstLength" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The maximum length (bytes) supported for unsolicited data to/from this node.")
                 (NIL "Bytes") (:MIN-VALUE "512") (:MAX-VALUE "16777215")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|iSCSI-MIB.iscsiNodeFirstBurstLength"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_iSCSISession.MaxUnsolicitedFirstDataBurstLength")))
                :INITFORM "65536")
               (MAXDATABURSTLENGTH UINT32 :CIM-NAME "MaxDataBurstLength"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The maximum number of bytes which can be sent within a single sequence of Data-In or Data-Out PDUs.")
                 (NIL "Bytes") (:MIN-VALUE "512") (:MAX-VALUE "16777215")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|iSCSI-MIB.iscsiNodeMaxBurstLength"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_iSCSISession.MaxDataBurstLength")))
                :INITFORM "262144")
               (DATASEQUENCEINORDERPREFERENCE BOOLEAN :CIM-NAME
                "DataSequenceInOrderPreference" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The DataSequenceInOrder preference of this node. False (=No) indicates that iSCSI data PDU sequences MAY be transferred in any order. True (=Yes) indicates that data PDU sequences MUST be transferred using continuously increasing offsets, except during error recovery.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|iSCSI-MIB.iscsiNodeDataSequenceInOrder"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_iSCSISession.DataSequenceInOrder")))
                :INITFORM "true")
               (DATAPDUINORDERPREFERENCE BOOLEAN :CIM-NAME
                "DataPDUInOrderPreference" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The DataPDUInOrder preference of this node. False (=No) indicates that iSCSI data PDUs within sequences MAY be in any order. True (=Yes) indicates that data PDUs within sequences MUST be at continuously increasing addresses, with no gaps or overlay between PDUs.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|iSCSI-MIB.iscsiNodeDataPDUInOrder"))
                 (:MODEL-CORRESPONDENCE ("CIM_iSCSISession.DataPDUInOrder")))
                :INITFORM "true")
               (DEFAULTTIMETOWAITPREFERENCE UINT32 :CIM-NAME
                "DefaultTimeToWaitPreference" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The DefaultTime2Wait preference of this node. This is the minimum time, in seconds, to wait before attempting an explicit/implicit logout or active iSCSI task reassignment after an unexpected connection termination or a connection reset.")
                 (NIL "Seconds") (:MIN-VALUE "0") (:MAX-VALUE "3600")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|iSCSI-MIB.iscsiNodeDefaultTime2Wait"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_iSCSISession.DefaultTimeToWait")))
                :INITFORM "2")
               (DEFAULTTIMETORETAINPREFERENCE UINT32 :CIM-NAME
                "DefaultTimeToRetainPreference" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The DefaultTime2Retain preference of this node. This is the maximum time, in seconds after an initial wait (Time2Wait), before which an active iSCSI task reassignment is still possible after an unexpected connection termination or a connection reset.")
                 (NIL "Seconds") (:MIN-VALUE "0") (:MAX-VALUE "3600")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|iSCSI-MIB.iscsiNodeDefaultTime2Retain"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_iSCSISession.DefaultTimeToRetain")))
                :INITFORM "20")
               (ERRORRECOVERYLEVELPREFERENCE UINT32 :CIM-NAME
                "ErrorRecoveryLevelPreference" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The ErrorRecoveryLevel preference of this node. Currently, only 0-2 are valid. This is designed to accommodate future error recover levels. 
Higher error recovery levels imply support in addition to support for the lower error level functions. In other words, error level 2 implies support for levels 0-1, since those functions are subsets of error level 2.")
                 (:MIN-VALUE "0") (:MAX-VALUE "255")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|iSCSI-MIB.iscsiNodeErrorRecoveryLevel"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_iSCSISession.ErrorRecoveryLevel")))
                :INITFORM "0")
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
              (:CIM-NAME "CIM_iSCSISessionSettings")
              (:QUALIFIERS (:VERSION "2.11.0")
               (:UML-PACKAGE-PATH "CIM::Network::iSCSI")
               (:DESCRIPTION
                "The default negotiation settings for an iSCSI Session. These properties are used as the starting position for login negotiations between initiator and target nodes. The properties describing the resulting outcome of the login negotiation are in the iSCSISession class. Depending on a given implementation an instance of iSCSISessionSettings will be associated by ElementSettingData to one or more instances of iSCSIProtocolEndpoint, SCSIProtocolController, or ComputerSystem.")))