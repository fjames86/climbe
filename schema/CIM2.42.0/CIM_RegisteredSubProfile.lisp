
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_RegisteredSubProfile.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_REGISTEREDSUBPROFILE (CIM_REGISTEREDPROFILE)
              ((SPECIFICATIONTYPE UINT16 :CIM-NAME "SpecificationType"
                :QUALIFIERS
                ((:OVERRIDE "SpecificationType")
                 (:DESCRIPTION
                  "If this property has a value other than null, the value shall be 2")
                 (:VALUE-MAP ("2")) (:VALUES ("Profile"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_RegisteredSpecification.OtherSpecificationType")))
                :INITFORM NIL)
               (INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. In order to ensure uniqueness within the NameSpace, the value of InstanceID shall be constructed using the following 'preferred' algorithm: 
: 
Where and are separated by a colon ':', and where shall include a copyrighted, trademarked or otherwise unique name that is owned by the business entity creating/defining the InstanceID, or is a registered ID that is assigned to the business entity by a recognized global authority. (This is similar to the _ structure of Schema class names.) In addition, to ensure uniqueness, shall not contain a colon (':'). The first colon to appear in InstanceID shall appear between and . is chosen by the organizational entity and should not be re-used to identify different underlying (real-world) elements. 
For DMTF defined instances, shall be set to 'CIM'."))
                :INITFORM NIL)
               (OTHERSPECIFICATIONTYPE STRING :CIM-NAME
                "OtherSpecificationType" :QUALIFIERS
                ((:DESCRIPTION
                  "OtherSpecificationType shall be a a free-form string providing a description of the specification type if 1, \"Other\" is specified for the SpecificationType.")
                 (:MAX-LEN "256")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_RegisteredSpecification.SpecificationType")))
                :INITFORM NIL)
               (REGISTEREDORGANIZATION UINT16 :CIM-NAME
                "RegisteredOrganization" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "The organization that defines this specification. 
\"The Green Grid\" identifies \"The Green Grid Association\"")
                 (:VALUE-MAP
                  ("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14"
                   "15" "16" "17" "18" "19" "20" "21" ".."))
                 (:VALUES
                  ("Other" "DMTF" "CompTIA" "Consortium for Service Innovation"
                   "FAST" "GGF" "INTAP" "itSMF" "NAC"
                   "Northwest Energy Efficiency Alliance" "SNIA" "TM Forum"
                   "The Open Group" "ANSI" "IEEE" "IETF" "INCITS" "ISO" "W3C"
                   "OGF" "The Green Grid" "DMTF Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_RegisteredSpecification.OtherRegisteredOrganization")))
                :INITFORM NIL)
               (OTHERREGISTEREDORGANIZATION STRING :CIM-NAME
                "OtherRegisteredOrganization" :QUALIFIERS
                ((:DESCRIPTION
                  "OtherRegisteredOrganization shall be a a free-form string providing a description of the organization if 1, \"Other\" is specified for the RegisteredOrganization.")
                 (:MAX-LEN "256")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_RegisteredSpecification.RegisteredOrganization")))
                :INITFORM NIL)
               (REGISTEREDNAME STRING :CIM-NAME "RegisteredName" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "The name of this registered specification. Since multiple versions can exist for the same RegisteredName, the combination of RegisteredName, RegisteredOrganization, and RegisteredVersion shall uniquely identify the registered specification within the scope of the organization. 
The value of this property shall correspond to the name given to the set of versioned constraints by a specification or standard. The value does not identify the name of the document or publishing media, unless it happens to be the same as the name given to the versioned constraints.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (REGISTEREDVERSION STRING :CIM-NAME "RegisteredVersion"
                :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "The version describing the creation or last modificationof the specification. The string representing the version shall be in the form: 
M + \".\" + N + \".\" + U 
Where: 
M - The major version (in numeric form). 
N - The minor version (in numeric form). 
U - The update (e.g. errata, patch, ..., in numeric form)."))
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
               (IMPLEMENTEDFEATURES (ARRAY STRING) :CIM-NAME
                "ImplementedFeatures" :QUALIFIERS
                ((:DESCRIPTION
                  "Profiles may gather a set of provisions together that are implemented, (or not implemented), as a whole by a conformant implementation. Such sets are known as profile features.
If a profile does not define features, then this property shall be null. 
If not null, an implementation shall put the profile defined feature name of each implemented feature in a separate entry of this array."))
                :INITFORM NIL)
               (ADVERTISETYPES (ARRAY UINT16) :CIM-NAME "AdvertiseTypes"
                :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "This property identifies the requested network advertisement for specification information. It is used by the advertising services of the WBEM infrastructure to determine what should be advertised, via what mechanisms. The property is an array so that the specification may be advertised using several mechanisms. If an array entry has a value of 2 (Not Advertised), this shall be the only array entry.")
                 (:VALUE-MAP ("1" "2" "3" "4"))
                 (:VALUES ("Other" "Not Advertised" "SLP" "WS-Identify"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_RegisteredSpecification.AdvertiseTypeDescriptions")))
                :INITFORM NIL)
               (ADVERTISETYPEDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "AdvertiseTypeDescriptions" :QUALIFIERS
                ((:DESCRIPTION
                  "A free-form string identifying the requested network advertisement for specification information for cases where the predefined values in AdvertiseTypes are not sufficient. Each entry in this array corresponds to the entry in the AdvertiseTypes array at the same index, and the two arrays shall have the same number of entries. A non-Null value shall be provided for each array entry that corresponds to an AdvertiseTypes entry with a value of 1 (Other). Other array entries should be Null.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_RegisteredSpecification.AdvertiseTypes")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_RegisteredSubProfile")
              (:QUALIFIERS (:DEPRECATED ("CIM_RegisteredProfile"))
               (:VERSION "2.37.0") (:UML-PACKAGE-PATH "CIM::Interop")
               (:DESCRIPTION
                "A RegisteredSubProfile subclasses RegisteredProfile to indicate that a scoping profile is required to provide context. The latter is specified by the mandatory association, SubProfileRequiresProfile.")))
(DEFCIM-METHOD CLOSECONFORMANTINSTANCES
    ((INSTANCE CIM_REGISTEREDSUBPROFILE)
     (ENUMERATIONCONTEXT STRING "EnumerationContext"
      (:DESCRIPTION
       "The EnumerationContext parameter is the enumeration context value representing the enumeration session to be used.")))
    ((:CIM-NAME "CloseConformantInstances")
     (:QUALIFIERS (:DEPRECATED ("CIM_RegisteredProfile.GetCentralInstances"))
      (:DESCRIPTION
       "This operation is used to close a session to enumerate central and scoping class instances.")
      (:VALUE-MAP ("0" "1" ".."))
      (:VALUES ("Completed with No Error" "Not Supported" "DMTF Reserved")))))
(DEFCIM-METHOD OPENCONFORMANTINSTANCES
    ((INSTANCE CIM_REGISTEREDSUBPROFILE)
     (RESULTCLASS STRING "ResultClass"
      (:DESCRIPTION
       "NULL, or a class name that acts as a filter to select only those central or scoping instances that a kind of the specified class. This is useful to select particular subclasses or to select a particular instances when more than one is defined for a profile."))
     (OPERATIONTIMEOUT UINT32 "OperationTimeout"
      (:DESCRIPTION
       "The operation timeout is the minimum time the CIM Server shall maintain the open enumeration session after the last OpenConformantInstances or PullConformantInstances invocation, (unless the enumeration session was closed during that last invocation). If the operation timeout is exceeded, the enumeration session may be closed at any time, releasing any possibly allocated resources related to the enumeration session. 
An OperationTimeout of 0 means that there is no operation timeout, i.e. the enumeration session is never closed based on time.
If OperationTimeout is NULL, the operation timeout is implementation dependent. 
All other values for OperationTimeout specify the operation timeout in seconds.
The implementation may restrict the set of allowable values for OperationTimeout. This specifically includes the possibility to not allow 0 (no timeout).
If the specified value is not an allowable value, the method shall return failure with return code CIM_ERR_INVALID_OPERATION_TIMEOUT."))
     (CONTINUEONERROR BOOLEAN "ContinueOnError"
      (:DESCRIPTION
       "TRUE requests continuation on error. Continuation on error is the ability to resume an enumeration session successfully after an invocation of this method that returned an error. A conformant implementation may support continuation on error.
If ContinueOnError is true and the method does not support continuation on error, it shall return failure with return code CIM_ERR_CONTINUATION_ON_ERROR_NOT_SUPPORTED 
If the implementation supports continuation on error, it shall support it as follows: If ContinueOnErroris true, the enumeration session shall remain open when this or a subsequent PullConformantInstances invocation returns failure, and any subsequent successful PullConformantInstances operations process the set of instances that would have remained if the failing invocation had been successful, subject to the consistency rules defined for pulled enumerations, see DSP0223.
If ContinueOnError is false, the enumeration session shall be closed when this method returns failure."))
     (MAXOBJECTCOUNT UINT32 "MaxObjectCount"
      (:DESCRIPTION
       "The MaxObjectCount input parameter defines the maximum number of elements that may be returned by this Pull operation. Any uint32 number is valid, including 0. The implementation may deliver any number of elements up to MaxObjectCount but shall not deliver more than MaxObjectCount.elements. The CIM Client may use a MaxObjectCount value of 0 as a means of restarting the OperationTimeout for the enumeration session, while it wishes to not retrieve any elements."))
     (ENUMERATIONCONTEXT STRING "EnumerationContext" :IN :OUT
      (:DESCRIPTION
       "The EnumerationContext parameter is the enumeration context value representing the enumeration session to be used.
If the session is closed as a result of this invocation, the output EnumerationContext shall be NULL. Otherwise, the output EnumerationContext shall provide the information necessary for a subsequent PullConformantInstances call."))
     (ENDOFSEQUENCE BOOLEAN "EndOfSequence" :IN :OUT
      (:DESCRIPTION
       "The EndOfSequence output parameter indicates to the CIM Client whether the enumeration session is exhausted. If EndOfSequence is true upon successful completion of this invocation, no more elements are available and the implmeentation shall close the enumeration session, releasing any possibly allocated resources related to the enumeration session. If EndOfSequence is false, there may be additional elements available and implementation shall not close the enumeration session."))
     (INCLUDEDPROPERTYLIST (ARRAY STRING) "IncludedPropertyList"
      (:DESCRIPTION
       "NULL, or unordered set of property names, acting as a restricting filter on the properties included in the returned instance. An empty list specifies to return no properties. The instance path shall always be returned."))
     (INSTANCETYPE (ARRAY UINT16) "InstanceType" :IN :OUT
      (:DESCRIPTION
       "On successful completion, an array corresponding to the InstanceWithPathList that indicates whether the entry is a scoping instance, a central instance, or both.")
      (:VALUE-MAP ("2" "3" "4" ".."))
      (:VALUES
       ("Central Instance" "Scoping Instance" "Central and Scoping Instance"
        "DMTF Reserved"))
      (:ARRAYTYPE "Indexed")
      (:MODEL-CORRESPONDENCE
       ("CIM_RegisteredProfile.OpenConformantInstances(InstanceWithPathList)")))
     (INSTANCEWITHPATHLIST (ARRAY STRING) "InstanceWithPathList" :IN :OUT
      (:DESCRIPTION
       "On successful completion, an correlated, but unordered set of the enumerated instances and their addresses, with a number of entries from 0, up to a maximum defined by MaxObjectCount, that meet the criteria defined in the Open operation that established this enumeration session. Note that returning no entries in the array does not imply that the enumeration session has been exhausted. Only the EndOfSequence output parameter indicates whether the enumeration session has been exhausted.")
      (:EMBEDDED-INSTANCE "CIM_ManagedElement") (:ARRAYTYPE "Indexed")
      (:MODEL-CORRESPONDENCE
       ("CIM_RegisteredProfile.OpenConformantInstances(InstanceType)"))))
    ((:CIM-NAME "OpenConformantInstances")
     (:QUALIFIERS (:DEPRECATED ("CIM_RegisteredProfile.GetCentralInstances"))
      (:DESCRIPTION
       "This operation is used to establish and open a session to enumerate central and scoping class instances of this registered profile instance and optionally to retrieve a first set of such instances.")
      (:VALUE-MAP ("0" "1" "22" "26" ".."))
      (:VALUES
       ("Completed with No Error" "Not Supported"
        "CIM_ERR_INVALID_OPERATION_TIMEOUT"
        "CIM_ERR_CONTINUATION_ON_ERROR_NOT_SUPPORTED" "DMTF Reserved")))))
(DEFCIM-METHOD PULLCONFORMANTINSTANCES
    ((INSTANCE CIM_REGISTEREDSUBPROFILE)
     (MAXOBJECTCOUNT UINT32 "MaxObjectCount"
      (:DESCRIPTION
       "The MaxObjectCount input parameter defines the maximum number of elements that may be returned by this method. Any uint32 number is valid, including 0. The implementation may deliver any number of elements up to MaxObjectCount but shall not deliver more than MaxObjectCount elements. The CIM Client may use a MaxObjectCount value of 0 as a means of restarting the OperationTimeout for the enumeration session, while it wishes to not retrieve any elements."))
     (ENUMERATIONCONTEXT STRING "EnumerationContext" :OUT
      (:DESCRIPTION
       "The EnumerationContext parameter is the enumeration context value representing the enumeration session to be used.
On input, it shall be the EnumerationContext ouput value from the previous invocation of OpenConformantInstances or PullConformantInstances within an open enumeration session.If the session is closed as a result of this invocation, the output EnumerationContext shall be NULL. Otherwise, the output EnumerationContext shall provide the information necessary for a subsequent PullConformantInstances call."))
     (ENDOFSEQUENCE BOOLEAN "EndOfSequence" :IN :OUT
      (:DESCRIPTION
       "The EndOfSequence output parameter indicates to the CIM Client whether the enumeration session is exhausted. If EndOfSequence is true upon successful completion of this method, no more elements are available and the enumeration session shall be closed, releasing any possibly allocated resources related to the enumeration session. If EndOfSequence is false, there may be additional elements available and enumeration session shall be remain open unless there is an error in which case, ContinueOnError governs whether or not the session is closed or not."))
     (INSTANCETYPE (ARRAY UINT16) "InstanceType" :IN :OUT
      (:DESCRIPTION
       "On successful completion, an array corresponding to the InstanceWithPathList that indicates whether the entry is a scoping instance, a central instance, or both.")
      (:VALUE-MAP ("2" "3" "4" ".."))
      (:VALUES
       ("Central Instance" "Scoping Instance" "Central and Scoping Instance"
        "DMTF Reserved"))
      (:ARRAYTYPE "Indexed")
      (:MODEL-CORRESPONDENCE
       ("CIM_RegisteredProfile.PullConformantInstances(InstanceWithPathList)")))
     (INSTANCEWITHPATHLIST (ARRAY STRING) "InstanceWithPathList" :IN :OUT
      (:DESCRIPTION
       "On successful completion, a correlated, but unordered set of the enumerated instances and their addresses, with a number of entries from 0, up to a maximum defined by MaxObjectCount, that meet the criteria defined in the OpenConformantInstances operation that established this enumeration session. Note that returning no entries in the array does not imply that the enumeration session has been exhausted. Only the EndOfSequence output parameter indicates whether the enumeration session has been exhausted.")
      (:EMBEDDED-INSTANCE "CIM_ManagedElement") (:ARRAYTYPE "Indexed")
      (:MODEL-CORRESPONDENCE
       ("CIM_RegisteredProfile.PullConformantInstances(InstanceType)"))))
    ((:CIM-NAME "PullConformantInstances")
     (:QUALIFIERS (:DEPRECATED ("CIM_RegisteredProfile.GetCentralInstances"))
      (:DESCRIPTION
       "This operation is used to continue enumeration central class instances in the context of a session established by OpenConformantInstances.")
      (:VALUE-MAP ("0" "1" "21" ".."))
      (:VALUES
       ("Completed with No Error" "Not Supported"
        "CIM_ERR_INVALID_ENUMERATION_CONTEXT" "DMTF Reserved")))))
(DEFCIM-METHOD GETCENTRALINSTANCES
    ((INSTANCE CIM_REGISTEREDSUBPROFILE)
     (CENTRALINSTANCES "CIM_ManagedElement" "CentralInstances" :IN :OUT
      (:DESCRIPTION
       "The CentralInstances output parameter will include zero or more references to central instances for the profile.")))
    ((:CIM-NAME "GetCentralInstances")
     (:QUALIFIERS
      (:DESCRIPTION
       "GetCentralInstances will get all the references of the central instances for the profile represented by this instance. If this method completes without an error, it shall return 0, otherwise it shall return an error with zero or more CIM_Error instances.")
      (:VALUE-MAP ("0")) (:VALUES ("Completed with no error")))))