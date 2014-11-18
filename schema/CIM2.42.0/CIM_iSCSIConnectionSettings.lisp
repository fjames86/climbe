
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_iSCSIConnectionSettings.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ISCSICONNECTIONSETTINGS (CIM_SETTINGDATA)
              ((MAXRECEIVEDATASEGMENTLENGTH UINT32 :CIM-NAME
                "MaxReceiveDataSegmentLength" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The maximum PDU length this portal can receive. This MAY be constrained by hardware characteristics and individual implementations MAY choose not to allow this property to be changed.")
                 (NIL "Bytes") (:MIN-VALUE "512") (:MAX-VALUE "16777215")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|iSCSI-MIB.iscsiPortalMaxRecvDataSegLength"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_iSCSIConnection.MaxReceiveDataSegmentLength")))
                :INITFORM "8192")
               (PRIMARYHEADERDIGESTMETHOD UINT16 :CIM-NAME
                "PrimaryHeaderDigestMethod" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION "The preferred header digest for this portal.")
                 (:VALUE-MAP ("1" "2" "3"))
                 (:VALUES ("Other" "No Digest" "CRC32C"))
                 (:MAPPING-STRINGS
                  ("MIB.IETF|iSCSI-MIB.iscsiPortalPrimaryHdrDigest"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_iSCSIConnection.HeaderDigestMethod"
                   "CIM_iSCSIConnectionSettings.OtherPrimaryHeaderDigestMethod")))
                :INITFORM "3")
               (OTHERPRIMARYHEADERDIGESTMETHOD STRING :CIM-NAME
                "OtherPrimaryHeaderDigestMethod" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "A string describing the preferred Header Digest method when PrimaryHeaderDigestMethod is equal to the value 1, \"Other\".")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_iSCSIConnection.OtherHeaderDigestMethod"
                   "CIM_iSCSIConnectionSettings.PrimaryHeaderDigestMethod")))
                :INITFORM NIL)
               (PRIMARYDATADIGESTMETHOD UINT16 :CIM-NAME
                "PrimaryDataDigestMethod" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The preferred data digest method for this portal.")
                 (:VALUE-MAP ("1" "2" "3"))
                 (:VALUES ("Other" "No Digest" "CRC32C"))
                 (:MAPPING-STRINGS
                  ("MIB.IETF|iSCSI-MIB.iscsiPortalPrimaryDataDigest"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_iSCSIConnection.DataDigestMethod"
                   "CIM_iSCSIConnectionSettings.OtherPrimaryDataDigestMethod")))
                :INITFORM "3")
               (OTHERPRIMARYDATADIGESTMETHOD STRING :CIM-NAME
                "OtherPrimaryDataDigestMethod" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "A string describing the preferred Data Digest method when PrimaryDataDigestMethod is equal to the value 1, \"Other\".")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_iSCSIConnection.OtherDataDigestMethod"
                   "CIM_iSCSIConnectionSettings.PrimaryDataDigestMethod")))
                :INITFORM NIL)
               (SECONDARYHEADERDIGESTMETHOD UINT16 :CIM-NAME
                "SecondaryHeaderDigestMethod" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The secondary header digest preference for this portal.")
                 (:VALUE-MAP ("1" "2" "3" "4"))
                 (:VALUES
                  ("Other" "No Digest" "CRC32C" "No Secondary Preference"))
                 (:MAPPING-STRINGS
                  ("MIB.IETF|iSCSI-MIB.iscsiPortalSecondaryHdrDigest"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_iSCSIConnection.HeaderDigestMethod"
                   "CIM_iSCSIConnectionSettings.OtherSecondaryHeaderDigestMethod")))
                :INITFORM "2")
               (OTHERSECONDARYHEADERDIGESTMETHOD STRING :CIM-NAME
                "OtherSecondaryHeaderDigestMethod" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "A string describing the alternate Header Digest method preference when SecondaryHeaderDigestMethod is equal to the value 1, \"Other\".")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_iSCSIConnection.OtherHeaderDigestMethod"
                   "CIM_iSCSIConnectionSettings.SecondaryHeaderDigestMethod")))
                :INITFORM NIL)
               (SECONDARYDATADIGESTMETHOD UINT16 :CIM-NAME
                "SecondaryDataDigestMethod" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The secondary data digest preference for this portal.")
                 (:VALUE-MAP ("1" "2" "3" "4"))
                 (:VALUES
                  ("Other" "No Digest" "CRC32C" "No Secondary Preference"))
                 (:MAPPING-STRINGS
                  ("MIB.IETF|iSCSI-MIB.iscsiPortalSecondaryDataDigest"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_iSCSIConnection.DataDigestMethod"
                   "CIM_iSCSIConnectionSettings.OtherSecondaryDataDigestMethod")))
                :INITFORM "2")
               (OTHERSECONDARYDATADIGESTMETHOD STRING :CIM-NAME
                "OtherSecondaryDataDigestMethod" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "A string describing the alternate Data Digest method preference when SecondaryDataDigestMethod is equal to the value 1, \"Other\".")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_iSCSIConnection.OtherDataDigestMethod"
                   "CIM_iSCSIConnectionSettings.SecondaryDataDigestMethod")))
                :INITFORM NIL)
               (REQUESTINGMARKERSONRECEIVE BOOLEAN :CIM-NAME
                "RequestingMarkersOnReceive" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "This property indicates whether or not this portal will request markers in it's incoming data stream.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|iSCSI-MIB.iscsiPortalRecvMarker"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_iSCSIConnection.ReceivingMarkers")))
                :INITFORM "false")
               (PRIMARYAUTHENTICATIONMETHOD UINT16 :CIM-NAME
                "PrimaryAuthenticationMethod" :QUALIFIERS
                ((:DESCRIPTION
                  "The preferred primary authentication method for connections, as communicated during the login phase.")
                 (:VALUE-MAP ("2" "3" "4" "5" "6"))
                 (:VALUES ("None" "No Authentication" "SRP" "CHAP" "Kerberos"))
                 (:MAPPING-STRINGS
                  ("MIB.IETF|IPS-AUTH-MIB.ipsAuthCredAuthMethod"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_iSCSICapabilities.AuthenticationMethodsSupported"
                   "CIM_iSCSIConnectionSettings.SecondaryAuthenticationMethod"
                   "CIM_iSCSIConnection.AuthenticationMethodUsed")))
                :INITFORM "5")
               (SECONDARYAUTHENTICATIONMETHOD UINT16 :CIM-NAME
                "SecondaryAuthenticationMethod" :QUALIFIERS
                ((:DESCRIPTION
                  "The preferred secondary authentication method for connections, as communicated during the login phase.")
                 (:VALUE-MAP ("2" "3" "4" "5" "6"))
                 (:VALUES ("None" "No Authentication" "SRP" "CHAP" "Kerberos"))
                 (:MAPPING-STRINGS
                  ("MIB.IETF|IPS-AUTH-MIB.ipsAuthCredAuthMethod"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_iSCSICapabilities.AuthenticationMethodsSupported"
                   "CIM_iSCSIConnectionSettings.PrimaryAuthenticationMethod"
                   "CIM_iSCSIConnection.AuthenticationMethodUsed")))
                :INITFORM "3")
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
              (:CIM-NAME "CIM_iSCSIConnectionSettings")
              (:QUALIFIERS (:VERSION "2.11.0")
               (:UML-PACKAGE-PATH "CIM::Network::iSCSI")
               (:DESCRIPTION
                "The settings for the usage of an iSCSI NetworkPortal by an iSCSIProtcolEndpoint. These settings are the starting point for negotiation for connection establishment. If an implmentation supports different connections settings for a NetworkPortal for each iSCSIProtocolEndpoint that is bound to it, an instance of this class will be associated by ElementSettingData to an instance of iSCSIProtocolEndpoint. If an implementation supports the same connection settings for a NetworkPortal for all iSCSIProtocolEndpoints then an instance of this class will be associated by ElementSettingData to an instance of either TCPProtocolEndpoint (When the NetworkPortal is a target) or IPProtocolEndpoint (When the NetworkPortal is an initiator). The properties that reflect the actual outcome of the negotiation are found in the iSCSIConnection class.")))