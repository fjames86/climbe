
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ArchitectureCheck.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ARCHITECTURECHECK (CIM_CHECK)
              ((ARCHITECTURETYPE UINT16 :CIM-NAME "ArchitectureType"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The ArchitectureType property identifies a particular type of architecture or architectural family that is required to properly execute a particular SoftwareElement. The intent is to capture the details about the machine instructions exploited by the executables of the SoftwareElement.")
                 (:VALUE-MAP
                  ("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14"
                   "15" "16" "17" "18" "19" "20" "21" "24" "25" "26" "27" "28"
                   "29" "30" "31" "32" "33" "34" "35" "36" "37" "38" "39" "40"
                   "41" "42" "43" "44" "48" "49" "50" "51" "52" "53" "54" "55"
                   "56" "57" "58" "59" "60" "61" "62" "63" "64" "65" "66" "67"
                   "68" "69" "70" "71" "72" "73" "74" "75" "76" "77" "78" "79"
                   "80" "81" "82" "83" "84" "85" "86" "87" "88" "96" "97" "98"
                   "99" "100" "101" "102" "103" "104" "112" "120" "121" "122"
                   "128" "130" "131" "132" "133" "134" "135" "136" "137" "138"
                   "139" "140" "141" "142" "143" "144" "145" "146" "147" "148"
                   "149" "150" "160" "161" "162" "163" "164" "165" "166" "167"
                   "168" "169" "170" "171" "172" "173" "174" "175" "176" "177"
                   "178" "179" "180" "181" "182" "183" "184" "185" "186" "187"
                   "188" "189" "190" "191" "192" "193" "194" "195" "196" "197"
                   "198" "199" "200" "201" "202" "203" "204" "205" "206" "210"
                   "211" "212" "213" "214" "215" "216" "217" "218" "219" "221"
                   "222" "223" "224" "228" "229" "230" "231" "232" "233" "234"
                   "235" "236" "237" "238" "239" "250" "251" "254" "255" "260"
                   "261" "280" "281" "300" "301" "302" "320" "350" "500"
                   "65534" "65535"))
                 (:VALUES
                  ("Other" "Unknown" "8086" "80286" "80386" "80486" "8087"
                   "80287" "80387" "80487" "Pentium(R) brand" "Pentium(R) Pro"
                   "Pentium(R) II"
                   "Pentium(R) processor with MMX(TM) technology" "Celeron(TM)"
                   "Pentium(R) II Xeon(TM)" "Pentium(R) III" "M1 Family"
                   "M2 Family" "Intel(R) Celeron(R) M processor"
                   "Intel(R) Pentium(R) 4 HT processor" "K5 Family" "K6 Family"
                   "K6-2" "K6-3" "AMD Athlon(TM) Processor Family"
                   "AMD(R) Duron(TM) Processor" "AMD29000 Family" "K6-2+"
                   "Power PC Family" "Power PC 601" "Power PC 603"
                   "Power PC 603+" "Power PC 604" "Power PC 620"
                   "Power PC X704" "Power PC 750"
                   "Intel(R) Core(TM) Duo processor"
                   "Intel(R) Core(TM) Duo mobile processor"
                   "Intel(R) Core(TM) Solo mobile processor"
                   "Intel(R) Atom(TM) processor"
                   "Intel(R) Core(TM) M processor" "Alpha Family" "Alpha 21064"
                   "Alpha 21066" "Alpha 21164" "Alpha 21164PC" "Alpha 21164a"
                   "Alpha 21264" "Alpha 21364"
                   "AMD Turion(TM) II Ultra Dual-Core Mobile M Processor Family"
                   "AMD Turion(TM) II Dual-Core Mobile M Processor Family"
                   "AMD Athlon(TM) II Dual-Core Mobile M Processor Family"
                   "AMD Opteron(TM) 6100 Series Processor"
                   "AMD Opteron(TM) 4100 Series Processor"
                   "AMD Opteron(TM) 6200 Series Processor"
                   "AMD Opteron(TM) 4200 Series Processor"
                   "AMD FX(TM) Series Processor" "MIPS Family" "MIPS R4000"
                   "MIPS R4200" "MIPS R4400" "MIPS R4600" "MIPS R10000"
                   "AMD C-Series Processor" "AMD E-Series Processor"
                   "AMD A-Series Processor" "AMD G-Series Processor"
                   "AMD Z-Series Processor" "AMD R-Series Processor"
                   "AMD Opteron(TM) 4300 Series Processor"
                   "AMD Opteron(TM) 6300 Series Processor"
                   "AMD Opteron(TM) 3300 Series Processor"
                   "AMD FirePro(TM) Series Processor" "SPARC Family"
                   "SuperSPARC" "microSPARC II" "microSPARC IIep" "UltraSPARC"
                   "UltraSPARC II" "UltraSPARC IIi" "UltraSPARC III"
                   "UltraSPARC IIIi" "68040" "68xxx Family" "68000" "68010"
                   "68020" "68030"
                   "AMD Athlon(TM) X4 Quad-Core Processor Family"
                   "AMD Opteron(TM) X1000 Series Processor"
                   "AMD Opteron(TM) X2000 Series APU" "Hobbit Family"
                   "Crusoe(TM) TM5000 Family" "Crusoe(TM) TM3000 Family"
                   "Efficeon(TM) TM8000 Family" "Weitek"
                   "Itanium(TM) Processor" "AMD Athlon(TM) 64 Processor Family"
                   "AMD Opteron(TM) Processor Family"
                   "AMD Sempron(TM) Processor Family"
                   "AMD Turion(TM) 64 Mobile Technology"
                   "Dual-Core AMD Opteron(TM) Processor Family"
                   "AMD Athlon(TM) 64 X2 Dual-Core Processor Family"
                   "AMD Turion(TM) 64 X2 Mobile Technology"
                   "Quad-Core AMD Opteron(TM) Processor Family"
                   "Third-Generation AMD Opteron(TM) Processor Family"
                   "AMD Phenom(TM) FX Quad-Core Processor Family"
                   "AMD Phenom(TM) X4 Quad-Core Processor Family"
                   "AMD Phenom(TM) X2 Dual-Core Processor Family"
                   "AMD Athlon(TM) X2 Dual-Core Processor Family"
                   "PA-RISC Family" "PA-RISC 8500" "PA-RISC 8000"
                   "PA-RISC 7300LC" "PA-RISC 7200" "PA-RISC 7100LC"
                   "PA-RISC 7100" "V30 Family"
                   "Quad-Core Intel(R) Xeon(R) processor 3200 Series"
                   "Dual-Core Intel(R) Xeon(R) processor 3000 Series"
                   "Quad-Core Intel(R) Xeon(R) processor 5300 Series"
                   "Dual-Core Intel(R) Xeon(R) processor 5100 Series"
                   "Dual-Core Intel(R) Xeon(R) processor 5000 Series"
                   "Dual-Core Intel(R) Xeon(R) processor LV"
                   "Dual-Core Intel(R) Xeon(R) processor ULV"
                   "Dual-Core Intel(R) Xeon(R) processor 7100 Series"
                   "Quad-Core Intel(R) Xeon(R) processor 5400 Series"
                   "Quad-Core Intel(R) Xeon(R) processor"
                   "Dual-Core Intel(R) Xeon(R) processor 5200 Series"
                   "Dual-Core Intel(R) Xeon(R) processor 7200 Series"
                   "Quad-Core Intel(R) Xeon(R) processor 7300 Series"
                   "Quad-Core Intel(R) Xeon(R) processor 7400 Series"
                   "Multi-Core Intel(R) Xeon(R) processor 7400 Series"
                   "Pentium(R) III Xeon(TM)"
                   "Pentium(R) III Processor with Intel(R) SpeedStep(TM) Technology"
                   "Pentium(R) 4" "Intel(R) Xeon(TM)" "AS400 Family"
                   "Intel(R) Xeon(TM) processor MP" "AMD Athlon(TM) XP Family"
                   "AMD Athlon(TM) MP Family" "Intel(R) Itanium(R) 2"
                   "Intel(R) Pentium(R) M processor"
                   "Intel(R) Celeron(R) D processor"
                   "Intel(R) Pentium(R) D processor"
                   "Intel(R) Pentium(R) Processor Extreme Edition"
                   "Intel(R) Core(TM) Solo Processor" "K7"
                   "Intel(R) Core(TM)2 Duo Processor"
                   "Intel(R) Core(TM)2 Solo processor"
                   "Intel(R) Core(TM)2 Extreme processor"
                   "Intel(R) Core(TM)2 Quad processor"
                   "Intel(R) Core(TM)2 Extreme mobile processor"
                   "Intel(R) Core(TM)2 Duo mobile processor"
                   "Intel(R) Core(TM)2 Solo mobile processor"
                   "Intel(R) Core(TM) i7 processor"
                   "Dual-Core Intel(R) Celeron(R) Processor"
                   "S/390 and zSeries Family" "ESA/390 G4" "ESA/390 G5"
                   "ESA/390 G6" "z/Architectur base"
                   "Intel(R) Core(TM) i5 processor"
                   "Intel(R) Core(TM) i3 processor"
                   "VIA C7(TM)-M Processor Family"
                   "VIA C7(TM)-D Processor Family"
                   "VIA C7(TM) Processor Family"
                   "VIA Eden(TM) Processor Family"
                   "Multi-Core Intel(R) Xeon(R) processor"
                   "Dual-Core Intel(R) Xeon(R) processor 3xxx Series"
                   "Quad-Core Intel(R) Xeon(R) processor 3xxx Series"
                   "VIA Nano(TM) Processor Family"
                   "Dual-Core Intel(R) Xeon(R) processor 5xxx Series"
                   "Quad-Core Intel(R) Xeon(R) processor 5xxx Series"
                   "Dual-Core Intel(R) Xeon(R) processor 7xxx Series"
                   "Quad-Core Intel(R) Xeon(R) processor 7xxx Series"
                   "Multi-Core Intel(R) Xeon(R) processor 7xxx Series"
                   "Multi-Core Intel(R) Xeon(R) processor 3400 Series"
                   "AMD Opteron(TM) 3000 Series Processor"
                   "AMD Sempron(TM) II Processor Family"
                   "Embedded AMD Opteron(TM) Quad-Core Processor Family"
                   "AMD Phenom(TM) Triple-Core Processor Family"
                   "AMD Turion(TM) Ultra Dual-Core Mobile Processor Family"
                   "AMD Turion(TM) Dual-Core Mobile Processor Family"
                   "AMD Athlon(TM) Dual-Core Processor Family"
                   "AMD Sempron(TM) SI Processor Family"
                   "AMD Phenom(TM) II Processor Family"
                   "AMD Athlon(TM) II Processor Family"
                   "Six-Core AMD Opteron(TM) Processor Family"
                   "AMD Sempron(TM) M Processor Family" "i860" "i960"
                   "Reserved (SMBIOS Extension)"
                   "Reserved (Un-initialized Flash Content - Lo)" "SH-3" "SH-4"
                   "ARM" "StrongARM" "6x86" "MediaGX" "MII" "WinChip" "DSP"
                   "Video Processor"
                   "Reserved (For Future Special Purpose Assignment)"
                   "Reserved (Un-initialized Flash Content - Hi)"))
                 (:MAPPING-STRINGS ("MIF.DMTF|Processor|017.3"))
                 (:MODEL-CORRESPONDENCE ("CIM_Processor.Family")))
                :INITFORM NIL)
               (NAME STRING :CIM-NAME "Name" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The name used to identify the SoftwareElement that is being checked.")
                 (:MAX-LEN "256") (:PROPOGATED "CIM_SoftwareElement.Name"))
                :INITFORM NIL)
               (VERSION STRING :CIM-NAME "Version" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The version of the SoftwareElement being checked.")
                 (:MAX-LEN "64") (:PROPOGATED "CIM_SoftwareElement.Version"))
                :INITFORM NIL)
               (SOFTWAREELEMENTSTATE UINT16 :CIM-NAME "SoftwareElementState"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The SoftwareElementState of the SoftwareElement being checked.")
                 (:VALUE-MAP ("0" "1" "2" "3"))
                 (:VALUES ("Deployable" "Installable" "Executable" "Running"))
                 (:PROPOGATED "CIM_SoftwareElement.SoftwareElementState"))
                :INITFORM NIL)
               (SOFTWAREELEMENTID STRING :CIM-NAME "SoftwareElementID"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "This is an identifier for the SoftwareElement being checked.")
                 (:MAX-LEN "256")
                 (:PROPOGATED "CIM_SoftwareElement.SoftwareElementID"))
                :INITFORM NIL)
               (TARGETOPERATINGSYSTEM UINT16 :CIM-NAME "TargetOperatingSystem"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The Target Operating System of the SoftwareElement being checked.")
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
                   "108" "109" "110" "111" "113" "114" "115" "116"))
                 (:VALUES
                  ("Unknown" "Other" "MACOS" "ATTUNIX" "DGUX" "DECNT"
                   "Tru64 UNIX" "OpenVMS" "HPUX" "AIX" "MVS" "OS400" "OS/2"
                   "JavaVM" "MSDOS" "WIN3x" "WIN95" "WIN98" "WINNT" "WINCE"
                   "NCR3000" "NetWare" "OSF" "DC/OS" "Reliant UNIX"
                   "SCO UnixWare" "SCO OpenServer" "Sequent" "IRIX" "Solaris"
                   "SunOS" "U6000" "ASERIES" "HP NonStop OS" "HP NonStop OSS"
                   "BS2000" "LINUX" "Lynx" "XENIX" "VM" "Interactive UNIX"
                   "BSDUNIX" "FreeBSD" "NetBSD" "GNU Hurd" "OS9" "MACH Kernel"
                   "Inferno" "QNX" "EPOC" "IxWorks" "VxWorks" "MiNT" "BeOS"
                   "HP MPE" "NextStep" "PalmPilot" "Rhapsody" "Windows 2000"
                   "Dedicated" "OS/390" "VSE" "TPF" "Windows (R) Me"
                   "Caldera Open UNIX" "OpenBSD" "Not Applicable" "Windows XP"
                   "z/OS" "Microsoft Windows Server 2003"
                   "Microsoft Windows Server 2003 64-Bit" "Windows XP 64-Bit"
                   "Windows XP Embedded" "Windows Vista" "Windows Vista 64-Bit"
                   "Windows Embedded for Point of Service"
                   "Microsoft Windows Server 2008"
                   "Microsoft Windows Server 2008 64-Bit" "FreeBSD 64-Bit"
                   "RedHat Enterprise Linux" "RedHat Enterprise Linux 64-Bit"
                   "Solaris 64-Bit" "SUSE" "SUSE 64-Bit" "SLES" "SLES 64-Bit"
                   "Novell OES" "Novell Linux Desktop"
                   "Sun Java Desktop System" "Mandriva" "Mandriva 64-Bit"
                   "TurboLinux" "TurboLinux 64-Bit" "Ubuntu" "Ubuntu 64-Bit"
                   "Debian" "Debian 64-Bit" "Linux 2.4.x" "Linux 2.4.x 64-Bit"
                   "Linux 2.6.x" "Linux 2.6.x 64-Bit" "Linux 64-Bit"
                   "Other 64-Bit" "Microsoft Windows Server 2008 R2"
                   "VMware ESXi" "Microsoft Windows 7" "CentOS 32-bit"
                   "CentOS 64-bit" "Oracle Linux 32-bit" "Oracle Linux 64-bit"
                   "eComStation 32-bitx" "Microsoft Windows Server 2011"
                   "Microsoft Windows Server 2012" "Microsoft Windows 8"
                   "Microsoft Windows 8 64-bit"
                   "Microsoft Windows Server 2012 R2"))
                 (:PROPOGATED "CIM_SoftwareElement.TargetOperatingSystem"))
                :INITFORM NIL)
               (CHECKID STRING :CIM-NAME "CheckID" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "An identifier used in conjunction with other keys to uniquely identify the Check.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (CHECKMODE BOOLEAN :CIM-NAME "CheckMode" :QUALIFIERS
                ((:DESCRIPTION
                  "The CheckMode property is used to indicate whether the condition is expected to exist or not exist in the environment. When the value is True, the condition is expected to exist (e.g., a file is expected to be on a system), so the Invoke methods are expected to return True. When the value is False, the condition is not expected to exist (e.g., a file is not to be on a system), so the Invoke methods are expected to return False."))
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
              (:CIM-NAME "CIM_ArchitectureCheck")
              (:QUALIFIERS (:VERSION "2.19.0")
               (:UML-PACKAGE-PATH "CIM::Application::CheckAction")
               (:DESCRIPTION
                "ArchitectureCheck specifies the hardware platform on which a SoftwareElement can run. The details of this Check are compared with the information found in the CIM_Processor object, related to the CIM_ComputerSystem instance that describes the environment (related by the association, CIM_ComputerSystemProcessor). There should be at least one CIM_Processor that satisfies the details of the Check. In other words, all the processors on the relevant computer system do not need to satisfy the Check.")))
(DEFCIM-METHOD INVOKE
    ((INSTANCE CIM_ARCHITECTURECHECK))
    ((:CIM-NAME "Invoke")
     (:QUALIFIERS
      (:DESCRIPTION
       "The Invoke method evaluates this Check. The details of the evaluation are described by the specific subclasses of CIM_Check. When the SoftwareElement being checked is already installed, the CIM_InstalledSoftwareElement association identifies the CIM_ComputerSystem in whose context the Invoke is executed. If this association is not in place, then the InvokeOnSystem method should be used - since it identifies the TargetSystem as an input parameter of the method. 
The results of the Invoke method are based on the return value. A zero is returned if the condition is satisfied. A one is returned if the method is not supported. Any other value indicates the condition is not satisfied."))))
(DEFCIM-METHOD INVOKEONSYSTEM
    ((INSTANCE CIM_ARCHITECTURECHECK)
     (TARGETSYSTEM "CIM_ComputerSystem" "TargetSystem" :IN
      (:DESCRIPTION
       "Reference to ComputerSystem in whose context the method is to be invoked.")))
    ((:CIM-NAME "InvokeOnSystem")
     (:QUALIFIERS
      (:DESCRIPTION
       "The InvokeOnSystem method evaluates this Check. The details of the evaluation are described by the specific subclasses of CIM_Check. The method's TargetSystem input parameter specifies the ComputerSystem in whose context the method is invoked. 
The results of the InvokeOnSystem method are based on the return value. A zero is returned if the condition is satisfied. A one is returned if the method is not supported. Any other value indicates the condition is not satisfied."))))