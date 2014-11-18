
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_VirtualSystemMigrationSettingData.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_VIRTUALSYSTEMMIGRATIONSETTINGDATA (CIM_SETTINGDATA)
              ((MIGRATIONTYPE UINT16 :CIM-NAME "MigrationType" :QUALIFIERS
                ((:DESCRIPTION
                  "MigrationType describes a type of migration operation to be performed.
A value of 2 - Virtual System is to be migrated in a 'live' manner such that the running of the Virtual System is minimally impacted during the move.
A value of 3 - Virtual System will be temporarily paused prior to migration and then resume running after it is moved.
A value of 4 - The Virtual System will be quiesced to a stopped state prior to migration and then restarted after it is moved.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4"))
                 (:VALUES ("Unknown" "Other" "Live" "Resume" "Restart")))
                :INITFORM NIL)
               (PRIORITY UINT16 :CIM-NAME "Priority" :QUALIFIERS
                ((:DESCRIPTION
                  "Priority specifies a relative migration importance which the virtual system migration implementation may use to order or otherwise give preference among multiple pending migration requests. The lower the value, the higher the priority. A value of 0 indicates:
- in migration requests the default priority
- otherwise that priorities are not supported"))
                :INITFORM NIL)
               (BANDWIDTH UINT16 :CIM-NAME "Bandwidth" :QUALIFIERS
                ((:DESCRIPTION
                  "Bandwidth indicates the bandwidth assigned to or requested for a virtual system migration operation. The special value 0 indicates:
- in migration requests the default bandwidth
- otherwise that bandwidths are not supported.
Bandwidth and Priority may be used in conjunction. Migration processes that have the highest equal priority value share the available bandwidth based on their requested bandwidth. If not all bandwidth is consumed by this set of processes, migration processes with the next lower equal priority share the remaining bandwidth. If still more bandwidth remains, migration processes with the next lower equal priority are considered, and so forth.
The unit applicable for the Bandwidth property is conveyed by the value of the BandwidthUnit property. If the value of the BandwidthUnit property matches \"percent\", the following restrictions apply: 
The value of the Bandwidth property shall be between 0 and 100, with higher values indicating a higher bandwidth. A value of 100 indicates the total available bandwidth for performing virtual system migration operations. Values between 1 and 100 should linearly correlate with the available bandwidth range. For exampe, a value of 50 should request half of the available bandwidth, a value of 33 should request one third of the bandwidth, etc. .")
                 :GAUGE
                 (:MODEL-CORRESPONDENCE
                  ("CIM_VirtualSystemMigrationSettingData.BandwidthUnit")))
                :INITFORM NIL)
               (BANDWIDTHUNIT STRING :CIM-NAME "BandwidthUnit" :QUALIFIERS
                ((:DESCRIPTION
                  "This property specifies the unit used by the Bandwidth property. The value of this property shall be a legal value of the Programmatic Units qualifier as defined in Appendix C.1 of DSP0004 V2.4 or later.
NOTE: Profiles like DMTF DSP1081 define means by that clients are enabled to discover the set of units supported by an implementation, along with ranges and increments for admissable values of the Bandwidth property.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_VirtualSystemMigrationSettingData.Bandwidth"))
                 :IS-P-UNIT)
                :INITFORM NIL)
               (OTHERTRANSPORTTYPE STRING :CIM-NAME "OtherTransportType"
                :QUALIFIERS
                ((:DESCRIPTION
                  "OtherTransportType indicates the type of transport to be applied if the value of TransportType is 1 (Other).")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_VirtualSystemMigrationSettingData.TransportType")))
                :INITFORM NIL)
               (TRANSPORTTYPE UINT16 :CIM-NAME "TransportType" :QUALIFIERS
                ((:DESCRIPTION
                  "TransportType indicates the type of transport to be applied for a virtual system migration operation.
- 0(Unknown) indicates that the transport type is not exposed.- 1(Other) indicates that the transport type is specified as a textual value of the OtherTransportType property.
- 2(SSH) indicates the secure shell transport type.
- 3(TLS) indicats the transport layer security transport type.
- 4(TLS strict) indicats the transport layer security transport type with mutual authentication.
- 5(TCP) indicates the TCP transport type.
- 6(IPC) indicates the inter-process communication socket transport type. This transport type includes Unix domain sockets.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6" ".." "32768.."))
                 (:VALUES
                  ("Unknown" "Other" "SSH" "TLS" "TLS Strict" "TCP" "IPC"
                   "DMTF Reserved" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_VirtualSystemMigrationSettingData.OtherTransportType")))
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
              (:CIM-NAME "CIM_VirtualSystemMigrationSettingData")
              (:QUALIFIERS (:VERSION "2.33.0")
               (:UML-PACKAGE-PATH "CIM::System::Virtualization")
               (:DESCRIPTION
                "CIM_MigrationSettingData defines the parameters to control a virtual system migration implementation, as managed by a CIM_VirtualSystemMigrationService. It is expected that a migration implementation will subclass this class to add implementation-specific migration options.")))