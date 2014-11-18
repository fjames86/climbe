
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_VersionCompatibilityCheck.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_VERSIONCOMPATIBILITYCHECK (CIM_CHECK)
              ((ALLOWDOWNVERSION BOOLEAN :CIM-NAME "AllowDownVersion"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The AllowDownVersion property indicates that this Software Element can transition to its next state even if a higher or later version of the element already exists in the environment."))
                :INITFORM NIL)
               (ALLOWMULTIPLEVERSIONS BOOLEAN :CIM-NAME "AllowMultipleVersions"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The AllowMultipleVersions option controls the ability to configure multiple versions of a SoftwareElement on a system."))
                :INITFORM NIL)
               (REINSTALL BOOLEAN :CIM-NAME "Reinstall" :QUALIFIERS
                ((:DESCRIPTION
                  "The Reinstall property indicates that this SoftwareElement can transition to its next state even if an element of the same version already exists in the environment."))
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
              (:CIM-NAME "CIM_VersionCompatibilityCheck")
              (:QUALIFIERS (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Application::CheckAction")
               (:DESCRIPTION
                "The VersionCompatibilityCheck class specifies whether it is permissible to create the next state of a SoftwareElement.")))
(DEFCIM-METHOD INVOKE
    ((INSTANCE CIM_VERSIONCOMPATIBILITYCHECK))
    ((:CIM-NAME "Invoke")
     (:QUALIFIERS
      (:DESCRIPTION
       "The Invoke method evaluates this Check. The details of the evaluation are described by the specific subclasses of CIM_Check. When the SoftwareElement being checked is already installed, the CIM_InstalledSoftwareElement association identifies the CIM_ComputerSystem in whose context the Invoke is executed. If this association is not in place, then the InvokeOnSystem method should be used - since it identifies the TargetSystem as an input parameter of the method. 
The results of the Invoke method are based on the return value. A zero is returned if the condition is satisfied. A one is returned if the method is not supported. Any other value indicates the condition is not satisfied."))))
(DEFCIM-METHOD INVOKEONSYSTEM
    ((INSTANCE CIM_VERSIONCOMPATIBILITYCHECK)
     (TARGETSYSTEM "CIM_ComputerSystem" "TargetSystem" :IN
      (:DESCRIPTION
       "Reference to ComputerSystem in whose context the method is to be invoked.")))
    ((:CIM-NAME "InvokeOnSystem")
     (:QUALIFIERS
      (:DESCRIPTION
       "The InvokeOnSystem method evaluates this Check. The details of the evaluation are described by the specific subclasses of CIM_Check. The method's TargetSystem input parameter specifies the ComputerSystem in whose context the method is invoked. 
The results of the InvokeOnSystem method are based on the return value. A zero is returned if the condition is satisfied. A one is returned if the method is not supported. Any other value indicates the condition is not satisfied."))))