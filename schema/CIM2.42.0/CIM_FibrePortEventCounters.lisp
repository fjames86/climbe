
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_FibrePortEventCounters.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_FIBREPORTEVENTCOUNTERS (CIM_DEVICESTATISTICALINFORMATION)
              ((PLOGISRECEIVED UINT64 :CIM-NAME "PLOGIsReceived" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "Note: The use of this method has been deprecated. 
Deprecated description: The number of login frames received.")
                 :COUNTER)
                :INITFORM NIL)
               (PLOGISSENT UINT64 :CIM-NAME "PLOGIsSent" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "Note: The use of this method has been deprecated. 
Deprecated description: The number of login frames sent.")
                 :COUNTER)
                :INITFORM NIL)
               (EOFABORTSRECEIVED UINT64 :CIM-NAME "EOFAbortsReceived"
                :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "Note: The use of this method has been deprecated. 
Deprecated description: Number of frames received that contain 'EOF Abort'.")
                 :COUNTER)
                :INITFORM NIL)
               (EOFABORTSTRANSMITTED UINT64 :CIM-NAME "EOFAbortsTransmitted"
                :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "Note: The use of this method has been deprecated. 
Deprecated description: Number of frames transmitted that contain 'EOF Abort'.")
                 :COUNTER)
                :INITFORM NIL)
               (PLOGOSRECEIVED UINT64 :CIM-NAME "PLOGOsReceived" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "Note: The use of this method has been deprecated. 
Deprecated description: The number of logouts that were received from various targets.")
                 :COUNTER)
                :INITFORM NIL)
               (PLOGOSSENT UINT64 :CIM-NAME "PLOGOsSent" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "Note: The use of this method has been deprecated. 
Deprecated description: The number of logout frames sent.")
                 :COUNTER)
                :INITFORM NIL)
               (PLOGISREJECTED UINT64 :CIM-NAME "PLOGIsRejected" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "Note: The use of this method has been deprecated. 
Deprecated description: The number of PLOGI frames sent where the response was LS_RJT.")
                 :COUNTER)
                :INITFORM NIL)
               (PLOGOSREJECTED UINT64 :CIM-NAME "PLOGOsRejected" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "Note: The use of this method has been deprecated. 
Deprecated description: The number of PLOGO frames sent where the response was LS_RJT.")
                 :COUNTER)
                :INITFORM NIL)
               (SYSTEMCREATIONCLASSNAME STRING :CIM-NAME
                "SystemCreationClassName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping System's CreationClassName.")
                 (:MAX-LEN "256")
                 (:PROPOGATED "CIM_LogicalDevice.SystemCreationClassName"))
                :INITFORM NIL)
               (SYSTEMNAME STRING :CIM-NAME "SystemName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping System's Name.")
                 (:MAX-LEN "256") (:PROPOGATED "CIM_LogicalDevice.SystemName"))
                :INITFORM NIL)
               (DEVICECREATIONCLASSNAME STRING :CIM-NAME
                "DeviceCreationClassName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping Device's CreationClassName.")
                 (:MAX-LEN "256")
                 (:PROPOGATED "CIM_LogicalDevice.CreationClassName"))
                :INITFORM NIL)
               (DEVICEID STRING :CIM-NAME "DeviceID" :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping Device's ID.") (:MAX-LEN "64")
                 (:PROPOGATED "CIM_LogicalDevice.DeviceID"))
                :INITFORM NIL)
               (CREATIONCLASSNAME STRING :CIM-NAME "CreationClassName"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "CreationClassName indicates the name of the class or the subclass used in the creation of an instance. When used with the other key properties of this class, this property allows all instances of this class and its subclasses to be uniquely identified.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (NAME STRING :CIM-NAME "Name" :QUALIFIERS
                (:KEY (:OVERRIDE "Name")
                 (:DESCRIPTION
                  "The Name property, inherited from StatisticalInformation, serves as part of the object key.")
                 (:MAX-LEN "256"))
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
              (:CIM-NAME "CIM_FibrePortEventCounters")
              (:QUALIFIERS (:DEPRECATED ("CIM_FCPortStatistics"))
               (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::NetworkAdapter")
               (:DESCRIPTION
                "Note: The use of the FibrePortEventCounters class is deprecated because FibrePort is deprecated. FCPortStatistics should be used instead, but it redefines the level at which data is collected. Therefore, there is no direct translation of the individual counters between the two classes. Deprecated description: This object defines error counters that are specific to a FibrePort.")))
(DEFCIM-METHOD RESETCOUNTER
    ((INSTANCE CIM_FIBREPORTEVENTCOUNTERS)
     (SELECTEDCOUNTER UINT16 "SelectedCounter" :IN
      (:DESCRIPTION "The counter to reset.")
      (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6" "7" "8"))
      (:VALUES
       ("All" "PLOGIsReceived" "PLOGIsSent" "EOFAbortsReceived"
        "EOFAbortsTransmitted" "PLOGOsReceived" "PLOGOsSent" "PLOGIsRejected"
        "PLOGOsRejected"))))
    ((:CIM-NAME "ResetCounter")
     (:QUALIFIERS (:DEPRECATED ("CIM_FCPortStatistics.ResetSelectedStats"))
      (:DESCRIPTION "Note: The use of this method has been deprecated. 
Deprecated description: Method to reset the Port event counters. The method takes as input an integer that indicates which counter to reset. For this input parameter, 0 indicates all and 1 through 8 indicate a reset of the individual counters. The method returns 0 if successful, 1 if not supported, and any other value if an error occurred. A method is specified so that the instrumentation of the Device, which tabulates the errors and warnings, can also reset its internal processing and counters. 
In a subclass, the set of possible return codes could be specified, using a ValueMap qualifier on the method. The strings to which the ValueMap contents are 'translated' can also be specified in the subclass as a Values array qualifier."))))