
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_CLPProtocolEndpoint.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CLPPROTOCOLENDPOINT (CIM_PROTOCOLENDPOINT)
              ((CURRENTDEFAULTTARGET STRING :CIM-NAME "CurrentDefaultTarget"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "Identifies the Current Default Target when a CLP Session is established. The Current Default Target is the CLP session environment setting that establishes a default base address for all command targets that are expressed as a relative target address and is used as the command target if no command target is specified in a command.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_CLPSettingData.CurrentDefaultTarget")))
                :INITFORM NIL)
               (KEEPTIME UINT16 :CIM-NAME "KeepTime" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The amount of time in seconds that the CLP Session should retain a CLP command job status. A KeepTime value of zero shall be interpreted to mean keep forever.")
                 (NIL "Seconds")
                 (:MODEL-CORRESPONDENCE ("CIM_CLPSettingData.KeepTime"))
                 (:P-UNIT "second"))
                :INITFORM NIL)
               (WAITBEHAVIOR BOOLEAN :CIM-NAME "WaitBehavior" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "When TRUE the CLP Session will not return a command response until all spawned jobs have completed, otherwise it may.")
                 (:MODEL-CORRESPONDENCE ("CIM_CLPSettingData.WaitBehavior")))
                :INITFORM NIL)
               (OUTPUTFORMAT UINT16 :CIM-NAME "OutputFormat" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "OutputFormat establishes the default CLP Session command output format, as described in SM CLP Specification, DMTF document DSP0214.")
                 (:VALUE-MAP ("2" "3" "4" "5" ".." "0x8000..0xFFFF"))
                 (:VALUES
                  ("Text" "clpcsv" "Keyword" "clpxml" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE ("CIM_CLPSettingData.OutputFormat")))
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
                  ("CIM_CLPSettingData.OutputVerbosity")))
                :INITFORM NIL)
               (OUTPUTLANGUAGE STRING :CIM-NAME "OutputLanguage" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The default CLP Session command output language. As described in SM CLP Specification, DMTF document DSP0214, the language value is a 3-character string identifier of language as specified in ISO 639.2; \"eng\" is the default.")
                 (:MODEL-CORRESPONDENCE ("CIM_CLPSettingData.OutputLanguage")))
                :INITFORM NIL)
               (OUTPUTPOSITION UINT16 :CIM-NAME "OutputPosition" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "OutputPosition establishes the default CLP Session command output beginning position when multiple items are returned in the command output, as described in SM CLP Specification, DMTF document DSP0214.")
                 (:VALUE-MAP ("2" "3" ".." "0x8000..0xFFFF"))
                 (:VALUES ("Begin" "End" "DMTF Reserved" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE ("CIM_CLPSettingData.OutputPosition")))
                :INITFORM NIL)
               (OUTPUTORDER UINT16 :CIM-NAME "OutputOrder" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "OutputOrder establishes the default CLP Session command output order when multiple items are returned in the command output as described in SM CLP Specification, DMTF document DSP0214.")
                 (:VALUE-MAP ("2" "3" ".." "0x8000..0xFFFF"))
                 (:VALUES
                  ("Default" "Reverse" "DMTF Reserved" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE ("CIM_CLPSettingData.OutputOrder")))
                :INITFORM NIL)
               (OUTPUTCOUNT UINT32 :CIM-NAME "OutputCount" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "Establishes the default CLP Session command output count number when multiple items are returned in the output as described in SM CLP Specification, DMTF document DSP0214. The value 0xFFFFFFFF shall be interpreted to mean that all items are to be returned. The maximum value for the count number is determined by the class of the target.")
                 (:MODEL-CORRESPONDENCE ("CIM_CLPSettingData.OutputCount")))
                :INITFORM NIL)
               (DISPLAYOPTION STRING :CIM-NAME "DisplayOption" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "Maintains the session default value for the display option. The argument string is stored \"as-is\" without normalization beyond capitalization. The argument string is compliant with the SM CLP command line grammar.")
                 (:MODEL-CORRESPONDENCE ("CIM_CLPSettingData.DisplayOption")))
                :INITFORM NIL)
               (DESCRIPTION STRING :CIM-NAME "Description" :QUALIFIERS
                ((:OVERRIDE "Description")
                 (:MAPPING-STRINGS ("MIB.IETF|IF-MIB.ifDescr"))
                 (:DESCRIPTION
                  "The Description property provides a textual description of the object."))
                :INITFORM NIL)
               (ENABLEDSTATE UINT16 :CIM-NAME "EnabledState" :QUALIFIERS
                ((:OVERRIDE "EnabledState")
                 (:MAPPING-STRINGS ("MIB.IETF|IF-MIB.ifAdminStatus"))
                 (:DESCRIPTION
                  "EnabledState is an integer enumeration that indicates the enabled and disabled states of an element. It can also indicate the transitions between these requested states. For example, shutting down (value=4) and starting (value=10) are transient states between enabled and disabled. The following text briefly summarizes the various enabled and disabled states: 
Enabled (2) indicates that the element is or could be executing commands, will process any queued commands, and queues new requests. 
Disabled (3) indicates that the element will not execute commands and will drop any new requests. 
Shutting Down (4) indicates that the element is in the process of going to a Disabled state. 
Not Applicable (5) indicates the element does not support being enabled or disabled. 
Enabled but Offline (6) indicates that the element might be completing commands, and will drop any new requests. 
Test (7) indicates that the element is in a test state. 
Deferred (8) indicates that the element might be completing commands, but will queue any new requests. 
Quiesce (9) indicates that the element is enabled but in a restricted mode.
Starting (10) indicates that the element is in the process of going to an Enabled state. New requests are queued.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11..32767"
                   "32768..65535"))
                 (:VALUES
                  ("Unknown" "Other" "Enabled" "Disabled" "Shutting Down"
                   "Not Applicable" "Enabled but Offline" "In Test" "Deferred"
                   "Quiesce" "Starting" "DMTF Reserved" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.OtherEnabledState")))
                :INITFORM NIL)
               (TIMEOFLASTSTATECHANGE DATETIME :CIM-NAME
                "TimeOfLastStateChange" :QUALIFIERS
                ((:OVERRIDE "TimeOfLastStateChange")
                 (:MAPPING-STRINGS ("MIB.IETF|IF-MIB.ifLastChange"))
                 (:DESCRIPTION
                  "The date or time when the EnabledState of the element last changed. If the state of the element has not changed and this property is populated, then it must be set to a 0 interval value. If a state change was requested, but rejected or not yet processed, the property must not be updated."))
                :INITFORM NIL)
               (NAME STRING :CIM-NAME "Name" :QUALIFIERS
                ((:OVERRIDE "Name")
                 (:DESCRIPTION
                  "A string that identifies this ProtocolEndpoint with either a port or an interface on a device. To ensure uniqueness, the Name property should be prepended or appended with information from the Type or OtherTypeDescription properties. The method selected is described in the NameFormat property of this class.")
                 (:MAX-LEN "256") :KEY)
                :INITFORM NIL)
               (NAMEFORMAT STRING :CIM-NAME "NameFormat" :QUALIFIERS
                ((:DESCRIPTION
                  "NameFormat contains the naming heuristic that is selected to ensure that the value of the Name property is unique. For example, you might choose to prepend the name of the port or interface with the Type of ProtocolEndpoint (for example, IPv4) of this instance followed by an underscore.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (PROTOCOLTYPE UINT16 :CIM-NAME "ProtocolType" :QUALIFIERS
                ((:DEPRECATED ("CIM_ProtocolEndpoint.ProtocolIFType"))
                 (:DESCRIPTION
                  "Note: This property is deprecated in lieu of the ProtocolIFType enumeration. This deprecation was done to have better alignment between the IF-MIB of the IETF and this CIM class. 
Deprecated description: ProtocolType is an enumeration that provides information to categorize and classify different instances of this class. For most instances, information in this enumeration and the definition of the subclass overlap. However, there are several cases where a specific subclass of ProtocolEndpoint is not required (for example, there is no Fibre Channel subclass of ProtocolEndpoint). Therefore, this property is needed to define the type of Endpoint.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25"
                   "26" "27"))
                 (:VALUES
                  ("Unknown" "Other" "IPv4" "IPv6" "IPX" "AppleTalk" "DECnet"
                   "SNA" "CONP" "CLNP" "VINES" "XNS" "ATM" "Frame Relay"
                   "Ethernet" "TokenRing" "FDDI" "Infiniband" "Fibre Channel"
                   "ISDN BRI Endpoint" "ISDN B Channel Endpoint"
                   "ISDN D Channel Endpoint" "IPv4/v6" "BGP" "OSPF" "MPLS"
                   "UDP" "TCP"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ProtocolEndpoint.OtherTypeDescription")))
                :INITFORM NIL)
               (PROTOCOLIFTYPE UINT16 :CIM-NAME "ProtocolIFType" :QUALIFIERS
                ((:DESCRIPTION
                  "ProtocolIFType is an enumeration that is synchronized with the IANA ifType MIB. The ifType MIB is maintained at the URL, http://www.iana.org/assignments/ianaiftype-mib. Also, additional values defined by the DMTF are included. The property is used to categorize and classify instances of the ProtocolEndpoint class. Note that if the ProtocolIFType is set to 1 (Other), then the type information should be provided in the OtherTypeDescription string property.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25"
                   "26" "27" "28" "29" "30" "31" "32" "33" "34" "35" "36" "37"
                   "38" "39" "40" "41" "42" "43" "44" "45" "46" "47" "48" "49"
                   "50" "51" "52" "53" "54" "55" "56" "57" "58" "59" "60" "61"
                   "62" "63" "64" "65" "66" "67" "68" "69" "70" "71" "72" "73"
                   "74" "75" "76" "77" "78" "79" "80" "81" "82" "83" "84" "85"
                   "86" "87" "88" "89" "90" "91" "92" "93" "94" "95" "96" "97"
                   "98" "99" "100" "101" "102" "103" "104" "105" "106" "107"
                   "108" "109" "110" "111" "112" "113" "114" "115" "116" "117"
                   "118" "119" "120" "121" "122" "123" "124" "125" "126" "127"
                   "128" "129" "130" "131" "132" "133" "134" "135" "136" "137"
                   "138" "139" "140" "141" "142" "143" "144" "145" "146" "147"
                   "148" "149" "150" "151" "152" "153" "154" "155" "156" "157"
                   "158" "159" "160" "161" "162" "163" "164" "165" "166" "167"
                   "168" "169" "170" "171" "172" "173" "174" "175" "176" "177"
                   "178" "179" "180" "181" "182" "183" "184" "185" "186" "187"
                   "188" "189" "190" "191" "192" "193" "194" "195" "196" "197"
                   "198" "199" "200" "201" "202" "203" "204" "205" "206" "207"
                   "208" "209" "210" "211" "212" "213" "214" "215" "216" "217"
                   "218" "219" "220" "221" "222" "223" "224" "225..4095" "4096"
                   "4097" "4098" "4099" "4100" "4101" "4102" "4103" "4104"
                   "4105" "4106" "4107" "4108" "4109" "4110" "4111" "4112"
                   "4113" "4114" "4115" "4200" "4201" "4202" "4203" "4204"
                   "4205" "4300" "4400" "4401" "4402" "4403" "4404" "4405"
                   "4406" ".." "32768.."))
                 (:VALUES
                  ("Unknown" "Other" "Regular 1822" "HDH 1822" "DDN X.25"
                   "RFC877 X.25" "Ethernet CSMA/CD" "ISO 802.3 CSMA/CD"
                   "ISO 802.4 Token Bus" "ISO 802.5 Token Ring" "ISO 802.6 MAN"
                   "StarLAN" "Proteon 10Mbit" "Proteon 80Mbit" "HyperChannel"
                   "FDDI" "LAP-B" "SDLC" "DS1" "E1" "Basic ISDN" "Primary ISDN"
                   "Proprietary Point-to-Point Serial" "PPP"
                   "Software Loopback" "EON" "Ethernet 3Mbit" "NSIP" "SLIP"
                   "Ultra" "DS3" "SIP" "Frame Relay" "RS-232" "Parallel"
                   "ARCNet" "ARCNet Plus" "ATM" "MIO X.25" "SONET" "X.25 PLE"
                   "ISO 802.211c" "LocalTalk" "SMDS DXI" "Frame Relay Service"
                   "V.35" "HSSI" "HIPPI" "Modem" "AAL5" "SONET Path" "SONET VT"
                   "SMDS ICIP" "Proprietary Virtual/Internal"
                   "Proprietary Multiplexor" "IEEE 802.12" "Fibre Channel"
                   "HIPPI Interface" "Frame Relay Interconnect"
                   "ATM Emulated LAN for 802.3" "ATM Emulated LAN for 802.5"
                   "ATM Emulated Circuit" "Fast Ethernet (100BaseT)" "ISDN"
                   "V.11" "V.36" "G703 at 64K" "G703 at 2Mb" "QLLC"
                   "Fast Ethernet 100BaseFX" "Channel" "IEEE 802.11"
                   "IBM 260/370 OEMI Channel" "ESCON" "Data Link Switching"
                   "ISDN S/T Interface" "ISDN U Interface" "LAP-D" "IP Switch"
                   "Remote Source Route Bridging" "ATM Logical" "DS0"
                   "DS0 Bundle" "BSC" "Async" "Combat Net Radio"
                   "ISO 802.5r DTR" "Ext Pos Loc Report System"
                   "AppleTalk Remote Access Protocol"
                   "Proprietary Connectionless" "ITU X.29 Host PAD"
                   "ITU X.3 Terminal PAD" "Frame Relay MPI" "ITU X.213" "ADSL"
                   "RADSL" "SDSL" "VDSL" "ISO 802.5 CRFP" "Myrinet"
                   "Voice Receive and Transmit" "Voice Foreign Exchange Office"
                   "Voice Foreign Exchange Service" "Voice Encapsulation"
                   "Voice over IP" "ATM DXI" "ATM FUNI" "ATM IMA"
                   "PPP Multilink Bundle" "IP over CDLC" "IP over CLAW"
                   "Stack to Stack" "Virtual IP Address" "MPC" "IP over ATM"
                   "ISO 802.5j Fibre Token Ring" "TDLC" "Gigabit Ethernet"
                   "HDLC" "LAP-F" "V.37" "X.25 MLP" "X.25 Hunt Group"
                   "Transp HDLC" "Interleave Channel" "FAST Channel"
                   "IP (for APPN HPR in IP Networks)" "CATV MAC Layer"
                   "CATV Downstream" "CATV Upstream" "Avalon 12MPP Switch"
                   "Tunnel" "Coffee" "Circuit Emulation Service"
                   "ATM SubInterface" "Layer 2 VLAN using 802.1Q"
                   "Layer 3 VLAN using IP" "Layer 3 VLAN using IPX"
                   "Digital Power Line" "Multimedia Mail over IP" "DTM" "DCN"
                   "IP Forwarding" "MSDSL" "IEEE 1394" "IF-GSN/HIPPI-6400"
                   "DVB-RCC MAC Layer" "DVB-RCC Downstream" "DVB-RCC Upstream"
                   "ATM Virtual" "MPLS Tunnel" "SRP" "Voice over ATM"
                   "Voice over Frame Relay" "ISDL" "Composite Link"
                   "SS7 Signaling Link" "Proprietary P2P Wireless"
                   "Frame Forward" "RFC1483 Multiprotocol over ATM" "USB"
                   "IEEE 802.3ad Link Aggregate" "BGP Policy Accounting"
                   "FRF .16 Multilink FR" "H.323 Gatekeeper" "H.323 Proxy"
                   "MPLS" "Multi-Frequency Signaling Link" "HDSL-2" "S-HDSL"
                   "DS1 Facility Data Link" "Packet over SONET/SDH"
                   "DVB-ASI Input" "DVB-ASI Output" "Power Line"
                   "Non Facility Associated Signaling" "TR008" "GR303 RDT"
                   "GR303 IDT" "ISUP" "Proprietary Wireless MAC Layer"
                   "Proprietary Wireless Downstream"
                   "Proprietary Wireless Upstream" "HIPERLAN Type 2"
                   "Proprietary Broadband Wireless Access Point to Mulipoint"
                   "SONET Overhead Channel" "Digital Wrapper Overhead Channel"
                   "ATM Adaptation Layer 2" "Radio MAC" "ATM Radio"
                   "Inter Machine Trunk" "MVL DSL" "Long Read DSL"
                   "Frame Relay DLCI Endpoint" "ATM VCI Endpoint"
                   "Optical Channel" "Optical Transport" "Proprietary ATM"
                   "Voice over Cable" "Infiniband" "TE Link" "Q.2931"
                   "Virtual Trunk Group" "SIP Trunk Group" "SIP Signaling"
                   "CATV Upstream Channel" "Econet" "FSAN 155Mb PON"
                   "FSAN 622Mb PON" "Transparent Bridge" "Line Group"
                   "Voice E&M Feature Group" "Voice FGD EANA" "Voice DID"
                   "MPEG Transport" "6To4" "GTP" "Paradyne EtherLoop 1"
                   "Paradyne EtherLoop 2" "Optical Channel Group" "HomePNA"
                   "GFP" "ciscoISLvlan" "actelisMetaLOOP" "Fcip"
                   "IANA Reserved" "IPv4" "IPv6" "IPv4/v6" "IPX" "DECnet" "SNA"
                   "CONP" "CLNP" "VINES" "XNS" "ISDN B Channel Endpoint"
                   "ISDN D Channel Endpoint" "BGP" "OSPF" "UDP" "TCP" "802.11a"
                   "802.11b" "802.11g" "802.11h" "NFS" "CIFS" "DAFS" "WebDAV"
                   "HTTP" "FTP" "NDMP" "Telnet" "SSH" "SM CLP" "SMTP" "LDAP"
                   "RDP" "HTTPS" "DMTF Reserved" "Vendor Reserved"))
                 (:MAPPING-STRINGS ("MIB.IETF|IF-MIB.ifType"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ProtocolEndpoint.OtherTypeDescription")))
                :INITFORM NIL)
               (OTHERTYPEDESCRIPTION STRING :CIM-NAME "OtherTypeDescription"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A string that describes the type of ProtocolEndpoint when the Type property of this class (or any of its subclasses) is set to 1 (Other). This property should be set to null when the Type property is any value other than 1.")
                 (:MAX-LEN "64")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ProtocolEndpoint.ProtocolType"
                   "CIM_ProtocolEndpoint.ProtocolIFType")))
                :INITFORM NIL)
               (SYSTEMCREATIONCLASSNAME STRING :CIM-NAME
                "SystemCreationClassName" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION "The CreationClassName of the scoping System.")
                 (:MAX-LEN "256") (:PROPOGATED "CIM_System.CreationClassName"))
                :INITFORM NIL)
               (SYSTEMNAME STRING :CIM-NAME "SystemName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The Name of the scoping System.")
                 (:MAX-LEN "256") (:PROPOGATED "CIM_System.Name"))
                :INITFORM NIL)
               (CREATIONCLASSNAME STRING :CIM-NAME "CreationClassName"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "CreationClassName indicates the name of the class or the subclass used in the creation of an instance. When used with the other key properties of this class, this property allows all instances of this class and its subclasses to be uniquely identified.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (OTHERENABLEDSTATE STRING :CIM-NAME "OtherEnabledState"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A string that describes the enabled or disabled state of the element when the EnabledState property is set to 1 (\"Other\"). This property must be set to null when EnabledState is any value other than 1.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.EnabledState")))
                :INITFORM NIL)
               (REQUESTEDSTATE UINT16 :CIM-NAME "RequestedState" :QUALIFIERS
                ((:DESCRIPTION
                  "RequestedState is an integer enumeration that indicates the last requested or desired state for the element, irrespective of the mechanism through which it was requested. The actual state of the element is represented by EnabledState. This property is provided to compare the last requested and current enabled or disabled states. Note that when EnabledState is set to 5 (\"Not Applicable\"), then this property has no meaning. Refer to the EnabledState property description for explanations of the values in the RequestedState enumeration. 
\"Unknown\" (0) indicates the last requested state for the element is unknown.
Note that the value \"No Change\" (5) has been deprecated in lieu of indicating the last requested state is \"Unknown\" (0). If the last requested or desired state is unknown, RequestedState should have the value \"Unknown\" (0), but may have the value \"No Change\" (5).Offline (6) indicates that the element has been requested to transition to the Enabled but Offline EnabledState. 
It should be noted that there are two new values in RequestedState that build on the statuses of EnabledState. These are \"Reboot\" (10) and \"Reset\" (11). Reboot refers to doing a \"Shut Down\" and then moving to an \"Enabled\" state. Reset indicates that the element is first \"Disabled\" and then \"Enabled\". The distinction between requesting \"Shut Down\" and \"Disabled\" should also be noted. Shut Down requests an orderly transition to the Disabled state, and might involve removing power, to completely erase any existing state. The Disabled state requests an immediate disabling of the element, such that it will not execute or accept any commands or processing requests. 

This property is set as the result of a method invocation (such as Start or StopService on CIM_Service), or can be overridden and defined as WRITEable in a subclass. The method approach is considered superior to a WRITEable property, because it allows an explicit invocation of the operation and the return of a result code. 

If knowledge of the last RequestedState is not supported for the EnabledLogicalElement, the property shall be NULL or have the value 12 \"Not Applicable\".")
                 (:VALUE-MAP
                  ("0" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" ".."
                   "32768..65535"))
                 (:VALUES
                  ("Unknown" "Enabled" "Disabled" "Shut Down" "No Change"
                   "Offline" "Test" "Deferred" "Quiesce" "Reboot" "Reset"
                   "Not Applicable" "DMTF Reserved" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.EnabledState")))
                :INITFORM "12")
               (ENABLEDDEFAULT UINT16 :CIM-NAME "EnabledDefault" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "An enumerated value indicating an administrator's default or startup configuration for the Enabled State of an element. By default, the element is \"Enabled\" (value=2).")
                 (:VALUE-MAP ("2" "3" "5" "6" "7" "9" ".." "32768..65535"))
                 (:VALUES
                  ("Enabled" "Disabled" "Not Applicable" "Enabled but Offline"
                   "No Default" "Quiesce" "DMTF Reserved" "Vendor Reserved")))
                :INITFORM "2")
               (TRANSITIONINGTOSTATE UINT16 :CIM-NAME "TransitioningToState"
                :QUALIFIERS
                ((:DESCRIPTION
                  "TransitioningToState indicates the target state to which the instance is transitioning. 
A value of 5 \"No Change\" shall indicate that no transition is in progress.A value of 12 \"Not Applicable\" shall indicate the implementation does not support representing ongoing transitions. 
A value other than 5 or 12 shall identify the state to which the element is in the process of transitioning.")
                 (:VALUE-MAP
                  ("0" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" ".."))
                 (:VALUES
                  ("Unknown" "Enabled" "Disabled" "Shut Down" "No Change"
                   "Offline" "Test" "Defer" "Quiesce" "Reboot" "Reset"
                   "Not Applicable" "DMTF Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.RequestStateChange"
                   "CIM_EnabledLogicalElement.RequestedState"
                   "CIM_EnabledLogicalElement.EnabledState")))
                :INITFORM "12")
               (INSTALLDATE DATETIME :CIM-NAME "InstallDate" :QUALIFIERS
                ((:DESCRIPTION
                  "A datetime value that indicates when the object was installed. Lack of a value does not indicate that the object is not installed.")
                 (:MAPPING-STRINGS ("MIF.DMTF|ComponentID|001.5")))
                :INITFORM NIL)
               (STATUS STRING :CIM-NAME "Status" :QUALIFIERS
                ((:DEPRECATED ("CIM_ManagedSystemElement.OperationalStatus"))
                 (:DESCRIPTION
                  "A string indicating the current status of the object. Various operational and non-operational statuses are defined. This property is deprecated in lieu of OperationalStatus, which includes the same semantics in its enumeration. This change is made for 3 reasons: 
1) Status is more correctly defined as an array. This definition overcomes the limitation of describing status using a single value, when it is really a multi-valued property (for example, an element might be OK AND Stopped. 
2) A MaxLen of 10 is too restrictive and leads to unclear enumerated values. 
3) The change to a uint16 data type was discussed when CIM V2.0 was defined. However, existing V1.0 implementations used the string property and did not want to modify their code. Therefore, Status was grandfathered into the Schema. Use of the deprecated qualifier allows the maintenance of the existing property, but also permits an improved definition using OperationalStatus.")
                 (:VALUE-MAP
                  ("OK" "Error" "Degraded" "Unknown" "Pred Fail" "Starting"
                   "Stopping" "Service" "Stressed" "NonRecover" "No Contact"
                   "Lost Comm" "Stopped"))
                 (:MAX-LEN "10"))
                :INITFORM NIL)
               (HEALTHSTATE UINT16 :CIM-NAME "HealthState" :QUALIFIERS
                ((:DESCRIPTION
                  "Indicates the current health of the element. This attribute expresses the health of this element but not necessarily that of its subcomponents. The possible values are 0 to 30, where 5 means the element is entirely healthy and 30 means the element is completely non-functional. The following continuum is defined: 
\"Non-recoverable Error\" (30) - The element has completely failed, and recovery is not possible. All functionality provided by this element has been lost. 
\"Critical Failure\" (25) - The element is non-functional and recovery might not be possible. 
\"Major Failure\" (20) - The element is failing. It is possible that some or all of the functionality of this component is degraded or not working. 
\"Minor Failure\" (15) - All functionality is available but some might be degraded. 
\"Degraded/Warning\" (10) - The element is in working order and all functionality is provided. However, the element is not working to the best of its abilities. For example, the element might not be operating at optimal performance or it might be reporting recoverable errors. 
\"OK\" (5) - The element is fully functional and is operating within normal operational parameters and without error. 
\"Unknown\" (0) - The implementation cannot report on HealthState at this time. 
DMTF has reserved the unused portion of the continuum for additional HealthStates in the future.")
                 (:VALUE-MAP
                  ("0" "5" "10" "15" "20" "25" "30" ".." "32768..65535"))
                 (:VALUES
                  ("Unknown" "OK" "Degraded/Warning" "Minor failure"
                   "Major failure" "Critical failure" "Non-recoverable error"
                   "DMTF Reserved" "Vendor Specific")))
                :INITFORM NIL)
               (COMMUNICATIONSTATUS UINT16 :CIM-NAME "CommunicationStatus"
                :QUALIFIERS
                ((:DESCRIPTION
                  "CommunicationStatus indicates the ability of the instrumentation to communicate with the underlying ManagedElement. CommunicationStatus consists of one of the following values: Unknown, None, Communication OK, Lost Communication, or No Contact. 
A Null return indicates the implementation (provider) does not implement this property. 
\"Unknown\" indicates the implementation is in general capable of returning this property, but is unable to do so at this time. 
\"Not Available\" indicates that the implementation (provider) is capable of returning a value for this property, but not ever for this particular piece of hardware/software or the property is intentionally not used because it adds no meaningful information (as in the case of a property that is intended to add additional info to another property). 
\"Communication OK \" indicates communication is established with the element, but does not convey any quality of service. 
\"No Contact\" indicates that the monitoring system has knowledge of this element, but has never been able to establish communications with it. 
\"Lost Communication\" indicates that the Managed Element is known to exist and has been contacted successfully in the past, but is currently unreachable.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" ".." "0x8000.."))
                 (:VALUES
                  ("Unknown" "Not Available" "Communication OK"
                   "Lost Communication" "No Contact" "DMTF Reserved"
                   "Vendor Reserved")))
                :INITFORM NIL)
               (DETAILEDSTATUS UINT16 :CIM-NAME "DetailedStatus" :QUALIFIERS
                ((:DESCRIPTION
                  "DetailedStatus compliments PrimaryStatus with additional status detail. It consists of one of the following values: Not Available, No Additional Information, Stressed, Predictive Failure, Error, Non-Recoverable Error, SupportingEntityInError. Detailed status is used to expand upon the PrimaryStatus of the element. 
A Null return indicates the implementation (provider) does not implement this property. 
\"Not Available\" indicates that the implementation (provider) is capable of returning a value for this property, but not ever for this particular piece of hardware/software or the property is intentionally not used because it adds no meaningful information (as in the case of a property that is intended to add additional info to another property). 
\"No Additional Information\" indicates that the element is functioning normally as indicated by PrimaryStatus = \"OK\". 
\"Stressed\" indicates that the element is functioning, but needs attention. Examples of \"Stressed\" states are overload, overheated, and so on. 
\"Predictive Failure\" indicates that an element is functioning normally but a failure is predicted in the near future. 
\"Non-Recoverable Error \" indicates that this element is in an error condition that requires human intervention. 
\"Supporting Entity in Error\" indicates that this element might be \"OK\" but that another element, on which it is dependent, is in error. An example is a network service or endpoint that cannot function due to lower-layer networking problems.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" ".." "0x8000.."))
                 (:VALUES
                  ("Not Available" "No Additional Information" "Stressed"
                   "Predictive Failure" "Non-Recoverable Error"
                   "Supporting Entity in Error" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.PrimaryStatus"
                   "CIM_ManagedSystemElement.HealthState")))
                :INITFORM NIL)
               (OPERATINGSTATUS UINT16 :CIM-NAME "OperatingStatus" :QUALIFIERS
                ((:DESCRIPTION
                  "OperatingStatus provides a current status value for the operational condition of the element and can be used for providing more detail with respect to the value of EnabledState. It can also provide the transitional states when an element is transitioning from one state to another, such as when an element is transitioning between EnabledState and RequestedState, as well as other transitional conditions.
OperatingStatus consists of one of the following values: Unknown, Not Available, In Service, Starting, Stopping, Stopped, Aborted, Dormant, Completed, Migrating, Emmigrating, Immigrating, Snapshotting. Shutting Down, In Test 
A Null return indicates the implementation (provider) does not implement this property. 
\"Unknown\" indicates the implementation is in general capable of returning this property, but is unable to do so at this time. 
\"None\" indicates that the implementation (provider) is capable of returning a value for this property, but not ever for this particular piece of hardware/software or the property is intentionally not used because it adds no meaningful information (as in the case of a property that is intended to add additional info to another property). 
\"Servicing\" describes an element being configured, maintained, cleaned, or otherwise administered. 
\"Starting\" describes an element being initialized. 
\"Stopping\" describes an element being brought to an orderly stop. 
\"Stopped\" and \"Aborted\" are similar, although the former implies a clean and orderly stop, while the latter implies an abrupt stop where the state and configuration of the element might need to be updated. 
\"Dormant\" indicates that the element is inactive or quiesced. 
\"Completed\" indicates that the element has completed its operation. This value should be combined with either OK, Error, or Degraded in the PrimaryStatus so that a client can tell if the complete operation Completed with OK (passed), Completed with Error (failed), or Completed with Degraded (the operation finished, but it did not complete OK or did not report an error). 
\"Migrating\" element is being moved between host elements. 
\"Immigrating\" element is being moved to new host element. 
\"Emigrating\" element is being moved away from host element. 
\"Shutting Down\" describes an element being brought to an abrupt stop. 
\"In Test\" element is performing test functions. 
\"Transitioning\" describes an element that is between states, that is, it is not fully available in either its previous state or its next state. This value should be used if other values indicating a transition to a specific state are not applicable.
\"In Service\" describes an element that is in service and operational.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" ".." "0x8000.."))
                 (:VALUES
                  ("Unknown" "Not Available" "Servicing" "Starting" "Stopping"
                   "Stopped" "Aborted" "Dormant" "Completed" "Migrating"
                   "Emigrating" "Immigrating" "Snapshotting" "Shutting Down"
                   "In Test" "Transitioning" "In Service" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.EnabledState")))
                :INITFORM NIL)
               (PRIMARYSTATUS UINT16 :CIM-NAME "PrimaryStatus" :QUALIFIERS
                ((:DESCRIPTION
                  "PrimaryStatus provides a high level status value, intended to align with Red-Yellow-Green type representation of status. It should be used in conjunction with DetailedStatus to provide high level and detailed health status of the ManagedElement and its subcomponents. 
PrimaryStatus consists of one of the following values: Unknown, OK, Degraded or Error. \"Unknown\" indicates the implementation is in general capable of returning this property, but is unable to do so at this time. 
\"OK\" indicates the ManagedElement is functioning normally. 
\"Degraded\" indicates the ManagedElement is functioning below normal. 
\"Error\" indicates the ManagedElement is in an Error condition.")
                 (:VALUE-MAP ("0" "1" "2" "3" ".." "0x8000.."))
                 (:VALUES
                  ("Unknown" "OK" "Degraded" "Error" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ManagedSystemElement.DetailedStatus"
                   "CIM_ManagedSystemElement.HealthState")))
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
               (ELEMENTNAME STRING :CIM-NAME "ElementName" :QUALIFIERS
                ((:DESCRIPTION
                  "A user-friendly name for the object. This property allows each instance to define a user-friendly name in addition to its key properties, identity data, and description information. 
Note that the Name property of ManagedSystemElement is also defined as a user-friendly name. But, it is often subclassed to be a Key. It is not reasonable that the same property can convey both identity and a user-friendly name, without inconsistencies. Where Name exists and is not a Key (such as for instances of LogicalDevice), the same information can be present in both the Name and ElementName properties. Note that if there is an associated instance of CIM_EnabledLogicalElementCapabilities, restrictions on this properties may exist as defined in ElementNameMask and MaxElementNameLen properties defined in that class."))
                :INITFORM NIL)
               (OPERATIONALSTATUS (ARRAY UINT16) :CIM-NAME "OperationalStatus"
                :QUALIFIERS
                ((:OVERRIDE "OperationalStatus")
                 (:MAPPING-STRINGS ("MIB.IETF|IF-MIB.ifOperStatus"))
                 (:DESCRIPTION
                  "Indicates the current statuses of the element. Various operational statuses are defined. Many of the enumeration's values are self-explanatory. However, a few are not and are described here in more detail. 
\"Stressed\" indicates that the element is functioning, but needs attention. Examples of \"Stressed\" states are overload, overheated, and so on. 
\"Predictive Failure\" indicates that an element is functioning nominally but predicting a failure in the near future. 
\"In Service\" describes an element being configured, maintained, cleaned, or otherwise administered. 
\"No Contact\" indicates that the monitoring system has knowledge of this element, but has never been able to establish communications with it. 
\"Lost Communication\" indicates that the ManagedSystem Element is known to exist and has been contacted successfully in the past, but is currently unreachable. 
\"Stopped\" and \"Aborted\" are similar, although the former implies a clean and orderly stop, while the latter implies an abrupt stop where the state and configuration of the element might need to be updated. 
\"Dormant\" indicates that the element is inactive or quiesced. 
\"Supporting Entity in Error\" indicates that this element might be \"OK\" but that another element, on which it is dependent, is in error. An example is a network service or endpoint that cannot function due to lower-layer networking problems. 
\"Completed\" indicates that the element has completed its operation. This value should be combined with either OK, Error, or Degraded so that a client can tell if the complete operation Completed with OK (passed), Completed with Error (failed), or Completed with Degraded (the operation finished, but it did not complete OK or did not report an error). 
\"Power Mode\" indicates that the element has additional power model information contained in the Associated PowerManagementService association. 
\"Relocating\" indicates the element is being relocated.
OperationalStatus replaces the Status property on ManagedSystemElement to provide a consistent approach to enumerations, to address implementation needs for an array property, and to provide a migration path from today's environment to the future. This change was not made earlier because it required the deprecated qualifier. Due to the widespread use of the existing Status property in management applications, it is strongly recommended that providers or instrumentation provide both the Status and OperationalStatus properties. Further, the first value of OperationalStatus should contain the primary status for the element. When instrumented, Status (because it is single-valued) should also provide the primary status of the element.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" "17" "18" "19" ".." "0x8000.."))
                 (:VALUES
                  ("Unknown" "Other" "OK" "Degraded" "Stressed"
                   "Predictive Failure" "Error" "Non-Recoverable Error"
                   "Starting" "Stopping" "Stopped" "In Service" "No Contact"
                   "Lost Communication" "Aborted" "Dormant"
                   "Supporting Entity in Error" "Completed" "Power Mode"
                   "Relocating" "DMTF Reserved" "Vendor Reserved"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ManagedSystemElement.StatusDescriptions")))
                :INITFORM NIL)
               (AVAILABLEREQUESTEDSTATES (ARRAY UINT16) :CIM-NAME
                "AvailableRequestedStates" :QUALIFIERS
                ((:DESCRIPTION
                  "AvailableRequestedStates indicates the possible values for the RequestedState parameter of the method RequestStateChange, used to initiate a state change. The values listed shall be a subset of the values contained in the RequestedStatesSupported property of the associated instance of CIM_EnabledLogicalElementCapabilities where the values selected are a function of the current state of the CIM_EnabledLogicalElement. This property may be non-null if an implementation is able to advertise the set of possible values as a function of the current state. This property shall be null if an implementation is unable to determine the set of possible values as a function of the current state.")
                 (:VALUE-MAP ("2" "3" "4" "6" "7" "8" "9" "10" "11" ".."))
                 (:VALUES
                  ("Enabled" "Disabled" "Shut Down" "Offline" "Test" "Defer"
                   "Quiesce" "Reboot" "Reset" "DMTF Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.RequestStateChange"
                   "CIM_EnabledLogicalElementCapabilities.RequestedStatesSupported")))
                :INITFORM NIL)
               (STATUSDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "StatusDescriptions" :QUALIFIERS
                ((:DESCRIPTION
                  "Strings describing the various OperationalStatus array values. For example, if \"Stopping\" is the value assigned to OperationalStatus, then this property may contain an explanation as to why an object is being stopped. Note that entries in this array are correlated with those at the same array index in OperationalStatus.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ManagedSystemElement.OperationalStatus")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_CLPProtocolEndpoint")
              (:QUALIFIERS (:VERSION "2.22.0")
               (:UML-PACKAGE-PATH "CIM::Network::ProtocolEndpoints")
               (:DESCRIPTION
                "A representation of a communication endpoint where the CLP protocol may be accessed.")))
(DEFCIM-METHOD REQUESTSTATECHANGE
    ((INSTANCE CIM_CLPPROTOCOLENDPOINT)
     (REQUESTEDSTATE UINT16 "RequestedState" :IN
      (:DESCRIPTION
       "The state requested for the element. This information will be placed into the RequestedState property of the instance if the return code of the RequestStateChange method is 0 ('Completed with No Error'), or 4096 (0x1000) ('Job Started'). Refer to the description of the EnabledState and RequestedState properties for the detailed explanations of the RequestedState values.")
      (:VALUE-MAP ("2" "3" "4" "6" "7" "8" "9" "10" "11" ".." "32768..65535"))
      (:VALUES
       ("Enabled" "Disabled" "Shut Down" "Offline" "Test" "Defer" "Quiesce"
        "Reboot" "Reset" "DMTF Reserved" "Vendor Reserved"))
      (:MODEL-CORRESPONDENCE ("CIM_EnabledLogicalElement.RequestedState")))
     (TIMEOUTPERIOD DATETIME "TimeoutPeriod" :IN
      (:DESCRIPTION
       "A timeout period that specifies the maximum amount of time that the client expects the transition to the new state to take. The interval format must be used to specify the TimeoutPeriod. A value of 0 or a null parameter indicates that the client has no time requirements for the transition. 
If this property does not contain 0 or null and the implementation does not support this parameter, a return code of 'Use Of Timeout Parameter Not Supported' shall be returned."))
     (JOB "CIM_ConcreteJob" "Job" :IN :OUT
      (:DESCRIPTION
       "May contain a reference to the ConcreteJob created to track the state transition initiated by the method invocation.")))
    ((:CIM-NAME "RequestStateChange")
     (:QUALIFIERS
      (:DESCRIPTION
       "Requests that the state of the element be changed to the value specified in the RequestedState parameter. When the requested state change takes place, the EnabledState and RequestedState of the element will be the same. Invoking the RequestStateChange method multiple times could result in earlier requests being overwritten or lost. 
A return code of 0 shall indicate the state change was successfully initiated. 
A return code of 3 shall indicate that the state transition cannot complete within the interval specified by the TimeoutPeriod parameter. 
A return code of 4096 (0x1000) shall indicate the state change was successfully initiated, a ConcreteJob has been created, and its reference returned in the output parameter Job. Any other return code indicates an error condition.")
      (:VALUE-MAP
       ("0" "1" "2" "3" "4" "5" "6" ".." "4096" "4097" "4098" "4099"
        "4100..32767" "32768..65535"))
      (:VALUES
       ("Completed with No Error" "Not Supported"
        "Unknown or Unspecified Error" "Cannot complete within Timeout Period"
        "Failed" "Invalid Parameter" "In Use" "DMTF Reserved"
        "Method Parameters Checked - Job Started" "Invalid State Transition"
        "Use of Timeout Parameter Not Supported" "Busy" "Method Reserved"
        "Vendor Specific"))
      (:MODEL-CORRESPONDENCE ("CIM_EnabledLogicalElement.RequestedState")))))