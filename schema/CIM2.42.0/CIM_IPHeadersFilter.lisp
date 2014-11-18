
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_IPHeadersFilter.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_IPHEADERSFILTER (CIM_FILTERENTRYBASE)
              ((HDRIPVERSION UINT8 :CIM-NAME "HdrIPVersion" :QUALIFIERS
                ((:DESCRIPTION
                  "HdrIPVersion identifies the version of the IP addresses for IP header filters. It is also used to determine the sizes of the OctetStrings in the six properties HdrSrcAddress, HdrSrcAddressEndOfRange, HdrSrcMask, HdrDestAddress, HdrDestAddressEndOfRange and HdrDestMask, as follows: 
ipv4(4): OctetString(SIZE (4)) 
ipv6(6): OctetString(SIZE (16|20)), 
depending on whether a scope identifier is present. 

If a value for this property is not provided, then the filter does not consider IP version in selecting matching packets, i.e., IP version matches for all values. In this case, the HdrSrcAddress, HdrSrcAddressEndOfRange, HdrSrcMask, HdrDestAddress, HdrDestAddressEndOfRange and HdrDestMask must also be not present.")
                 (:VALUE-MAP ("4" "6")) (:VALUES ("IPv4" "IPv6"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_IPHeadersFilter.HdrSrcAddress"
                   "CIM_IPHeadersFilter.HdrSrcAddressEndOfRange"
                   "CIM_IPHeadersFilter.HdrSrcMask"
                   "CIM_IPHeadersFilter.HdrDestAddress"
                   "CIM_IPHeadersFilter.HdrDestAddressEndOfRange"
                   "CIM_IPHeadersFilter.HdrDestMask")))
                :INITFORM NIL)
               (HDRPROTOCOLID UINT8 :CIM-NAME "HdrProtocolID" :QUALIFIERS
                ((:DESCRIPTION
                  "HdrProtocolID is an 8-bit unsigned integer, representing an IP protocol type. This value is compared to the Protocol field in the IP header. 

If a value for this property is not provided, then the filter does not consider HdrProtocolID in selecting matching packets, i.e., HdrProtocolID matches for all values."))
                :INITFORM NIL)
               (HDRSRCPORTSTART UINT16 :CIM-NAME "HdrSrcPortStart" :QUALIFIERS
                ((:DESCRIPTION
                  "HdrSrcPortStart represents the lower end of a range of UDP or TCP source ports. The upper end of the range is represented by the HdrSrcPortEnd property. The value of HdrSrcPortStart MUST be no greater than the value of HdrSrcPortEnd. 

A source port filter is evaluated by testing whether the source port identified in the IP header falls within the range of values between HdrSrcPortStart and HdrSrcPortEnd, INCLUDING these two end points. 

If a value for this property is not provided, then the filter does not consider HdrSrcPortStart in selecting matching packets, i.e., there is no lower bound in matching source port values."))
                :INITFORM NIL)
               (HDRSRCPORTEND UINT16 :CIM-NAME "HdrSrcPortEnd" :QUALIFIERS
                ((:DESCRIPTION
                  "HdrSrcPortEnd represents the upper end of a range of UDP or TCP source ports. The lower end of the range is represented by the HdrSrcPortStart property. The value of HdrSrcPortEnd MUST be no less than the value of HdrSrcPortStart. A single port is indicated by equal values for HdrSrcPortStart and HdrSrcPortEnd. 

A source port filter is evaluated by testing whether the source port identified in the IP header falls within the range of values between HdrSrcPortStart and HdrSrcPortEnd, INCLUDING these two end points. 

If a value for this property is not provided, then the filter does not consider HdrSrcPortEnd in selecting matching packets, i.e., there is no upper bound in matching source port values."))
                :INITFORM NIL)
               (HDRDESTPORTSTART UINT16 :CIM-NAME "HdrDestPortStart"
                :QUALIFIERS
                ((:DESCRIPTION
                  "HdrDestPortStart represents the lower end of a range of UDP or TCP destination ports. The upper end of the range is represented by the HdrDestPortEnd property. The value of HdrDestPortStart MUST be no greater than the value of HdrDestPortEnd. A single port is indicated by equal values for HdrDestPortStart and HdrDestPortEnd. 

A destination port filter is evaluated by testing whether the destination port identified in the IP header falls within the range of values between HdrDestPortStart and HdrDestPortEnd, INCLUDING these two end points. 

If a value for this property is not provided, then the filter does not consider HdrDestPortStart in selecting matching packets, i.e., there is no lower bound in matching destination port values."))
                :INITFORM NIL)
               (HDRDESTPORTEND UINT16 :CIM-NAME "HdrDestPortEnd" :QUALIFIERS
                ((:DESCRIPTION
                  "HdrDestPortEnd represents the upper end of a range of UDP or TCP destination ports. The lower end of the range is represented by the HdrDestPortStart property. The value of HdrDestPortEnd MUST be no less than the value of HdrDestPortStart. A single port is indicated by equal values for HdrDestPortStart and HdrDestPortEnd. 

A destination port filter is evaluated by testing whether the destination port identified in the IP header falls within the range of values between HdrDestPortStart and HdrDestPortEnd, INCLUDING these two end points. 

If a value for this property is not provided, then the filter does not consider HdrDestPortEnd in selecting matching packets, i.e., there is no upper bound in matching destination port values."))
                :INITFORM NIL)
               (SYSTEMCREATIONCLASSNAME STRING :CIM-NAME
                "SystemCreationClassName" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The scoping ComputerSystem's CreationClassName.")
                 (:MAX-LEN "256")
                 (:PROPOGATED "CIM_ComputerSystem.CreationClassName"))
                :INITFORM NIL)
               (SYSTEMNAME STRING :CIM-NAME "SystemName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping ComputerSystem's Name.")
                 (:MAX-LEN "256") (:PROPOGATED "CIM_ComputerSystem.Name"))
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
                  "The Name property defines the label by which the Filter Entry is known and uniquely identified.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (ISNEGATED BOOLEAN :CIM-NAME "IsNegated" :QUALIFIERS
                ((:DESCRIPTION
                  "Boolean indicating that the match condition described in the properties of the FilterEntryBase subclass should be negated. This property is defined for ease of use when filtering on simple negations - for example, to select all source ports except 162. It is not recommended that this Boolean be set to True when filtering on multiple criteria, such as defining an IPHeadersFilter based on source/destination addresses, ports, and DiffServ Code Points."))
                :INITFORM NIL)
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
               (DESCRIPTION STRING :CIM-NAME "Description" :QUALIFIERS
                ((:DESCRIPTION
                  "The Description property provides a textual description of the object."))
                :INITFORM NIL)
               (ELEMENTNAME STRING :CIM-NAME "ElementName" :QUALIFIERS
                ((:DESCRIPTION
                  "A user-friendly name for the object. This property allows each instance to define a user-friendly name in addition to its key properties, identity data, and description information. 
Note that the Name property of ManagedSystemElement is also defined as a user-friendly name. But, it is often subclassed to be a Key. It is not reasonable that the same property can convey both identity and a user-friendly name, without inconsistencies. Where Name exists and is not a Key (such as for instances of LogicalDevice), the same information can be present in both the Name and ElementName properties. Note that if there is an associated instance of CIM_EnabledLogicalElementCapabilities, restrictions on this properties may exist as defined in ElementNameMask and MaxElementNameLen properties defined in that class."))
                :INITFORM NIL)
               (HDRSRCADDRESS (ARRAY UINT8) :CIM-NAME "HdrSrcAddress"
                :QUALIFIERS
                ((:DESCRIPTION
                  "HdrSrcAddress is an OctetString, of a size determined by the value of the HdrIPVersion property, representing a source IP address. When there is no HdrSrcAddressEndOfRange value, this value is compared to the source address in the IP header, subject to the mask represented in the HdrSrcMask property. (Note that the mask is ANDed with the address.) When there is a HdrSrcAddressEndOfRange value, this value is the start of the specified range (i.e., the HdrSrcAddress is lower than the HdrSrcAddressEndOfRange) that is compared to the source address in the IP header and matches on any value in the range. 

If a value for this property is not provided, then the filter does not consider HdrSrcAddress in selecting matching packets, i.e., HdrSrcAddress matches for all values.")
                 :OCTET-STRING
                 (:MODEL-CORRESPONDENCE ("CIM_IPHeadersFilter.HdrIPVersion")))
                :INITFORM NIL)
               (HDRSRCADDRESSENDOFRANGE (ARRAY UINT8) :CIM-NAME
                "HdrSrcAddressEndOfRange" :QUALIFIERS
                ((:DESCRIPTION
                  "HdrSrcAddressEndOfRange is an OctetString, of a size determined by the value of the HdrIPVersion property, representing the end of a range of source IP addresses (inclusive), where the start of the range is the HdrSrcAddress property value. 

If a value for HdrSrcAddress is not provided, then this property also MUST NOT be provided. If a value for this property is provided, then HdrSrcMask MUST NOT be provided.")
                 :OCTET-STRING
                 (:MODEL-CORRESPONDENCE ("CIM_IPHeadersFilter.HdrIPVersion")))
                :INITFORM NIL)
               (HDRSRCMASK (ARRAY UINT8) :CIM-NAME "HdrSrcMask" :QUALIFIERS
                ((:DESCRIPTION
                  "HdrSrcMask is an OctetString, of a size determined by the value of the HdrIPVersion property, representing a mask to be used in comparing the source address in the IP header with the value represented in the HdrSrcAddress property. 

If a value for this property is not provided, then the filter does not consider HdrSrcMask in selecting matching packets, i.e., the value of the HdrSrcAddress or the source address range must match the source address in the packet exactly. If a value for this property is provided, then HdrSrcAddressEndOfRange MUST NOT be provided.")
                 :OCTET-STRING
                 (:MODEL-CORRESPONDENCE ("CIM_IPHeadersFilter.HdrIPVersion")))
                :INITFORM NIL)
               (HDRDESTADDRESS (ARRAY UINT8) :CIM-NAME "HdrDestAddress"
                :QUALIFIERS
                ((:DESCRIPTION
                  "HdrDestAddress is an OctetString, of a size determined by the value of the HdrIPVersion property, representing a destination IP address. When there is no HdrDestAddressEndOfRange value, this value is compared to the destination address in the IP header, subject to the mask represented in the HdrDestMask property. (Note that the mask is ANDed with the address.) When there is a HdrDestAddressEndOfRange value, this value is the start of the specified range (i.e., the HdrDestAddress is lower than the HdrDestAddressEndOfRange) that is compared to the source address in the IP header and matches on any value in the range. 

If a value for this property is not provided, then the filter does not consider HdrDestAddress in selecting matching packets, i.e., HdrDestAddress matches for all values.")
                 :OCTET-STRING
                 (:MODEL-CORRESPONDENCE ("CIM_IPHeadersFilter.HdrIPVersion")))
                :INITFORM NIL)
               (HDRDESTADDRESSENDOFRANGE (ARRAY UINT8) :CIM-NAME
                "HdrDestAddressEndOfRange" :QUALIFIERS
                ((:DESCRIPTION
                  "HdrDestAddressEndOfRange is an OctetString, of a size determined by the value of the HdrIPVersion property, representing the end of a range of destination IP addresses (inclusive), where the start of the range is the HdrDestAddress property value. 

If a value for HdrDestAddress is not provided, then this property also MUST NOT be provided. If a value for this property is provided, then HdrDestMask MUST NOT be provided.")
                 :OCTET-STRING
                 (:MODEL-CORRESPONDENCE ("CIM_IPHeadersFilter.HdrIPVersion")))
                :INITFORM NIL)
               (HDRDESTMASK (ARRAY UINT8) :CIM-NAME "HdrDestMask" :QUALIFIERS
                ((:DESCRIPTION
                  "HdrDestMask is an OctetString, of a size determined by the value of the HdrIPVersion property, representing a mask to be used in comparing the destination address in the IP header with the value represented in the HdrDestAddress property. 

If a value for this property is not provided, then the filter does not consider HdrDestMask in selecting matching packets, i.e., the value of the HdrDestAddress or the destination address range must match the destination address in the packet exactly. If a value for this property is provided, then HdrDestAddressEndOfRange MUST NOT be provided.")
                 :OCTET-STRING
                 (:MODEL-CORRESPONDENCE ("CIM_IPHeadersFilter.HdrIPVersion")))
                :INITFORM NIL)
               (HDRDSCP (ARRAY UINT8) :CIM-NAME "HdrDSCP" :QUALIFIERS
                ((:DESCRIPTION
                  "HdrDSCP is defined as a set of discrete DiffServ code points, with no inherent structure. There is no semantically significant relationship between different HdrDSCPs. Consequently, there is no provision for specifying a range of HdrDSCPs. 

Since, in IPv4, the HdrDSCP field may contain bits to be interpreted as the TOS IP Precedence, this property is also used to filter on IP Precedence. Similarly, the IPv6 Traffic Class field is also filtered using the value(s) in this property. 

HdrDSCP is defined as an array, to provide the ability to specify several discrete DSCPs in a single instance of IPHeadersFilter, that would be OR'ed together to define the filter criteria. 

If a value for this property is not provided, then the filter does not consider HdrDSCP in selecting matching packets, i.e., HdrDSCP matches for all values.")
                 (:MAX-VALUE "63"))
                :INITFORM NIL)
               (HDRFLOWLABEL (ARRAY UINT8) :CIM-NAME "HdrFlowLabel" :QUALIFIERS
                ((:DESCRIPTION
                  "The 20-bit Flow Label field in the IPv6 header may be used by a source to label sequences of packets for which it requests special handling by the IPv6 devices, such as non-default quality of service or 'real-time' service. In the filter, this 20-bit string is encoded in a 24-bit octetstring by right-adjusting the value and padding on the left with b'0000'. 

If a value for this property is not provided, then the filter does not consider HdrFlowLabel in selecting matching packets, i.e., HdrFlowLabel matches for all values.")
                 :OCTET-STRING)
                :INITFORM NIL)
               (OPERATIONALSTATUS (ARRAY UINT16) :CIM-NAME "OperationalStatus"
                :QUALIFIERS
                ((:DESCRIPTION
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
               (STATUSDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "StatusDescriptions" :QUALIFIERS
                ((:DESCRIPTION
                  "Strings describing the various OperationalStatus array values. For example, if \"Stopping\" is the value assigned to OperationalStatus, then this property may contain an explanation as to why an object is being stopped. Note that entries in this array are correlated with those at the same array index in OperationalStatus.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ManagedSystemElement.OperationalStatus")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_IPHeadersFilter")
              (:QUALIFIERS (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Network::Filtering")
               (:DESCRIPTION
                "IPHeadersFilter contains the most commonly required properties for performing filtering on IP, TCP or UDP headers. Properties not present in an instance of the IPHeadersFilter are treated as 'all values'.")))