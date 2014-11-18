
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PhysicalComputerSystemView.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PHYSICALCOMPUTERSYSTEMVIEW (CIM_VIEW)
              ((INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "InstanceID is the property that may be used to opaquely and uniquely identify an instance of this class within the scope of the instantiating Namespace."))
                :INITFORM NIL)
               (ENABLEDSTATE UINT16 :CIM-NAME "EnabledState" :QUALIFIERS
                ((:DESCRIPTION
                  "This property corresponds to the EnabledState property of the logical computer system represented by CIM_ComputerSystem. See CIM_EnabledLogicalElement.EnabledState for details on EnabledState.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11..32767"
                   "32768..65535"))
                 (:VALUES
                  ("Unknown" "Other" "Enabled" "Disabled" "Shutting Down"
                   "Not Applicable" "Enabled but Offline" "In Test" "Deferred"
                   "Quiesce" "Starting" "DMTF Reserved" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE ("CIM_ComputerSystem.EnabledState")))
                :INITFORM NIL)
               (REQUESTEDSTATE UINT16 :CIM-NAME "RequestedState" :QUALIFIERS
                ((:DESCRIPTION
                  "This property corresponds to the RequestedState property of the logical computer system represented by CIM_ComputerSystem. See CIM_EnabledLogicalElement.RequestedState for details on RequestedState.")
                 (:VALUE-MAP
                  ("0" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" ".."
                   "32768..65535"))
                 (:VALUES
                  ("Unknown" "Enabled" "Disabled" "Shut Down" "No Change"
                   "Offline" "Test" "Deferred" "Quiesce" "Reboot" "Reset"
                   "Not Applicable" "DMTF Reserved" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE ("CIM_ComputerSystem.RequestedState")))
                :INITFORM NIL)
               (HEALTHSTATE UINT16 :CIM-NAME "HealthState" :QUALIFIERS
                ((:DESCRIPTION
                  "This property corresponds to the HealthState property of the logical computer system represented by CIM_ComputerSystem. See CIM_ManagedSystemElement.HealthState for details.")
                 (:VALUE-MAP
                  ("0" "5" "10" "15" "20" "25" "30" ".." "32768..65535"))
                 (:VALUES
                  ("Unknown" "OK" "Degraded/Warning" "Minor failure"
                   "Major failure" "Critical failure" "Non-recoverable error"
                   "DMTF Reserved" "Vendor Specific"))
                 (:MODEL-CORRESPONDENCE ("CIM_ComputerSystem.HealthState")))
                :INITFORM NIL)
               (FRUINFOSUPPORTED BOOLEAN :CIM-NAME "FRUInfoSupported"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This property indicates the availability of the FRU Information on this physical computer system. See CIM_PhysicalAssetCapabilities.FRUInfoSupported for details.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PhysicalAssetCapabilities.FRUInfoSupported")))
                :INITFORM NIL)
               (TAG STRING :CIM-NAME "Tag" :QUALIFIERS
                ((:DESCRIPTION
                  "This property corresponds to CIM_PhysicalFrame.Tag. See CIM_PhysicalFrame.Tag for details.")
                 (:MODEL-CORRESPONDENCE ("CIM_PhysicalFrame.Tag")))
                :INITFORM NIL)
               (MANUFACTURER STRING :CIM-NAME "Manufacturer" :QUALIFIERS
                ((:DESCRIPTION
                  "This property corresponds to CIM_PhysicalFrame.Manufacturer. See CIM_PhysicalFrame.Manufacturer for details.")
                 (:MODEL-CORRESPONDENCE ("CIM_PhysicalFrame.Manufacturer")))
                :INITFORM NIL)
               (MODEL STRING :CIM-NAME "Model" :QUALIFIERS
                ((:DESCRIPTION
                  "This property corresponds to CIM_PhysicalFrame.Model. See CIM_PhysicalFrame.Model for details.")
                 (:MODEL-CORRESPONDENCE ("CIM_PhysicalFrame.Model")))
                :INITFORM NIL)
               (SKU STRING :CIM-NAME "SKU" :QUALIFIERS
                ((:DESCRIPTION
                  "This property corresponds to CIM_PhysicalFrame.SKU. See CIM_PhysicalFrame.SKU for details.")
                 (:MODEL-CORRESPONDENCE ("CIM_PhysicalFrame.SKU")))
                :INITFORM NIL)
               (SERIALNUMBER STRING :CIM-NAME "SerialNumber" :QUALIFIERS
                ((:DESCRIPTION
                  "This property corresponds to CIM_PhysicalFrame.SerialNumber. See CIM_PhysicalFrame.SerialNumber for details.")
                 (:MODEL-CORRESPONDENCE ("CIM_PhysicalFrame.SerialNumber")))
                :INITFORM NIL)
               (VERSION STRING :CIM-NAME "Version" :QUALIFIERS
                ((:DESCRIPTION
                  "This property corresponds to CIM_PhysicalFrame.Version. See CIM_PhysicalFrame.Version for details.")
                 (:MODEL-CORRESPONDENCE ("CIM_PhysicalFrame.Version")))
                :INITFORM NIL)
               (PARTNUMBER STRING :CIM-NAME "PartNumber" :QUALIFIERS
                ((:DESCRIPTION
                  "This property corresponds to CIM_PhysicalFrame.PartNumber. See CIM_PhysicalFrame.PartNumber for details.")
                 (:MODEL-CORRESPONDENCE ("CIM_PhysicalFrame.PartNumber")))
                :INITFORM NIL)
               (POWERUTILIZATIONMODE UINT16 :CIM-NAME "PowerUtilizationMode"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This property corresponds to the PowerUtilizationMode of the CIM_PowerUtilizationManagementService. See CIM_PowerUtilizationManagementService.PowerUtilizationMode for details.")
                 (:VALUE-MAP ("2" "3" "4" ".." "32768..65535"))
                 (:VALUES
                  ("None" "Dynamic" "Static" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PowerUtilizationManagementService.PowerUtilizationMode")))
                :INITFORM NIL)
               (POWERALLOCATIONLIMIT UINT64 :CIM-NAME "PowerAllocationLimit"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This property corresponds to CIM_PowerAllocationSettingData.Limit. See CIM_PowerAllocationSettingData.Limit for details.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PowerAllocationSettingData.Limit"))
                 (:P-UNIT "watt * 10^-3"))
                :INITFORM NIL)
               (ONETIMEBOOTSOURCE UINT8 :CIM-NAME "OneTimeBootSource"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This property identifies the boot source that is used for the next one-time boot. The value of this property is an index referencing an element in the array of StructuredBootString."))
                :INITFORM NIL)
               (NUMBEROFPROCESSORS UINT16 :CIM-NAME "NumberOfProcessors"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This property identifies the number of processors on this physical computer system."))
                :INITFORM NIL)
               (NUMBEROFPROCESSORCORES UINT16 :CIM-NAME
                "NumberOfProcessorCores" :QUALIFIERS
                ((:DESCRIPTION
                  "See CIM_ProcessorCapabilities.NumberOfProcessorCores for details.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ProcessorCapabilities.NumberOfProcessorCores")))
                :INITFORM NIL)
               (NUMBEROFPROCESSORTHREADS UINT16 :CIM-NAME
                "NumberOfProcessorThreads" :QUALIFIERS
                ((:DESCRIPTION
                  "See CIM_ProcessorCapabilities.NumberOfProcessorThreads for details.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ProcessorCapabilities.NumberOfHardwareThreads")))
                :INITFORM NIL)
               (PROCESSORFAMILY UINT16 :CIM-NAME "ProcessorFamily" :QUALIFIERS
                ((:DESCRIPTION "See CIM_Processor.Family for details.")
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
                 (:MODEL-CORRESPONDENCE ("CIM_Processor.Family")))
                :INITFORM NIL)
               (PROCESSORMAXCLOCKSPEED UINT32 :CIM-NAME
                "ProcessorMaxClockSpeed" :QUALIFIERS
                ((:DESCRIPTION "See CIM_Processor.MaxClockSpeed for details.")
                 (:MODEL-CORRESPONDENCE ("CIM_Processor.MaxClockSpeed"))
                 (:P-UNIT "hertz * 10^6"))
                :INITFORM NIL)
               (MEMORYBLOCKSIZE UINT64 :CIM-NAME "MemoryBlockSize" :QUALIFIERS
                ((:DESCRIPTION "See CIM_Memory.BlockSize for details.")
                 (:MODEL-CORRESPONDENCE ("CIM_Memory.BlockSize")))
                :INITFORM NIL)
               (MEMORYNUMBEROFBLOCKS UINT64 :CIM-NAME "MemoryNumberOfBlocks"
                :QUALIFIERS
                ((:DESCRIPTION "See CIM_Memory.NumberOfBlocks for details.")
                 (:MODEL-CORRESPONDENCE ("CIM_Memory.NumberOfBlocks")))
                :INITFORM NIL)
               (MEMORYCONSUMABLEBLOCKS UINT64 :CIM-NAME
                "MemoryConsumableBlocks" :QUALIFIERS
                ((:DESCRIPTION "See CIM_Memory.ConsumableBlocks for details.")
                 (:MODEL-CORRESPONDENCE ("CIM_Memory.ConsumableBlocks")))
                :INITFORM NIL)
               (CURRENTBIOSMAJORVERSION UINT16 :CIM-NAME
                "CurrentBIOSMajorVersion" :QUALIFIERS
                ((:DESCRIPTION
                  "The major number component of the current BIOS version information.")
                 (:MODEL-CORRESPONDENCE ("CIM_SoftwareIdentity.MajorVersion")))
                :INITFORM NIL)
               (CURRENTBIOSMINORVERSION UINT16 :CIM-NAME
                "CurrentBIOSMinorVersion" :QUALIFIERS
                ((:DESCRIPTION
                  "The minor number component of the current BIOS version information.")
                 (:MODEL-CORRESPONDENCE ("CIM_SoftwareIdentity.MinorVersion")))
                :INITFORM NIL)
               (CURRENTBIOSREVISIONNUMBER UINT16 :CIM-NAME
                "CurrentBIOSRevisionNumber" :QUALIFIERS
                ((:DESCRIPTION
                  "The revision number component of the current BIOS version information.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SoftwareIdentity.RevisionNumber")))
                :INITFORM NIL)
               (CURRENTBIOSBUILDNUMBER UINT16 :CIM-NAME
                "CurrentBIOSBuildNumber" :QUALIFIERS
                ((:DESCRIPTION
                  "The build number component of the current BIOS version information.")
                 (:MODEL-CORRESPONDENCE ("CIM_SoftwareIdentity.BuildNumber")))
                :INITFORM NIL)
               (CURRENTMANAGEMENTFIRMWAREMAJORVERSION UINT16 :CIM-NAME
                "CurrentManagementFirmwareMajorVersion" :QUALIFIERS
                ((:DESCRIPTION
                  "The major number component of the version information for the current management firmware on this physical computer system.")
                 (:MODEL-CORRESPONDENCE ("CIM_SoftwareIdentity.MajorVersion")))
                :INITFORM NIL)
               (CURRENTMANAGEMENTFIRMWAREMINORVERSION UINT16 :CIM-NAME
                "CurrentManagementFirmwareMinorVersion" :QUALIFIERS
                ((:DESCRIPTION
                  "The minor number component of the version information for the current management firmware on this physical computer system.")
                 (:MODEL-CORRESPONDENCE ("CIM_SoftwareIdentity.MinorVersion")))
                :INITFORM NIL)
               (CURRENTMANAGEMENTFIRMWAREREVISIONNUMBER UINT16 :CIM-NAME
                "CurrentManagementFirmwareRevisionNumber" :QUALIFIERS
                ((:DESCRIPTION
                  "The revision number component of the version information for the current management firmware on this physical computer system.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SoftwareIdentity.RevisionNumber")))
                :INITFORM NIL)
               (CURRENTMANAGEMENTFIRMWAREBUILDNUMBER UINT16 :CIM-NAME
                "CurrentManagementFirmwareBuildNumber" :QUALIFIERS
                ((:DESCRIPTION
                  "The build number component of the version information for the current management firmware on this physical computer system.")
                 (:MODEL-CORRESPONDENCE ("CIM_SoftwareIdentity.BuildNumber")))
                :INITFORM NIL)
               (CURRENTMANAGEMENTFIRMWAREELEMENTNAME STRING :CIM-NAME
                "CurrentManagementFirmwareElementName" :QUALIFIERS
                ((:DESCRIPTION
                  "The user-friendly name for the current management firmware on this physical computer system.")
                 (:MODEL-CORRESPONDENCE ("CIM_SoftwareIdentity.ElementName")))
                :INITFORM NIL)
               (CURRENTMANAGEMENTFIRMWAREVERSIONSTRING STRING :CIM-NAME
                "CurrentManagementFirmwareVersionString" :QUALIFIERS
                ((:DESCRIPTION
                  "The version string for the current management firmware on this physical computer system.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SoftwareIdentity.VersionString")))
                :INITFORM NIL)
               (OSTYPE UINT16 :CIM-NAME "OSType" :QUALIFIERS
                ((:DESCRIPTION
                  "Type information of the current or last running operating system on this physical computer system. See CIM_OperatingSystem.OSType for details.")
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
                 (:MODEL-CORRESPONDENCE ("CIM_OperatingSystem.OSType")))
                :INITFORM NIL)
               (OSVERSION STRING :CIM-NAME "OSVersion" :QUALIFIERS
                ((:DESCRIPTION
                  "Version information of the current or last running operating system on this physical computer system. See CIM_OperatingSystem.Version for details.")
                 (:MODEL-CORRESPONDENCE ("CIM_OperatingSystem.Version")))
                :INITFORM NIL)
               (OSENABLEDSTATE UINT16 :CIM-NAME "OSEnabledState" :QUALIFIERS
                ((:DESCRIPTION
                  "EnabledState of the current or last running operating system on this physcial computer system.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11..32767"
                   "32768..65535"))
                 (:VALUES
                  ("Unknown" "Other" "Enabled" "Disabled" "Shutting Down"
                   "Not Applicable" "Enabled but Offline" "In Test" "Deferred"
                   "Quiesce" "Starting" "DMTF Reserved" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE ("CIM_OperatingSystem.EnabledState")))
                :INITFORM NIL)
               (CURRENTBIOSVERSIONSTRING STRING :CIM-NAME
                "CurrentBIOSVersionString" :QUALIFIERS
                ((:DESCRIPTION
                  "The BIOS version information in string format.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SoftwareIdentity.VersionString")))
                :INITFORM NIL)
               (PROCESSORCURRENTCLOCKSPEED UINT32 :CIM-NAME
                "ProcessorCurrentClockSpeed" :QUALIFIERS
                ((:DESCRIPTION
                  "See CIM_Processor.CurrentClockSpeed for details.")
                 (:MODEL-CORRESPONDENCE ("CIM_Processor.CurrentClockSpeed"))
                 (:P-UNIT "hertz * 10^6"))
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
                :INITFORM NIL)
               (OPERATIONALSTATUS (ARRAY UINT16) :CIM-NAME "OperationalStatus"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This property corresponds to the OperationalStatus property of the logical computer system represented by CIM_ComputerSystem. See CIM_ManagedSystemElement.OperationalStatus Description for details.")
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
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ComputerSystem.OperationalStatus")))
                :INITFORM NIL)
               (POWERUTILIZATIONMODESSUPPORTED (ARRAY UINT16) :CIM-NAME
                "PowerUtilizationModesSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "This property corresponds to PowerUtilizationModesSupported property of CIM_PowerUtilizationManagementCapabilities. See CIM_PowerUtilizationManagementCapabilities.PowerUtilizationModesSupported for details.")
                 (:VALUE-MAP ("3" "4" ".." "32768..65535"))
                 (:VALUES
                  ("Dynamic" "Static" "DMTF Reserved" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PowerUtilizationManagementCapabilities.PowerUtilizationModesSupported")))
                :INITFORM NIL)
               (NUMERICSENSORELEMENTNAME (ARRAY STRING) :CIM-NAME
                "NumericSensorElementName" :QUALIFIERS
                ((:DESCRIPTION
                  "User-friendly names of the numeric sensors on the computer system. See CIM_NumericSensor.ElementName for details.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE ("CIM_NumericSensor.ElementName")))
                :INITFORM NIL)
               (NUMERICSENSORENABLEDSTATE (ARRAY UINT16) :CIM-NAME
                "NumericSensorEnabledState" :QUALIFIERS
                ((:DESCRIPTION
                  "States of numeric sensors. See CIM_NumericSensor.EnabledState for details.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11..32767"
                   "32768..65535"))
                 (:VALUES
                  ("Unknown" "Other" "Enabled" "Disabled" "Shutting Down"
                   "Not Applicable" "Enabled but Offline" "In Test" "Deferred"
                   "Quiesce" "Starting" "DMTF Reserved" "Vendor Reserved"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_NumericSensor.EnabledState"
                   "CIM_PhysicalComputerSystemView.NumericSensorElementName")))
                :INITFORM NIL)
               (NUMERICSENSORHEALTHSTATE (ARRAY UINT16) :CIM-NAME
                "NumericSensorHealthState" :QUALIFIERS
                ((:DESCRIPTION
                  "Health states of numeric sensors. See CIM_NumericSensor.HealthState for details.")
                 (:VALUE-MAP
                  ("0" "5" "10" "15" "20" "25" "30" ".." "32768..65535"))
                 (:VALUES
                  ("Unknown" "OK" "Degraded/Warning" "Minor failure"
                   "Major failure" "Critical failure" "Non-recoverable error"
                   "DMTF Reserved" "Vendor Specific"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_NumericSensor.HealthState"
                   "CIM_PhysicalComputerSystemView.NumericSensorElementName"
                   "CIM_PhysicalComputerSystemView.NumericSensorEnabledState")))
                :INITFORM NIL)
               (NUMERICSENSORCURRENTSTATE (ARRAY STRING) :CIM-NAME
                "NumericSensorCurrentState" :QUALIFIERS
                ((:DESCRIPTION
                  "Current states of numeric sensors. See CIM_NumericSensor.CurrentState for details.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_NumericSensor.CurrentState"
                   "CIM_PhysicalComputerSystemView.NumericSensorElementName"
                   "CIM_PhysicalComputerSystemView.NumericSensorEnabledState"
                   "CIM_PhysicalComputerSystemView.NumericSensorHealthState")))
                :INITFORM NIL)
               (NUMERICSENSORPRIMARYSTATUS (ARRAY UINT16) :CIM-NAME
                "NumericSensorPrimaryStatus" :QUALIFIERS
                ((:DESCRIPTION
                  "Primary statuses of numeric sensors. See CIM_NumericSensor.PrimaryStatus for details.")
                 (:VALUE-MAP ("0" "1" "2" "3" ".." "0x8000.."))
                 (:VALUES
                  ("Unknown" "OK" "Degraded" "Error" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_NumericSensor.PrimaryStatus"
                   "CIM_PhysicalComputerSystemView.NumericSensorElementName"
                   "CIM_PhysicalComputerSystemView.NumericSensorEnabledState"
                   "CIM_PhysicalComputerSystemView.NumericSensorHealthState"
                   "CIM_PhysicalComputerSystemView.NumericSensorCurrentState")))
                :INITFORM NIL)
               (NUMERICSENSORBASEUNITS (ARRAY UINT16) :CIM-NAME
                "NumericSensorBaseUnits" :QUALIFIERS
                ((:DESCRIPTION
                  "Base units of the values returned by the numeric sensors. See CIM_NumericSensor.BaseUnits for details.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25"
                   "26" "27" "28" "29" "30" "31" "32" "33" "34" "35" "36" "37"
                   "38" "39" "40" "41" "42" "43" "44" "45" "46" "47" "48" "49"
                   "50" "51" "52" "53" "54" "55" "56" "57" "58" "59" "60" "61"
                   "62" "63" "64" "65" "66"))
                 (:VALUES
                  ("Unknown" "Other" "Degrees C" "Degrees F" "Degrees K"
                   "Volts" "Amps" "Watts" "Joules" "Coulombs" "VA" "Nits"
                   "Lumens" "Lux" "Candelas" "kPa" "PSI" "Newtons" "CFM" "RPM"
                   "Hertz" "Seconds" "Minutes" "Hours" "Days" "Weeks" "Mils"
                   "Inches" "Feet" "Cubic Inches" "Cubic Feet" "Meters"
                   "Cubic Centimeters" "Cubic Meters" "Liters" "Fluid Ounces"
                   "Radians" "Steradians" "Revolutions" "Cycles" "Gravities"
                   "Ounces" "Pounds" "Foot-Pounds" "Ounce-Inches" "Gauss"
                   "Gilberts" "Henries" "Farads" "Ohms" "Siemens" "Moles"
                   "Becquerels" "PPM (parts/million)" "Decibels" "DbA" "DbC"
                   "Grays" "Sieverts" "Color Temperature Degrees K" "Bits"
                   "Bytes" "Words (data)" "DoubleWords" "QuadWords"
                   "Percentage" "Pascals"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_NumericSensor.BaseUnits"
                   "CIM_PhysicalComputerSystemView.NumericSensorElementName"
                   "CIM_PhysicalComputerSystemView.NumericSensorEnabledState"
                   "CIM_PhysicalComputerSystemView.NumericSensorHealthState"
                   "CIM_PhysicalComputerSystemView.NumericSensorCurrentState"
                   "CIM_PhysicalComputerSystemView.NumericSensorPrimaryStatus")))
                :INITFORM NIL)
               (NUMERICSENSORUNITMODIFIER (ARRAY SINT32) :CIM-NAME
                "NumericSensorUnitModifier" :QUALIFIERS
                ((:DESCRIPTION
                  "Unit modifiers for the values returned by the numeric sensors. See CIM_NumericSensor.UnitModifier description for details.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_NumericSensor.UnitModifier"
                   "CIM_PhysicalComputerSystemView.NumericSensorElementName"
                   "CIM_PhysicalComputerSystemView.NumericSensorEnabledState"
                   "CIM_PhysicalComputerSystemView.NumericSensorHealthState"
                   "CIM_PhysicalComputerSystemView.NumericSensorCurrentState"
                   "CIM_PhysicalComputerSystemView.NumericSensorPrimaryStatus"
                   "CIM_PhysicalComputerSystemView.NumericSensorBaseUnits")))
                :INITFORM NIL)
               (NUMERICSENSORRATEUNITS (ARRAY UINT16) :CIM-NAME
                "NumericSensorRateUnits" :QUALIFIERS
                ((:DESCRIPTION "See CIM_NumericSensor.RateUnits for details.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9"))
                 (:VALUES
                  ("None" "Per MicroSecond" "Per MilliSecond" "Per Second"
                   "Per Minute" "Per Hour" "Per Day" "Per Week" "Per Month"
                   "Per Year"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_NumericSensor.RateUnits"
                   "CIM_PhysicalComputerSystemView.NumericSensorElementName"
                   "CIM_PhysicalComputerSystemView.NumericSensorEnabledState"
                   "CIM_PhysicalComputerSystemView.NumericSensorHealthState"
                   "CIM_PhysicalComputerSystemView.NumericSensorCurrentState"
                   "CIM_PhysicalComputerSystemView.NumericSensorPrimaryStatus"
                   "CIM_PhysicalComputerSystemView.NumericSensorBaseUnits"
                   "CIM_PhysicalComputerSystemView.NumericSensorUnitModifier")))
                :INITFORM NIL)
               (NUMERICSENSORCURRENTREADING (ARRAY SINT32) :CIM-NAME
                "NumericSensorCurrentReading" :QUALIFIERS
                ((:DESCRIPTION
                  "See CIM_NumericSensor.CurrentReading for details.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_NumericSensor.CurrentReading"
                   "CIM_PhysicalComputerSystemView.NumericSensorElementName"
                   "CIM_PhysicalComputerSystemView.NumericSensorEnabledState"
                   "CIM_PhysicalComputerSystemView.NumericSensorHealthState"
                   "CIM_PhysicalComputerSystemView.NumericSensorCurrentState"
                   "CIM_PhysicalComputerSystemView.NumericSensorPrimaryStatus"
                   "CIM_PhysicalComputerSystemView.NumericSensorBaseUnits"
                   "CIM_PhysicalComputerSystemView.NumericSensorUnitModifier"
                   "CIM_PhysicalComputerSystemView.NumericSensorRateUnits")))
                :INITFORM NIL)
               (NUMERICSENSORSENSORTYPE (ARRAY UINT16) :CIM-NAME
                "NumericSensorSensorType" :QUALIFIERS
                ((:DESCRIPTION "See CIM_NumericSensor.SensorType for details.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" ".." "32768..65535"))
                 (:VALUES
                  ("Unknown" "Other" "Temperature" "Voltage" "Current"
                   "Tachometer" "Counter" "Switch" "Lock" "Humidity"
                   "Smoke Detection" "Presence" "Air Flow" "Power Consumption"
                   "Power Production" "Pressure" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_NumericSensor.SensorType"
                   "CIM_PhysicalComputerSystemView.NumericSensorElementName"
                   "CIM_PhysicalComputerSystemView.NumericSensorEnabledState"
                   "CIM_PhysicalComputerSystemView.NumericSensorHealthState"
                   "CIM_PhysicalComputerSystemView.NumericSensorCurrentState"
                   "CIM_PhysicalComputerSystemView.NumericSensorPrimaryStatus"
                   "CIM_PhysicalComputerSystemView.NumericSensorBaseUnits"
                   "CIM_PhysicalComputerSystemView.NumericSensorUnitModifier"
                   "CIM_PhysicalComputerSystemView.NumericSensorRateUnits"
                   "CIM_PhysicalComputerSystemView.NumericSensorCurrentReading")))
                :INITFORM NIL)
               (NUMERICSENSOROTHERSENSORTYPEDESCRIPTION (ARRAY STRING)
                :CIM-NAME "NumericSensorOtherSensorTypeDescription" :QUALIFIERS
                ((:DESCRIPTION
                  "See CIM_NumericSensor.OtherSensorTypeDescription for details.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_NumericSensor.OtherSensorTypeDescription"
                   "CIM_PhysicalComputerSystemView.NumericSensorElementName"
                   "CIM_PhysicalComputerSystemView.NumericSensorEnabledState"
                   "CIM_PhysicalComputerSystemView.NumericSensorHealthState"
                   "CIM_PhysicalComputerSystemView.NumericSensorCurrentState"
                   "CIM_PhysicalComputerSystemView.NumericSensorPrimaryStatus"
                   "CIM_PhysicalComputerSystemView.NumericSensorBaseUnits"
                   "CIM_PhysicalComputerSystemView.NumericSensorUnitModifier"
                   "CIM_PhysicalComputerSystemView.NumericSensorRateUnits"
                   "CIM_PhysicalComputerSystemView.NumericSensorCurrentReading"
                   "CIM_PhysicalComputerSystemView.NumericSensorSensorType")))
                :INITFORM NIL)
               (NUMERICSENSORUPPERTHRESHOLDNONCRITICAL (ARRAY SINT32) :CIM-NAME
                "NumericSensorUpperThresholdNonCritical" :QUALIFIERS
                ((:DESCRIPTION
                  "See CIM_NumericSensor.UpperThresholdNonCritical for details.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_NumericSensor.UpperThresholdNonCritical"
                   "CIM_PhysicalComputerSystemView.NumericSensorElementName"
                   "CIM_PhysicalComputerSystemView.NumericSensorEnabledState"
                   "CIM_PhysicalComputerSystemView.NumericSensorHealthState"
                   "CIM_PhysicalComputerSystemView.NumericSensorCurrentState"
                   "CIM_PhysicalComputerSystemView.NumericSensorPrimaryStatus"
                   "CIM_PhysicalComputerSystemView.NumericSensorBaseUnits"
                   "CIM_PhysicalComputerSystemView.NumericSensorUnitModifier"
                   "CIM_PhysicalComputerSystemView.NumericSensorRateUnits"
                   "CIM_PhysicalComputerSystemView.NumericSensorCurrentReading"
                   "CIM_PhysicalComputerSystemView.NumericSensorSensorType"
                   "CIM_PhysicalComputerSystemView.NumericSensorOtherSensorTypeDescription")))
                :INITFORM NIL)
               (NUMERICSENSORUPPERTHRESHOLDCRITICAL (ARRAY SINT32) :CIM-NAME
                "NumericSensorUpperThresholdCritical" :QUALIFIERS
                ((:DESCRIPTION
                  "See CIM_NumericSensor.UpperThresholdCritical description for details.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_NumericSensor.UpperThresholdCritical"
                   "CIM_PhysicalComputerSystemView.NumericSensorElementName"
                   "CIM_PhysicalComputerSystemView.NumericSensorEnabledState"
                   "CIM_PhysicalComputerSystemView.NumericSensorHealthState"
                   "CIM_PhysicalComputerSystemView.NumericSensorCurrentState"
                   "CIM_PhysicalComputerSystemView.NumericSensorPrimaryStatus"
                   "CIM_PhysicalComputerSystemView.NumericSensorBaseUnits"
                   "CIM_PhysicalComputerSystemView.NumericSensorUnitModifier"
                   "CIM_PhysicalComputerSystemView.NumericSensorRateUnits"
                   "CIM_PhysicalComputerSystemView.NumericSensorCurrentReading"
                   "CIM_PhysicalComputerSystemView.NumericSensorSensorType"
                   "CIM_PhysicalComputerSystemView.NumericSensorOtherSensorTypeDescription"
                   "CIM_PhysicalComputerSystemView.NumericSensorUpperThresholdNonCritical")))
                :INITFORM NIL)
               (NUMERICSENSORUPPERTHRESHOLDFATAL (ARRAY SINT32) :CIM-NAME
                "NumericSensorUpperThresholdFatal" :QUALIFIERS
                ((:DESCRIPTION
                  "See CIM_NumericSensor.UpperThresholdFatal for details.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_NumericSensor.UpperThresholdFatal"
                   "CIM_PhysicalComputerSystemView.NumericSensorElementName"
                   "CIM_PhysicalComputerSystemView.NumericSensorEnabledState"
                   "CIM_PhysicalComputerSystemView.NumericSensorHealthState"
                   "CIM_PhysicalComputerSystemView.NumericSensorCurrentState"
                   "CIM_PhysicalComputerSystemView.NumericSensorPrimaryStatus"
                   "CIM_PhysicalComputerSystemView.NumericSensorBaseUnits"
                   "CIM_PhysicalComputerSystemView.NumericSensorUnitModifier"
                   "CIM_PhysicalComputerSystemView.NumericSensorRateUnits"
                   "CIM_PhysicalComputerSystemView.NumericSensorCurrentReading"
                   "CIM_PhysicalComputerSystemView.NumericSensorSensorType"
                   "CIM_PhysicalComputerSystemView.NumericSensorOtherSensorTypeDescription"
                   "CIM_PhysicalComputerSystemView.NumericSensorUpperThresholdNonCritical"
                   "CIM_PhysicalComputerSystemView.NumericSensorUpperThresholdCritical")))
                :INITFORM NIL)
               (LOGINSTANCEID (ARRAY STRING) :CIM-NAME "LogInstanceID"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This property represents the identifiers for the underlying logs on this physical computer system. See CIM_RecordLog.InstanceID for details.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE ("CIM_RecordLog.InstanceID")))
                :INITFORM NIL)
               (LOGMAXNUMBEROFRECORDS (ARRAY UINT64) :CIM-NAME
                "LogMaxNumberOfRecords" :QUALIFIERS
                ((:DESCRIPTION
                  "See CIM_RecordLog.MaxNumberOfRecords for details.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_RecordLog.MaxNumberOfRecords"
                   "CIM_PhysicalComputerSystemView.LogInstanceID")))
                :INITFORM NIL)
               (LOGCURRENTNUMBEROFRECORDS (ARRAY UINT64) :CIM-NAME
                "LogCurrentNumberOfRecords" :QUALIFIERS
                ((:DESCRIPTION
                  "See CIM_RecordLog.CurrentNumberOfRecords for details.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_RecordLog.CurrentNumberOfRecords"
                   "CIM_PhysicalComputerSystemView.LogInstanceID"
                   "CIM_PhysicalComputerSystemView.LogMaxNumberOfRecords")))
                :INITFORM NIL)
               (LOGOVERWRITEPOLICY (ARRAY UINT16) :CIM-NAME
                "LogOverWritePolicy" :QUALIFIERS
                ((:DESCRIPTION
                  "See CIM_RecordLog.OverWritePolicy for details.")
                 (:VALUE-MAP ("0" "2" "7" ".." "32768..65535"))
                 (:VALUES
                  ("Unknown" "Wraps When Full" "Never Overwrites"
                   "DMTF Reserved" "Vendor Reserved"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_RecordLog.OverwritePolicy"
                   "CIM_PhysicalComputerSystemView.LogInstanceID"
                   "CIM_PhysicalComputerSystemView.LogMaxNumberOfRecords"
                   "CIM_PhysicalComputerSystemView.LogCurrentNumberOfRecords")))
                :INITFORM NIL)
               (LOGSTATE (ARRAY UINT16) :CIM-NAME "LogState" :QUALIFIERS
                ((:DESCRIPTION "See CIM_RecordLog.LogState for details.")
                 (:VALUE-MAP ("0" "2" "3" "4" ".." "32768..65535"))
                 (:VALUES
                  ("Unknown" "Normal" "Erasing" "Not Applicable"
                   "DMTF Reserved" "Vendor Reserved"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_RecordLog.LogState"
                   "CIM_PhysicalComputerSystemView.LogInstanceID"
                   "CIM_PhysicalComputerSystemView.LogMaxNumberOfRecords"
                   "CIM_PhysicalComputerSystemView.LogCurrentNumberOfRecords"
                   "CIM_PhysicalComputerSystemView.LogOverwritePolicy")))
                :INITFORM NIL)
               (STRUCTUREDBOOTSTRING (ARRAY STRING) :CIM-NAME
                "StructuredBootString" :QUALIFIERS
                ((:DESCRIPTION
                  "Strings identifying the boot sources on this physical computer system. See CIM_BootSourceSetting.StructuredBootString description for details.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_BootSourceSetting.StructuredBootString")))
                :INITFORM NIL)
               (PERSISTENTBOOTCONFIGORDER (ARRAY UINT8) :CIM-NAME
                "PersistentBootConfigOrder" :QUALIFIERS
                ((:DESCRIPTION
                  "An array of elements identifying the boot order of the persistent boot configuration that shall be used during the next boot of the computer system, unless the OneTimeBootSource for the next boot is specified. The value of each element in this array is an index referencing an element in the array of StructuredBootString.")
                 (:ARRAYTYPE "Ordered"))
                :INITFORM NIL)
               (DEDICATED (ARRAY UINT16) :CIM-NAME "Dedicated" :QUALIFIERS
                ((:DESCRIPTION "See CIM_ComputerSystem.Dedicated for details.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25"
                   "26" "27" "28" "29" "30" "31" "32" "33" "34" "35" "36" "37"
                   "38" ".." "32568..65535"))
                 (:VALUES
                  ("Not Dedicated" "Unknown" "Other" "Storage" "Router"
                   "Switch" "Layer 3 Switch" "Central Office Switch" "Hub"
                   "Access Server" "Firewall" "Print" "I/O" "Web Caching"
                   "Management" "Block Server" "File Server"
                   "Mobile User Device" "Repeater" "Bridge/Extender" "Gateway"
                   "Storage Virtualizer" "Media Library" "ExtenderNode"
                   "NAS Head" "Self-contained NAS" "UPS" "IP Phone"
                   "Management Controller" "Chassis Manager"
                   "Host-based RAID controller" "Storage Device Enclosure"
                   "Desktop" "Laptop" "Virtual Tape Library"
                   "Virtual Library System" "Network PC/Thin Client"
                   "FC Switch" "Ethernet Switch" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ComputerSystem.Dedicated"
                   "CIM_PhysicalComputerSystemView.OtherDedicatedDescriptions")))
                :INITFORM NIL)
               (IDENTIFYINGDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "IdentifyingDescriptions" :QUALIFIERS
                ((:DESCRIPTION
                  "See CIM_System.IdentifyingDescriptions for details.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ComputerSystem.IdentifyingDescriptions"
                   "CIM_PhysicalComputerSystemView.OtherIdentifyingInfo")))
                :INITFORM NIL)
               (OTHERDEDICATEDDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "OtherDedicatedDescriptions" :QUALIFIERS
                ((:DESCRIPTION
                  "See CIM_ComputerSystem.OtherDedicatedDescriptions for details.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ComputerSystem.OtherDedicatedDescriptions"
                   "CIM_PhysicalComputerSystemView.Dedicated")))
                :INITFORM NIL)
               (OTHERIDENTIFYINGINFO (ARRAY STRING) :CIM-NAME
                "OtherIdentifyingInfo" :QUALIFIERS
                ((:DESCRIPTION
                  "See CIM_System.OtherIdentifyingInfo for details.")
                 (:ARRAYTYPE "Indexed") (:MAX-LEN "256")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ComputerSystem.OtherIdentifyingInfo"
                   "CIM_PhysicalComputerSystemView.IdentifyingDescriptions")))
                :INITFORM NIL)
               (NUMERICSENSORCONTEXT (ARRAY STRING) :CIM-NAME
                "NumericSensorContext" :QUALIFIERS
                ((:DESCRIPTION "See CIM_Sensor.SensorContext for details.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_NumericSensor.SensorContext"
                   "CIM_PhysicalComputerSystemView.NumericSensorElementName"
                   "CIM_PhysicalComputerSystemView.NumericSensorEnabledState"
                   "CIM_PhysicalComputerSystemView.NumericSensorHealthState"
                   "CIM_PhysicalComputerSystemView.NumericSensorCurrentState"
                   "CIM_PhysicalComputerSystemView.NumericSensorPrimaryStatus"
                   "CIM_PhysicalComputerSystemView.NumericSensorBaseUnits"
                   "CIM_PhysicalComputerSystemView.NumericSensorUnitModifier"
                   "CIM_PhysicalComputerSystemView.NumericSensorRateUnits"
                   "CIM_PhysicalComputerSystemView.NumericSensorCurrentReading"
                   "CIM_PhysicalComputerSystemView.NumericSensorSensorType"
                   "CIM_PhysicalComputerSystemView.NumericSensorOtherSensorTypeDescription"
                   "CIM_PhysicalComputerSystemView.NumericSensorUpperThresholdNonCritical"
                   "CIM_PhysicalComputerSystemView.NumericSensorUpperThresholdCritical"
                   "CIM_PhysicalComputerSystemView.NumericSensorUpperThresholdFatal")))
                :INITFORM NIL)
               (NUMERICSENSORLOWERTHRESHOLDCRITICAL (ARRAY SINT32) :CIM-NAME
                "NumericSensorLowerThresholdCritical" :QUALIFIERS
                ((:DESCRIPTION
                  "See CIM_NumericSensor.LowerThresholdCritical description for details.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_NumericSensor.LowerThresholdCritical"
                   "CIM_PhysicalComputerSystemView.NumericSensorElementName"
                   "CIM_PhysicalComputerSystemView.NumericSensorEnabledState"
                   "CIM_PhysicalComputerSystemView.NumericSensorHealthState"
                   "CIM_PhysicalComputerSystemView.NumericSensorCurrentState"
                   "CIM_PhysicalComputerSystemView.NumericSensorPrimaryStatus"
                   "CIM_PhysicalComputerSystemView.NumericSensorBaseUnits"
                   "CIM_PhysicalComputerSystemView.NumericSensorUnitModifier"
                   "CIM_PhysicalComputerSystemView.NumericSensorRateUnits"
                   "CIM_PhysicalComputerSystemView.NumericSensorCurrentReading"
                   "CIM_PhysicalComputerSystemView.NumericSensorSensorType"
                   "CIM_PhysicalComputerSystemView.NumericSensorOtherSensorTypeDescription"
                   "CIM_PhysicalComputerSystemView.NumericSensorUpperThresholdNonCritical"
                   "CIM_PhysicalComputerSystemView.NumericSensorUpperThresholdCritical"
                   "CIM_PhysicalComputerSystemView.NumericSensorUpperThresholdFatal")))
                :INITFORM NIL)
               (NUMERICSENSORLOWERTHRESHOLDFATAL (ARRAY SINT32) :CIM-NAME
                "NumericSensorLowerThresholdFatal" :QUALIFIERS
                ((:DESCRIPTION
                  "See CIM_NumericSensor.LowerThresholdFatal description for details.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_NumericSensor.LowerThresholdFatal"
                   "CIM_PhysicalComputerSystemView.NumericSensorElementName"
                   "CIM_PhysicalComputerSystemView.NumericSensorEnabledState"
                   "CIM_PhysicalComputerSystemView.NumericSensorHealthState"
                   "CIM_PhysicalComputerSystemView.NumericSensorCurrentState"
                   "CIM_PhysicalComputerSystemView.NumericSensorPrimaryStatus"
                   "CIM_PhysicalComputerSystemView.NumericSensorBaseUnits"
                   "CIM_PhysicalComputerSystemView.NumericSensorUnitModifier"
                   "CIM_PhysicalComputerSystemView.NumericSensorRateUnits"
                   "CIM_PhysicalComputerSystemView.NumericSensorCurrentReading"
                   "CIM_PhysicalComputerSystemView.NumericSensorSensorType"
                   "CIM_PhysicalComputerSystemView.NumericSensorOtherSensorTypeDescription"
                   "CIM_PhysicalComputerSystemView.NumericSensorUpperThresholdNonCritical"
                   "CIM_PhysicalComputerSystemView.NumericSensorUpperThresholdCritical"
                   "CIM_PhysicalComputerSystemView.NumericSensorUpperThresholdFatal")))
                :INITFORM NIL)
               (NUMERICSENSORLOWERTHRESHOLDNONCRITICAL (ARRAY SINT32) :CIM-NAME
                "NumericSensorLowerThresholdNonCritical" :QUALIFIERS
                ((:DESCRIPTION
                  "See CIM_NumericSensor.LowerThresholdNonCritical for details.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_NumericSensor.LowerThresholdNonCritical"
                   "CIM_PhysicalComputerSystemView.NumericSensorElementName"
                   "CIM_PhysicalComputerSystemView.NumericSensorEnabledState"
                   "CIM_PhysicalComputerSystemView.NumericSensorHealthState"
                   "CIM_PhysicalComputerSystemView.NumericSensorCurrentState"
                   "CIM_PhysicalComputerSystemView.NumericSensorPrimaryStatus"
                   "CIM_PhysicalComputerSystemView.NumericSensorBaseUnits"
                   "CIM_PhysicalComputerSystemView.NumericSensorUnitModifier"
                   "CIM_PhysicalComputerSystemView.NumericSensorRateUnits"
                   "CIM_PhysicalComputerSystemView.NumericSensorCurrentReading"
                   "CIM_PhysicalComputerSystemView.NumericSensorSensorType"
                   "CIM_PhysicalComputerSystemView.NumericSensorOtherSensorTypeDescription"
                   "CIM_PhysicalComputerSystemView.NumericSensorUpperThresholdNonCritical"
                   "CIM_PhysicalComputerSystemView.NumericSensorUpperThresholdCritical"
                   "CIM_PhysicalComputerSystemView.NumericSensorUpperThresholdFatal")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_PhysicalComputerSystemView")
              (:QUALIFIERS (:VERSION "2.36.0")
               (:UML-PACKAGE-PATH "CIM::Core::CoreElements")
               (:DESCRIPTION
                "This class defines a view class for a physical computer system.")))
(DEFCIM-METHOD REQUESTSTATECHANGE
    ((INSTANCE CIM_PHYSICALCOMPUTERSYSTEMVIEW)
     (REQUESTEDSTATE UINT16 "RequestedState"
      (:DESCRIPTION
       "See CIM_ComputerSystem.RequestedStateChange.RequestedState for details.")
      (:VALUE-MAP ("2" "3" "4" "6" "7" "8" "9" "10" "11" ".." "32768..65535"))
      (:VALUES
       ("Enabled" "Disabled" "Shut Down" "Offline" "Test" "Defer" "Quiesce"
        "Reboot" "Reset" "DMTF Reserved" "Vendor Reserved"))
      (:MODEL-CORRESPONDENCE
       ("CIM_ComputerSystem.RequestStateChange(RequestedState)")))
     (TIMEOUTPERIOD DATETIME "TimeoutPeriod"
      (:DESCRIPTION "See CIM_ComputerSystem.TimeoutPeriod for details.")
      (:MODEL-CORRESPONDENCE
       ("CIM_ComputerSystem.RequestStateChange(TimeoutPeriod)")))
     (JOB "CIM_ConcreteJob" "Job" :IN :OUT
      (:DESCRIPTION
       "May contain a reference to the ConcreteJob created to track the state transition initiated by the method invocation.")))
    ((:CIM-NAME "RequestStateChange")
     (:QUALIFIERS
      (:DESCRIPTION
       "An extrinsic method for changing the state of this physical computer system. Requests that the state of the element be changed to the value specified in the RequestedState parameter. When the requested state change takes place, the EnabledState and RequestedState will be the same. Invoking the RequestStateChange method multiple times could result in earlier requests being overwritten or lost.
A return code of 0 shall indicate the state change was successfully initiated.
A return code of 1 shall indicate that the method is not supported. A return code of 2 shall indicate that the method failed.
A return code of 4096 shall indicate the state change was successfully initiated, a ConcreteJob has been created, and its reference returned in the output parameter Job.")
      (:VALUE-MAP ("0" "1" "2" "4096" ".." "32768..65535"))
      (:VALUES
       ("Completed with No Error" "Not Supported" "Failed" "Job Started"
        "DMTF Reserved" "Vendor Reserved"))
      (:MODEL-CORRESPONDENCE ("CIM_ComputerSystem.RequestStateChange")))))
(DEFCIM-METHOD CLEARLOG
    ((INSTANCE CIM_PHYSICALCOMPUTERSYSTEMVIEW)
     (LOGINSTANCEID STRING "LogInstanceID"
      (:DESCRIPTION "Idenfier for the log that is requested to be cleared.")
      (:MODEL-CORRESPONDENCE
       ("CIM_RecordLog.InstanceID"
        "CIM_PhysicalComputerSystemView.LogInstanceID"))))
    ((:CIM-NAME "ClearLog")
     (:QUALIFIERS
      (:DESCRIPTION
       "An extrinsic method for clearing a log on this physical computer system.
Requests that the Log be cleared of all entries.
The return value shall be 0 if the request was successfully executed, 1 if the request is not supported, and 2 if an error occurred. A return code of 4096 shall indicate the request to clear log was successfully initiated, a ConcreteJob has been created, and its reference returned in the output parameter Job.")
      (:VALUE-MAP ("0" "1" "2" ".." "32768..65535"))
      (:VALUES
       ("Completed with No Error" "Not Supported" "Failed" "DMTF Reserved"
        "Vendor Reserved")))))
(DEFCIM-METHOD INSTALLSOFTWAREFROMURI
    ((INSTANCE CIM_PHYSICALCOMPUTERSYSTEMVIEW)
     (URI STRING "URI"
      (:DESCRIPTION
       "See CIM_SoftwareInstallationService.InstallFromURI.URI for details.")
      (:MODEL-CORRESPONDENCE
       ("CIM_SoftwareInstallationService.InstallFromURI")))
     (JOB "CIM_ConcreteJob" "Job" :IN :OUT
      (:DESCRIPTION "Reference to the job (may be null if job completed)."))
     (CLASSIFICATIONS (ARRAY UINT16) "Classifications"
      (:DESCRIPTION "See CIM_SoftwareIdentity.Classifications for details.")
      (:VALUE-MAP ("10" "11" "13" "14" ".." "0x8000..0xFFFF"))
      (:VALUES
       ("Firmware" "BIOS/FCode" "Software Bundle" "Management Firmware"
        "DMTF Reserved" "Vendor Reserved"))
      (:ARRAYTYPE "Indexed")
      (:MODEL-CORRESPONDENCE ("CIM_SoftwareIdentity.Classifications")))
     (INSTALLOPTIONS (ARRAY UINT16) "InstallOptions"
      (:DESCRIPTION
       "See CIM_SoftwareInstallationService.InstallFromURI.InstallOptions for details.")
      (:VALUE-MAP
       ("2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" ".."
        "32768..65535"))
      (:VALUES
       ("Defer target/system reset" "Force installation" "Install" "Update"
        "Repair" "Reboot" "Password" "Uninstall" "Log" "SilentMode"
        "AdministrativeMode" "ScheduleInstallAt" "DMTF Reserved"
        "Vendor Specific"))
      (:ARRAYTYPE "Indexed")
      (:MODEL-CORRESPONDENCE
       ("CIM_SoftwareInstallationService.InstallFromURI(InstallOptions)"
        "CIM_PhysicalComputerSystemView.InstallSoftwareFromURI(InstallOptionsValues)")))
     (INSTALLOPTIONSVALUES (ARRAY STRING) "InstallOptionsValues"
      (:DESCRIPTION
       "See CIM_SoftwareInstallationService.InstallFromURI.InstallOptionsValues for details.")
      (:ARRAYTYPE "Indexed")
      (:MODEL-CORRESPONDENCE
       ("CIM_SoftwareInstallationService.InstallFromURI(InstallOptionsValues)"
        "CIM_PhysicalComputerSystemView.InstallSoftwareFromURI(InstallOptions)"))))
    ((:CIM-NAME "InstallSoftwareFromURI")
     (:QUALIFIERS
      (:DESCRIPTION
       "An extrinsic method for installing software on this physical computer system. If 0 is returned, the function completed successfully and no ConcreteJob instance was required. The return value shall be 1 if the request is not supported, and 2 if an error occurred. If 4096 is returned, a ConcreteJob will be started to to perform the install. The Job's reference will be returned in the output parameter Job.")
      (:VALUE-MAP ("0" "1" "2" "4096" ".." "32768..65535"))
      (:VALUES
       ("Completed with No Error" "Not Supported" "Failed" "Job Started"
        "DMTF Reserved" "Vendor Reserved"))
      (:MODEL-CORRESPONDENCE
       ("CIM_SoftwareInstallationService.InstallFromURI")))))
(DEFCIM-METHOD MODIFYPERSISTENTBOOTCONFIGORDER
    ((INSTANCE CIM_PHYSICALCOMPUTERSYSTEMVIEW)
     (JOB "CIM_ConcreteJob" "Job" :IN :OUT
      (:DESCRIPTION
       "Reference to the job spawned if the operation continues after the method returns. (May be null if the task is completed)."))
     (STRUCTUREDBOOTSTRING (ARRAY STRING) "StructuredBootString"
      (:DESCRIPTION
       "An ordered array of strings representing the order of boot sources.")
      (:MODEL-CORRESPONDENCE
       ("CIM_PhysicalComputerSystemView.StructuredBootString"))))
    ((:CIM-NAME "ModifyPersistentBootConfigOrder")
     (:QUALIFIERS
      (:DESCRIPTION
       "This method is used to change the order of boot sources for the persistent boot configuration specified by the property CIM_PhysicalComputerSystemView.PersistentBootConfigOrder.")
      (:VALUE-MAP ("0" "1" "2" "4096" ".." "32768..65535"))
      (:VALUES
       ("Completed with No Error" "Not Supported" "Failed" "Job Started"
        "DMTF Reserved" "Vendor Reserved")))))
(DEFCIM-METHOD SETONETIMEBOOTSOURCE
    ((INSTANCE CIM_PHYSICALCOMPUTERSYSTEMVIEW)
     (STRUCTUREDBOOTSTRING STRING "StructuredBootString"
      (:DESCRIPTION "A string representing the boot source for next boot.")
      (:MODEL-CORRESPONDENCE
       ("CIM_PhysicalComputerSystemView.StructuredBootString")))
     (JOB "CIM_ConcreteJob" "Job" :IN :OUT
      (:DESCRIPTION
       "Reference to the job spawned if the operation continues after the method returns. (May be null if the task is completed).")))
    ((:CIM-NAME "SetOneTimeBootSource")
     (:QUALIFIERS
      (:DESCRIPTION
       "This method is used to set the one time boot source for the next boot on this computer system.")
      (:VALUE-MAP ("0" "1" "2" "4096" ".." "32768..65535"))
      (:VALUES
       ("Completed with No Error" "Not Supported" "Failed" "Job Started"
        "DMTF Reserved" "Vendor Reserved")))))