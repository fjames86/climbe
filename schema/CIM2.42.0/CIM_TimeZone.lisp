
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_TimeZone.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_TIMEZONE (CIM_SETTING)
              ((TIMEZONEID STRING :CIM-NAME "TimeZoneID" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "Time zone identifier. The Id MAY be expressed in the form 'area name/city name' (e.g., \"America/New_York\"), or as a time zone name (for example, EST or EDT)."))
                :INITFORM NIL)
               (TIMEZONESTARTDATE DATETIME :CIM-NAME "TimeZoneStartDate"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The date and time at which this time zone definition takes effect. The value is specified in UTC."))
                :INITFORM NIL)
               (STANDARDNAME STRING :CIM-NAME "StandardName" :QUALIFIERS
                ((:DESCRIPTION
                  "Full name of the 'standard' time zone (e.g., \"U.S. Eastern Standard Time\"), suitable for presentation to the user in the default locale.")
                 (:MODEL-CORRESPONDENCE ("CIM_TimeZone.StandardCaption")))
                :INITFORM NIL)
               (STANDARDCAPTION STRING :CIM-NAME "StandardCaption" :QUALIFIERS
                ((:DESCRIPTION
                  "Short name of the 'standard' time zone (e.g., \"EST\"), suitable for presentation to the user in the default locale. Note that a specific StandardCaption property is defined, instead of using the inherited Caption. This is done to force consistent property naming for the StandardXXX and DaylightXXX properties.")
                 (:MODEL-CORRESPONDENCE ("CIM_TimeZone.StandardName")))
                :INITFORM NIL)
               (STANDARDOFFSET SINT32 :CIM-NAME "StandardOffset" :QUALIFIERS
                ((:DESCRIPTION
                  "The number of minutes by which this 'standard' time differs from UTC. For example, U.S. EST differs from UTC by -5.0 hours or -300 minutes, whereas Australia Adelaide Standard Time differs by 9.5 hours or 570 minutes.")
                 (NIL "Minutes"))
                :INITFORM NIL)
               (STANDARDMONTH UINT8 :CIM-NAME "StandardMonth" :QUALIFIERS
                ((:DESCRIPTION
                  "The month in which daylight saving time ends (and 'standard' time begins). Specify 0 for January, 1 for February, and so on.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11"))
                 (:VALUES
                  ("January" "February" "March" "April" "May" "June" "July"
                   "August" "September" "October" "November" "December"))
                 (:MODEL-CORRESPONDENCE ("CIM_TimeZone.StandardDay")))
                :INITFORM NIL)
               (STANDARDDAY SINT8 :CIM-NAME "StandardDay" :QUALIFIERS
                ((:DESCRIPTION
                  "There are two different interpretations for this property, depending on the value of StandardDayOfWeek. In one case, StandardDay defines the day-in-month on which daylight saving time ends. This interpretation is used when the StandardDayOfWeek is 0. A positive or negative integer is specified to indicate whether the StandardDay should be calculated from the beginning or the end of the month. For example, 5 indicates the fifth day in the StandardMonth and -1 indicates the last day in the StandardMonth. 

When StandardDayOfWeek is not 0, StandardDay is the day- in-month on which daylight saving time ends, defined in conjunction with StandardDayOfWeek. For example, if StandardDay is 15 and StandardDayOfWeek is Saturday, then daylight saving time ends on the first Saturday on or after the 15th day in the StandardMonth (i.e., the third Saturday in the month). If StandardDay is 20 and StandardDayOfWeek is -Saturday, then this indicates the first Saturday on or before the 20th day in the StandardMonth. If StandardDay is -1 and StandardDayOfWeek is -Sunday, then this indicates the last Sunday in the StandardMonth.")
                 (:MIN-VALUE "-31") (:MAX-VALUE "31")
                 (:MODEL-CORRESPONDENCE ("CIM_TimeZone.StandardDayOfWeek")))
                :INITFORM NIL)
               (STANDARDDAYOFWEEK SINT8 :CIM-NAME "StandardDayOfWeek"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Positive or negative integer used in conjunction with StandardDay to indicate the day of the week on which daylight saving time ends (and 'standard' time begins). StandardDayOfWeek is set to 0 to indicate an exact day of the month, such as March 1. A positive integer (representing Sunday, Monday, ..., Saturday) means that the day of week is found on or after the specified StandardDay. A negative integer (representing -Sunday, -Monday, ..., -Saturday) means that the day of week is found on or before the StandardDay.")
                 (:VALUE-MAP
                  ("-7" "-6" "-5" "-4" "-3" "-2" "-1" "0" "1" "2" "3" "4" "5"
                   "6" "7"))
                 (:VALUES
                  ("-Saturday" "-Friday" "-Thursday" "-Wednesday" "-Tuesday"
                   "-Monday" "-Sunday" "ExactDayOfMonth" "Sunday" "Monday"
                   "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday"))
                 (:MODEL-CORRESPONDENCE ("CIM_TimeZone.StandardDay")))
                :INITFORM NIL)
               (STANDARDSTARTINTERVAL DATETIME :CIM-NAME
                "StandardStartInterval" :QUALIFIERS
                ((:DESCRIPTION
                  "The time interval after midnight when daylight saving time ends. For example, 
00000000020000.000000:000 
indicates that daylight saving time ends at two o'clock, local time (usually, daylight saving time)."))
                :INITFORM NIL)
               (DAYLIGHTNAME STRING :CIM-NAME "DaylightName" :QUALIFIERS
                ((:DESCRIPTION
                  "Full name of the 'daylight' time zone (e.g., \"U.S. Eastern Daylight Saving Time\"), suitable for presentation to the user in the default locale.")
                 (:MODEL-CORRESPONDENCE ("CIM_TimeZone.DaylightCaption")))
                :INITFORM NIL)
               (DAYLIGHTCAPTION STRING :CIM-NAME "DaylightCaption" :QUALIFIERS
                ((:DESCRIPTION
                  "Short name of the 'daylight' time zone (e.g., \"EDT\"), suitable for presentation to the user in the default locale. Note that a specific DaylightCaption property is defined, instead of using the inherited Caption. This is done to force consistent property naming for the StandardXXX and DaylightXXX properties.")
                 (:MODEL-CORRESPONDENCE ("CIM_TimeZone.DaylightName")))
                :INITFORM NIL)
               (DAYLIGHTOFFSET SINT32 :CIM-NAME "DaylightOffset" :QUALIFIERS
                ((:DESCRIPTION
                  "The number of minutes by which this daylight saving time differs from UTC. For example, U.S. EDT differs from UTC by -4.0 hours or -240 minutes, whereas Australia Adelaide Daylight Time differs by 10.5 hours or 630 minutes.")
                 (NIL "Minutes"))
                :INITFORM NIL)
               (DAYLIGHTMONTH UINT8 :CIM-NAME "DaylightMonth" :QUALIFIERS
                ((:DESCRIPTION
                  "The month in which daylight saving time starts. Specify 0 for January, 1 for February, and so on.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11"))
                 (:VALUES
                  ("January" "February" "March" "April" "May" "June" "July"
                   "August" "September" "October" "November" "December"))
                 (:MODEL-CORRESPONDENCE ("CIM_TimeZone.DaylightDay")))
                :INITFORM NIL)
               (DAYLIGHTDAY SINT8 :CIM-NAME "DaylightDay" :QUALIFIERS
                ((:DESCRIPTION
                  "There are two different interpretations for this property, depending on the value of DaylightDayOfWeek. In one case, DaylightDay defines the day-in-month on which daylight saving time starts. This interpretation is used when the DaylightDayOfWeek is 0. A positive or negative integer is specified to indicate whether the DaylightDay should be calculated from the beginning or the end of the month. For example, 5 indicates the fifth day in the DaylightMonth and -1 indicates the last day in the DaylightMonth. 

When DaylightDayOfWeek is not 0, DaylightDay is the day- in-month on which daylight saving time starts, defined in conjunction with DaylightDayOfWeek. For example, if DaylightDay is 15 and DaylightDayOfWeek is Saturday, then daylight saving time starts on the first Saturday on or after the 15th day in the DaylightMonth (i.e., the third Saturday in the month). If DaylightDay is 20 and DaylightDayOfWeek is -Saturday, then this indicates the first Saturday on or before the 20th day in the DaylightMonth. If DaylightDay is -1 and DaylightDayOfWeek is -Sunday, then this indicates the last Sunday in the month.")
                 (:MIN-VALUE "-31") (:MAX-VALUE "31")
                 (:MODEL-CORRESPONDENCE ("CIM_TimeZone.DaylightDayOfWeek")))
                :INITFORM NIL)
               (DAYLIGHTDAYOFWEEK SINT8 :CIM-NAME "DaylightDayOfWeek"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Positive or negative integer used in conjunction with DaylightDay to indicate the day of the week on which daylight saving time starts. Set DaylightDayOfWeek to 0 to indicate an exact day of month, such as March 1. Positive integer (Sunday, Monday, ..., Saturday) means that the day of week is found on or after DaylightDay. Negative integer (-Sunday, -Monday, ..., -Saturday) means that the day of week is found on or before DaylightDay.")
                 (:VALUE-MAP
                  ("-7" "-6" "-5" "-4" "-3" "-2" "-1" "0" "1" "2" "3" "4" "5"
                   "6" "7"))
                 (:VALUES
                  ("-Saturday" "-Friday" "-Thursday" "-Wednesday" "-Tuesday"
                   "-Monday" "-Sunday" "ExactDayOfMonth" "Sunday" "Monday"
                   "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday"))
                 (:MODEL-CORRESPONDENCE ("CIM_TimeZone.DaylightDay")))
                :INITFORM NIL)
               (DAYLIGHTSTARTINTERVAL DATETIME :CIM-NAME
                "DaylightStartInterval" :QUALIFIERS
                ((:DESCRIPTION
                  "The time interval after midnight when daylight saving time starts. For example, 
00000000020000.000000:000 
indicates that daylight saving time starts at two o'clock, local time (usually, standard time)."))
                :INITFORM NIL)
               (SETTINGID STRING :CIM-NAME "SettingID" :QUALIFIERS
                ((:DESCRIPTION
                  "The identifier by which the Setting object is known.")
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
              (:CIM-NAME "CIM_TimeZone")
              (:QUALIFIERS (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::System::Time")
               (:DESCRIPTION
                "The TimeZone class is a set of properties defining a particular time zone. These properties include the concept of daylight saving time.")))
(DEFCIM-METHOD VERIFYOKTOAPPLYTOMSE
    ((INSTANCE CIM_TIMEZONE)
     (TIMETOAPPLY DATETIME "TimeToApply" :IN
      (:DESCRIPTION
       "TimeToApply can be either a specific time or a time interval."))
     (MUSTBECOMPLETEDBY DATETIME "MustBeCompletedBy" :IN
      (:DESCRIPTION "The required completion time for the method."))
     (MSE "CIM_ManagedSystemElement" "MSE" :IN
      (:DESCRIPTION "The ManagedSystemElement that is being verified.")))
    ((:CIM-NAME "VerifyOKToApplyToMSE")
     (:QUALIFIERS
      (:DESCRIPTION
       "The VerifyOKToApplyToMSE method is used to verify that this Setting can be applied to the referenced ManagedSystemElement at the given time or time interval. This method takes three input parameters: MSE (the Managed SystemElement that is being verified), TimeToApply (which, being a datetime, can be either a specific time or a time interval), and MustBeCompletedBy (which indicates the required completion time for the method). The return value should be 0 if it is okay to apply the Setting, 1 if the method is not supported, 2 if the Setting cannot be applied within the specified times, and any other number if an error occurred. In a subclass, the set of possible return codes could be specified using a ValueMap qualifier on the method. The strings to which the ValueMap contents are \"translated\" can also be specified in the subclass as a Values array qualifier."))))
(DEFCIM-METHOD APPLYTOMSE
    ((INSTANCE CIM_TIMEZONE)
     (TIMETOAPPLY DATETIME "TimeToApply" :IN
      (:DESCRIPTION
       "TimeToApply can be either a specific time or a time interval."))
     (MUSTBECOMPLETEDBY DATETIME "MustBeCompletedBy" :IN
      (:DESCRIPTION "The required completion time for the method."))
     (MSE "CIM_ManagedSystemElement" "MSE" :IN
      (:DESCRIPTION
       "The ManagedSystemElement to which the Setting is being applied.")))
    ((:CIM-NAME "ApplyToMSE")
     (:QUALIFIERS
      (:DESCRIPTION
       "The ApplyToMSE method performs the actual application of the Setting to the referenced ManagedSystemElement. It takes three input parameters: MSE (the ManagedSystemElement to which the Setting is being applied), TimeToApply (which, being a datetime, can be either a specific time or a time interval), and MustBeCompletedBy (which indicates the required completion time for the method). Note that the semantics of this method are that individual Settings are either wholly applied or not applied at all to their target ManagedSystemElement. The return value should be 0 if the Setting is successfully applied to the referenced ManagedSystemElement, 1 if the method is not supported, 2 if the Setting was not applied within the specified times, and any other number if an error occurred. In a subclass, the set of possible return codes could be specified, using a ValueMap qualifier on the method. The strings to which the ValueMap contents are \"translated\" can also be specified in the subclass as a Values array qualifier. 
Note: If an error occurs when applying the Setting to a ManagedSystemElement, the Element must be configured as it was when the \"Apply\" attempt began. That is, the Element should not be left in an indeterminate state."))))
(DEFCIM-METHOD VERIFYOKTOAPPLYTOCOLLECTION
    ((INSTANCE CIM_TIMEZONE)
     (TIMETOAPPLY DATETIME "TimeToApply" :IN
      (:DESCRIPTION
       "TimeToApply can be either a specific time or a time interval."))
     (MUSTBECOMPLETEDBY DATETIME "MustBeCompletedBy" :IN
      (:DESCRIPTION "The required completion time for the method."))
     (COLLECTION "CIM_CollectionOfMSEs" "Collection" :IN
      (:DESCRIPTION
       "The Collection of ManagedSystemElements that is being verified."))
     (CANNOTAPPLY (ARRAY STRING) "CanNotApply" :IN :OUT
      (:DESCRIPTION
       "A string array that lists the keys of the ManagedSystemElements to which the Setting cannot be applied.")))
    ((:CIM-NAME "VerifyOKToApplyToCollection")
     (:QUALIFIERS
      (:DESCRIPTION
       "The VerifyOKToApplyToCollection method is used to verify that this Setting can be applied to the referenced Collection of ManagedSystemElements, at the given time or time interval, without causing adverse effects to either the Collection itself or its surrounding environment. The net effect is to execute the VerifyOKToApply method against each of the Elements that are aggregated by the Collection. This method takes three input parameters: Collection (the Collection of ManagedSystemElements that is being verified), TimeToApply (which, being a datetime, can be either a specific time or a time interval), and MustBeCompletedBy (which indicates the required completion time for the method). The return value should be 0 if it is okay to apply the Setting, 1 if the method is not supported, 2 if the Setting cannot be applied within the specified times, and any other number if an error occurred. One output parameter, CanNotApply, is defined, which is a string array that lists the keys of the ManagedSystemElements to which the Setting cannot be applied. This parameter enables those Elements to be revisited and either fixed or have other corrective action taken on them. 
In a subclass, the set of possible return codes could be specified, using a ValueMap qualifier on the method. The strings to which the ValueMap contents are \"translated\" can also be specified in the subclass as a Values array qualifier."))))
(DEFCIM-METHOD APPLYTOCOLLECTION
    ((INSTANCE CIM_TIMEZONE)
     (TIMETOAPPLY DATETIME "TimeToApply" :IN
      (:DESCRIPTION
       "TimeToApply can be either a specific time or a time interval."))
     (CONTINUEONERROR BOOLEAN "ContinueOnError" :IN
      (:DESCRIPTION
       "True means to continue processing when an error is encountered."))
     (MUSTBECOMPLETEDBY DATETIME "MustBeCompletedBy" :IN
      (:DESCRIPTION "The required completion time for the method."))
     (COLLECTION "CIM_CollectionOfMSEs" "Collection" :IN
      (:DESCRIPTION "The Collection of ManagedSystemElements to be applied."))
     (CANNOTAPPLY (ARRAY STRING) "CanNotApply" :IN :OUT
      (:DESCRIPTION
       "A string array that lists the keys of the ManagedSystemElements to which the Setting could not be applied.")))
    ((:CIM-NAME "ApplyToCollection")
     (:QUALIFIERS
      (:DESCRIPTION
       "The ApplyToCollection method performs the application of the Setting to the referenced Collection of ManagedSystemElements. The net effect is to execute the ApplyToMSE method against each of the Elements that are aggregated by the Collection. If the input value ContinueOnError is false, this method applies the Setting to all Elements in the Collection until it encounters an error. In the case of an error, the method stops execution, logs the key of the Element that caused the error in the CanNotApply array, and issues a return code of 2. If the input value ContinueOnError is true, then this method applies the Setting to all of the ManagedSystemElements in the Collection, and reports the failed Elements in the array, CanNotApply. For the latter, processing will continue until the method is applied to all Elements in the Collection, regardless of any errors encountered. The key of each ManagedSystemElement to which the Setting could not be applied is logged into the CanNotApply array. This method takes four input parameters: Collection (the Collection of Elements to which the Setting is being applied), TimeToApply (which, being a datetime, can be either a specific time or a time interval), ContinueOnError (true indicates to continue processing when an error is encountered), and MustBeCompletedBy (which indicates the required completion time for the method). The return value should be 0 if the Setting is successfully applied to the referenced Collection, 1 if the method is not supported, 2 if the Setting was not applied within the specified times, 3 if the Setting cannot be applied using the input value for ContinueOnError, and any other number if an error occurred. One output parameter, CanNotApplystring, is defined, which is an array that lists the keys of the ManagedSystemElements to which the Setting could not be applied. This output parameter has meaning only when the ContinueOnError parameter is true. 
In a subclass, the set of possible return codes could be specified using a ValueMap qualifier on the method. The strings to which the ValueMap contents are \"translated\" can also be specified in the subclass as a Values array qualifier. 
Note: If an error occurs when applying the Setting to a ManagedSystemElement in the Collection, the Element must be configured as it was when the \"Apply\" attempt began. That is, the Element should not be left in an indeterminate state."))))
(DEFCIM-METHOD VERIFYOKTOAPPLYINCREMENTALCHANGETOMSE
    ((INSTANCE CIM_TIMEZONE)
     (TIMETOAPPLY DATETIME "TimeToApply" :IN
      (:DESCRIPTION
       "TimeToApply can be either a specific time or a time interval."))
     (MUSTBECOMPLETEDBY DATETIME "MustBeCompletedBy" :IN
      (:DESCRIPTION "The required completion time for the method."))
     (MSE "CIM_ManagedSystemElement" "MSE" :IN
      (:DESCRIPTION
       "The ManagedSystemElement for which the Setting is being verified."))
     (PROPERTIESTOAPPLY (ARRAY STRING) "PropertiesToApply" :IN
      (:DESCRIPTION
       "A list of the property names whose values will be verified.")))
    ((:CIM-NAME "VerifyOKToApplyIncrementalChangeToMSE")
     (:QUALIFIERS
      (:DESCRIPTION
       "The VerifyOKToApplyIncrementalChangeToMSE method is used to verify that a subset of the properties in this Setting can be applied to the referenced ManagedSystemElement at the given time or time interval. This method takes four input parameters: MSE (the ManagedSystemElement that is being verified), TimeToApply (which, being a datetime, can be either a specific time or a time interval), MustBeCompletedBy (which indicates the required completion time for the method), and a PropertiesToApply array (which contains a list of the property names whose values will be verified). If the array is null or empty or contains the string \"ALL\" as a property name, then all Settings properties will be verified. If it is set to \"NONE\", then no Settings properties will be verified. The return value should be 0 if it is okay to apply the Setting, 1 if the method is not supported, 2 if the Setting cannot be applied within the specified times, and any other number if an error occurred. In a subclass, the set of possible return codes could be specified using a ValueMap qualifier on the method. The strings to which the ValueMap contents are \"translated\" can also be specified in the subclass as a Values array qualifier."))))
(DEFCIM-METHOD APPLYINCREMENTALCHANGETOMSE
    ((INSTANCE CIM_TIMEZONE)
     (TIMETOAPPLY DATETIME "TimeToApply" :IN
      (:DESCRIPTION
       "TimeToApply can be either a specific time or a time interval."))
     (MUSTBECOMPLETEDBY DATETIME "MustBeCompletedBy" :IN
      (:DESCRIPTION "The required completion time for the method."))
     (MSE "CIM_ManagedSystemElement" "MSE" :IN
      (:DESCRIPTION
       "The ManagedSystemElement to which the Setting is being applied."))
     (PROPERTIESTOAPPLY (ARRAY STRING) "PropertiesToApply" :IN
      (:DESCRIPTION
       "A list of the property names whose values will be applied.")))
    ((:CIM-NAME "ApplyIncrementalChangeToMSE")
     (:QUALIFIERS
      (:DESCRIPTION
       "The ApplyIncrementalChangeToMSE method performs the actual application of a subset of the properties in the Setting to the referenced ManagedSystemElement. It takes four input parameters: MSE (the ManagedSystem Element to which the Setting is being applied), TimeToApply (which, being a datetime, can be either a specific time or a time interval), MustBeCompletedBy (which indicates the required completion time for the method), and a PropertiesToApply array (which contains a list of the property names whose values will be applied). If a property is not in this list, it will be ignored by the Apply. If the array is null, empty, or contains the string \"ALL\" as a property name, then all Settings properties will be applied. If it is set to \"NONE\", then no Settings properties will be applied. 
Note that the semantics of this method are that individual Settings are either wholly applied or not applied at all to their target ManagedSystemElement. The return value should be 0 if the Setting is successfully applied to the referenced ManagedSystemElement, 1 if the method is not supported, 2 if the Setting was not applied within the specified times, and any other number if an error occurred. In a subclass, the set of possible return codes could be specified using a ValueMap qualifier on the method. The strings to which the ValueMap contents are \"translated\" can also be specified in the subclass as a Values array qualifier. 
Note: If an error occurs when applying the Setting to a ManagedSystemElement, the Element must be configured as it was when the \"Apply\" attempt began. That is, the Element should not be left in an indeterminate state."))))
(DEFCIM-METHOD VERIFYOKTOAPPLYINCREMENTALCHANGETOCOLLECTION
    ((INSTANCE CIM_TIMEZONE)
     (TIMETOAPPLY DATETIME "TimeToApply" :IN
      (:DESCRIPTION
       "TimeToApply can be either a specific time or a time interval."))
     (MUSTBECOMPLETEDBY DATETIME "MustBeCompletedBy" :IN
      (:DESCRIPTION "The required completion time for the method."))
     (COLLECTION "CIM_CollectionOfMSEs" "Collection" :IN
      (:DESCRIPTION
       "The Collection of ManagedSystemElements for which the setting is being verified."))
     (PROPERTIESTOAPPLY (ARRAY STRING) "PropertiesToApply" :IN
      (:DESCRIPTION
       "A list of the property names whose values will be verified."))
     (CANNOTAPPLY (ARRAY STRING) "CanNotApply" :IN :OUT
      (:DESCRIPTION
       "A string array that lists the keys of the ManagedSystemElements to which the Setting cannot be applied.")))
    ((:CIM-NAME "VerifyOKToApplyIncrementalChangeToCollection")
     (:QUALIFIERS
      (:DESCRIPTION
       "The VerifyOKToApplyIncrementalChangeToCollection method is used to verify that a subset of the properties in this Setting can be applied to the referenced Collection of ManagedSystemElements at the given time or time interval, without causing adverse effects to either the Collection itself or its surrounding environment. The net effect is to execute the VerifyOKToApplyIncrementalChangeToMSE method against each of the Elements that are aggregated by the Collection. This method takes four input parameters: Collection (the Collection of ManagedSystemElements that is being verified), TimeToApply (which, being a datetime, can be either a specific time or a time interval), MustBeCompletedBy (which indicates the required completion time for the method), and a PropertiesToApply array (which contains a list of the property names whose values will be verified). If the array is null or empty or contains the string \"all\" as a property name, all Settings properties will be verified. If it is set to \"none\" then no Settings properties will be verified. The return value should be 0 if it is okay to apply the Setting, 1 if the method is not supported, 2 if the Setting cannot be applied within the specified times, and any other number if an error occurred. One output parameter, CanNotApply, is defined, which is a string array that lists the keys of the ManagedSystemElements to which the Setting cannot be applied. This parameter enables those Elements to be revisited and either fixed or have other corrective action taken on them. 
In a subclass, the set of possible return codes could be specified using a ValueMap qualifier on the method. The strings to which the ValueMap contents are \"translated\" can also be specified in the subclass as a Values array qualifier."))))
(DEFCIM-METHOD APPLYINCREMENTALCHANGETOCOLLECTION
    ((INSTANCE CIM_TIMEZONE)
     (TIMETOAPPLY DATETIME "TimeToApply" :IN
      (:DESCRIPTION "A specific time or a time interval."))
     (CONTINUEONERROR BOOLEAN "ContinueOnError" :IN
      (:DESCRIPTION
       "True indicates to continue processing when an error is encountered."))
     (MUSTBECOMPLETEDBY DATETIME "MustBeCompletedBy" :IN
      (:DESCRIPTION
       "This parameter indicates the required completion time for the method."))
     (COLLECTION "CIM_CollectionOfMSEs" "Collection" :IN
      (:DESCRIPTION
       "The Collection of Elements to which the Setting is being applied."))
     (PROPERTIESTOAPPLY (ARRAY STRING) "PropertiesToApply" :IN
      (:DESCRIPTION
       "A list of the property names whose values will be verified."))
     (CANNOTAPPLY (ARRAY STRING) "CanNotApply" :IN :OUT
      (:DESCRIPTION
       "A string array that lists the keys of the ManagedSystemElements to which the Setting cannot be applied.")))
    ((:CIM-NAME "ApplyIncrementalChangeToCollection")
     (:QUALIFIERS
      (:DESCRIPTION
       "The ApplyIncrementalChangeToCollection method performs the application of a subset of the properties in this Setting to the referenced Collection of ManagedSystemElements. The net effect is to execute the ApplyIncrementalChangeToMSE method against each of the Elements that are aggregated by the Collection. If the input value ContinueOnError is false, this method applies the Setting to all Elements in the Collection until it encounters an error, in which case it stops execution, logs the key of the Element that caused the error in the CanNotApply array, and issues a return code of 2. If the input value ContinueOnError is true, then this method applies the Setting to all of the ManagedSystemElements in the Collection, and reports the failed Elements in the array, CanNotApply. For the latter, processing will continue until the method is applied to all Elements in the Collection, regardless of any errors encountered. The key of each ManagedSystemElement to which the Setting could not be applied is logged into the CanNotApply array. This method takes four input parameters: Collection (the Collection of Elements to which the Setting is being applied), TimeToApply (which, being a datetime, can be either a specific time or a time interval), ContinueOnError (true indicates to continue processing when an error is encountered), MustBeCompletedBy (which indicates the required completion time for the method), and a PropertiesToApply array (which contains a list of the property names whose values will be applied). If a property is not in this list, it will be ignored by the Apply. If the array is null or empty or contains the string \"ALL\" as a property name, then all Settings properties will be applied. If it is set to \"NONE\", then no Settings properties will be applied. 
The return value should be 0 if the Setting is successfully applied to the referenced Collection, 1 if the method is not supported, 2 if the Setting was not applied within the specified time, 3 if the Setting cannot be applied using the input value for ContinueOnError, and any other number if an error occurred. One output parameter, CanNotApplystring, is defined, which is an array that lists the keys of the ManagedSystemElements to which the Setting could not be applied. This output parameter has meaning only when the ContinueOnError parameter is true. 
In a subclass, the set of possible return codes could be specified using a ValueMap qualifier on the method. The strings to which the ValueMap contents are \"translated\" can also be specified in the subclass as a Values array qualifier. 
Note: If an error occurs when applying the Setting to a ManagedSystemElement in the Collection, the Element must be configured as it was when the \"Apply\" attempt began. That is, the Element should not be left in an indeterminate state."))))