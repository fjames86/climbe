
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_UnixProcessStatisticalInformation.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_UNIXPROCESSSTATISTICALINFORMATION
              (CIM_STATISTICALINFORMATION)
              ((CSCREATIONCLASSNAME STRING :CIM-NAME "CSCreationClassName"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The scoping Process's ComputerSystem CreationClassName.")
                 (:MAX-LEN "256")
                 (:PROPOGATED "CIM_Process.CSCreationClassName"))
                :INITFORM NIL)
               (CSNAME STRING :CIM-NAME "CSName" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION "The scoping Process's ComputerSystem Name.")
                 (:MAX-LEN "256") (:PROPOGATED "CIM_Process.CSName"))
                :INITFORM NIL)
               (OSCREATIONCLASSNAME STRING :CIM-NAME "OSCreationClassName"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The scoping Process's OperatingSystem CreationClassName.")
                 (:MAX-LEN "256")
                 (:PROPOGATED "CIM_Process.OSCreationClassName"))
                :INITFORM NIL)
               (OSNAME STRING :CIM-NAME "OSName" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION "The scoping Process's OperatingSystem Name.")
                 (:MAX-LEN "256") (:PROPOGATED "CIM_Process.OSName"))
                :INITFORM NIL)
               (HANDLE STRING :CIM-NAME "Handle" :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping Process's Handle.")
                 (:MAX-LEN "256") (:PROPOGATED "CIM_Process.Handle"))
                :INITFORM NIL)
               (PROCESSCREATIONCLASSNAME STRING :CIM-NAME
                "ProcessCreationClassName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping Process's CreationClassName.")
                 (:MAX-LEN "256")
                 (:PROPOGATED "CIM_Process.CreationClassName"))
                :INITFORM NIL)
               (NAME STRING :CIM-NAME "Name" :QUALIFIERS
                (:KEY (:OVERRIDE "Name")
                 (:DESCRIPTION
                  "A string used to identify the related statistics of a Process. This key allows multiple instances of statistics to correspond to a single process. The multiple instances could be used in applications such as time-sliced statistics.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (CPUTIME UINT32 :CIM-NAME "CPUTime" :QUALIFIERS
                ((:DESCRIPTION
                  "The percentage of a CPU's time this process is consuming.")
                 (NIL "Percent")
                 (:MAPPING-STRINGS ("MIF.DMTF|Process Information|001.12"))
                 (:P-UNIT "percent"))
                :INITFORM NIL)
               (REALTEXT UINT64 :CIM-NAME "RealText" :QUALIFIERS
                ((:DESCRIPTION
                  "The number of KiloBytes of real text space used by the process.")
                 (NIL "KiloBytes")
                 (:MAPPING-STRINGS ("MIF.DMTF|Process Information|001.15"))
                 (:P-UNIT "byte * 2^10"))
                :INITFORM NIL)
               (REALDATA UINT64 :CIM-NAME "RealData" :QUALIFIERS
                ((:DESCRIPTION
                  "The number of KiloBytes of real data space used by the process.")
                 (NIL "KiloBytes")
                 (:MAPPING-STRINGS ("MIF.DMTF|Process Information|001.16"))
                 (:P-UNIT "byte * 2^10"))
                :INITFORM NIL)
               (REALSTACK UINT64 :CIM-NAME "RealStack" :QUALIFIERS
                ((:DESCRIPTION
                  "The number of KiloBytes of real stack space used by the process.")
                 (NIL "KiloBytes")
                 (:MAPPING-STRINGS ("MIF.DMTF|Process Information|001.17"))
                 (:P-UNIT "byte * 2^10"))
                :INITFORM NIL)
               (VIRTUALTEXT UINT64 :CIM-NAME "VirtualText" :QUALIFIERS
                ((:DESCRIPTION
                  "The number of KiloBytes of virtual text space used by the process.")
                 (NIL "KiloBytes")
                 (:MAPPING-STRINGS ("MIF.DMTF|Process Information|001.18"))
                 (:P-UNIT "byte * 2^10"))
                :INITFORM NIL)
               (VIRTUALDATA UINT64 :CIM-NAME "VirtualData" :QUALIFIERS
                ((:DESCRIPTION
                  "The number of KiloBytes of virtual data space used by the process.")
                 (NIL "KiloBytes")
                 (:MAPPING-STRINGS ("MIF.DMTF|Process Information|001.19"))
                 (:P-UNIT "byte * 2^10"))
                :INITFORM NIL)
               (VIRTUALSTACK UINT64 :CIM-NAME "VirtualStack" :QUALIFIERS
                ((:DESCRIPTION
                  "The number of KiloBytes of virtual stack space used by the process.")
                 (NIL "KiloBytes")
                 (:MAPPING-STRINGS ("MIF.DMTF|Process Information|001.20"))
                 (:P-UNIT "byte * 2^10"))
                :INITFORM NIL)
               (VIRTUALMEMORYMAPPEDFILESIZE UINT64 :CIM-NAME
                "VirtualMemoryMappedFileSize" :QUALIFIERS
                ((:DESCRIPTION
                  "The number of KiloBytes of virtual space used for memory mapped files by the process.")
                 (NIL "KiloBytes")
                 (:MAPPING-STRINGS ("MIF.DMTF|Process Information|001.22"))
                 (:P-UNIT "byte * 2^10"))
                :INITFORM NIL)
               (VIRTUALSHAREDMEMORY UINT64 :CIM-NAME "VirtualSharedMemory"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The number of KiloBytes of shared memory used by the process.")
                 (NIL "KiloBytes")
                 (:MAPPING-STRINGS ("MIF.DMTF|Process Information|001.21"))
                 (:P-UNIT "byte * 2^10"))
                :INITFORM NIL)
               (CPUTIMEDEADCHILDREN UINT64 :CIM-NAME "CpuTimeDeadChildren"
                :QUALIFIERS
                ((:DESCRIPTION
                  "CPU time of terminated child processes in clock ticks.")
                 (NIL "Clock Ticks") :COUNTER (:P-UNIT "count"))
                :INITFORM NIL)
               (SYSTEMTIMEDEADCHILDREN UINT64 :CIM-NAME
                "SystemTimeDeadChildren" :QUALIFIERS
                ((:DESCRIPTION
                  "System time of terminated child processes in clock ticks.")
                 (NIL "Clock Ticks") :COUNTER (:P-UNIT "count"))
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
              (:CIM-NAME "CIM_UnixProcessStatisticalInformation")
              (:QUALIFIERS (:VERSION "2.17.0")
               (:UML-PACKAGE-PATH "CIM::System::Unix")
               (:DESCRIPTION "The statistics associated with a Unix process.")))