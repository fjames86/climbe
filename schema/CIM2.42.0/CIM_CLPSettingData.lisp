
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_CLPSettingData.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CLPSETTINGDATA (CIM_SETTINGDATA)
              ((CURRENTDEFAULTTARGET STRING :CIM-NAME "CurrentDefaultTarget"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Identifies the initial Current Default Target when a CLP Session is established. The Current Default Target is the CLP session environment setting that establishes a default base address for all command targets that are expressed as a relative target address and is used as the command target if no command target is specified in a command. The CLP specification requires this value to be fixed at the root of the address space being managed. Therefore this value does not have a write qualifier.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_CLPProtocolEndpoint.CurrentDefaultTarget")))
                :INITFORM NIL)
               (KEEPTIME UINT16 :CIM-NAME "KeepTime" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "Establishes the amount of time in seconds that the CLP Session should retain a CLP command job status. A KeepTime value of zero shall be interpreted to mean keep forever.")
                 (NIL "Seconds")
                 (:MODEL-CORRESPONDENCE ("CIM_CLPProtocolEndpoint.KeepTime"))
                 (:P-UNIT "second"))
                :INITFORM NIL)
               (WAITBEHAVIOR BOOLEAN :CIM-NAME "WaitBehavior" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "When TRUE the CLP Session will not return a command response until all spawned jobs have completed, otherwise it may.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_CLPProtocolEndpoint.WaitBehavior")))
                :INITFORM NIL)
               (OUTPUTFORMAT UINT16 :CIM-NAME "OutputFormat" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "OutputFormat establishes the default CLP Session command output format, as described in SM CLP Specification, DMTF document DSP0214.")
                 (:VALUE-MAP ("2" "3" "4" "5" ".." "0x8000..0xFFFF"))
                 (:VALUES
                  ("Text" "clpcsv" "Keyword" "clpxml" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_CLPProtocolEndpoint.OutputFormat")))
                :INITFORM NIL)
               (OUTPUTVERBOSITY UINT16 :CIM-NAME "OutputVerbosity" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "OutputVerbosity establishes the default CLP Session output level of detail, as described in SM CLP Specification, DMTF document DSP0214.")
                 (:VALUE-MAP ("2" "3" "4" ".." "0x8000..0xFFFF"))
                 (:VALUES
                  ("Error" "Terse" "Verbose" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_CLPProtocolEndpoint.OutputVerbosity")))
                :INITFORM NIL)
               (OUTPUTLANGUAGE STRING :CIM-NAME "OutputLanguage" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "Establishes the default CLP Session command output language. As described in SM CLP Specification, DMTF document DSP0214, the language value is a 3-character string identifier of language as specified in ISO 639.2; \"eng\" is the default."))
                :INITFORM NIL)
               (OUTPUTPOSITION UINT16 :CIM-NAME "OutputPosition" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "OutputPosition establishes the default CLP Session command output beginning position when multiple items are returned in the command output, as described in SM CLP Specification, DMTF document DSP0214.")
                 (:VALUE-MAP ("2" "3" ".." "0x8000..0xFFFF"))
                 (:VALUES ("Begin" "End" "DMTF Reserved" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_CLPProtocolEndpoint.OutputPosition")))
                :INITFORM NIL)
               (OUTPUTORDER UINT16 :CIM-NAME "OutputOrder" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "OutputOrder establishes the default CLP Session command output order when multiple items are returned in the command output as described in SM CLP Specification, DMTF document DSP0214.")
                 (:VALUE-MAP ("2" "3" ".." "0x8000..0xFFFF"))
                 (:VALUES
                  ("Default" "Reverse" "DMTF Reserved" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_CLPProtocolEndpoint.OutputOrder")))
                :INITFORM NIL)
               (OUTPUTCOUNT UINT32 :CIM-NAME "OutputCount" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "Establishes the default CLP Session command output count number when multiple items are returned in the output as described in SM CLP Specification, DMTF document DSP0214. The value 0xFFFFFFFF shall be interpreted to mean that all items are to be returned. The maximum value for the count number is determined by the class of the target.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_CLPProtocolEndpoint.OutputCount")))
                :INITFORM NIL)
               (DISPLAYOPTION STRING :CIM-NAME "DisplayOption" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "Establishes the default value for the display option. The argument string is stored \"as-is\" without normalization beyond capitalization. The argument string is compliant with the SM CLP command line grammar.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_CLPProtocolEndpoint.DisplayOption")))
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
              (:CIM-NAME "CIM_CLPSettingData")
              (:QUALIFIERS (:VERSION "2.22.0")
               (:UML-PACKAGE-PATH "CIM::Network::ProtocolEndpoints")
               (:DESCRIPTION
                "A representation of the SettingData of a CLProtocol. The relationship between the SettingData and the CLP Service is described by instantiating the ProvidesEndpoint association, with an association to the transport (TelnetProtocolEndpoint or SSHProtocolEndpoint) with a BindsTo association.")))