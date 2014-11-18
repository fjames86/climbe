
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PolicyTimePeriodCondition.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_POLICYTIMEPERIODCONDITION (CIM_POLICYCONDITION)
              ((TIMEPERIOD STRING :CIM-NAME "TimePeriod" :QUALIFIERS
                ((:DESCRIPTION
                  "This property identifies an overall range of calendar dates and times over which a PolicySet is valid. It is formatted as a string representing a start date and time, in which the character 'T' indicates the beginning of the time portion, followed by the solidus character '/', followed by a similar string representing an end date and time. The first date indicates the beginning of the range, while the second date indicates the end. Thus, the second date and time must be later than the first. Date/times are expressed as substrings of the form yyyymmddThhmmss. For example: 
20000101T080000/20000131T120000 defines 
January 1, 2000, 0800 through January 31, 2000, noon 

There are also two special cases in which one of the date/time strings is replaced with a special string defined in RFC 2445. 
o If the first date/time is replaced with the string 'THISANDPRIOR', then the property indicates that a PolicySet is valid [from now] until the date/time that appears after the '/'. 
o If the second date/time is replaced with the string 'THISANDFUTURE', then the property indicates that a PolicySet becomes valid on the date/time that appears before the '/', and remains valid from that point on.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PolicyTimePeriodCondition.MonthOfYearMask"
                   "CIM_PolicyTimePeriodCondition.DayOfMonthMask"
                   "CIM_PolicyTimePeriodCondition.DayOfWeekMask"
                   "CIM_PolicyTimePeriodCondition.TimeOfDayMask"
                   "CIM_PolicyTimePeriodCondition.LocalOrUtcTime")))
                :INITFORM NIL)
               (TIMEOFDAYMASK STRING :CIM-NAME "TimeOfDayMask" :QUALIFIERS
                ((:DESCRIPTION
                  "The purpose of this property is to refine the valid time period that is defined by the TimePeriod property, by explicitly specifying a range of times in a day during which the PolicySet is valid. These properties work together, with the TimePeriod used to specify the overall time period in which the PolicySet is valid, and the TimeOfDayMask used to pick out the range of time periods in a given day of during which the PolicySet is valid. 

This property is formatted in the style of RFC 2445: a time string beginning with the character 'T', followed by the solidus character '/', followed by a second time string. The first time indicates the beginning of the range, while the second time indicates the end. Times are expressed as substrings of the form 'Thhmmss'. 

The second substring always identifies a later time than the first substring. To allow for ranges that span midnight, however, the value of the second string may be smaller than the value of the first substring. Thus, 'T080000/T210000' identifies the range from 0800 until 2100, while 'T210000/T080000' identifies the range from 2100 until 0800 of the following day. 

When a range spans midnight, it by definition includes parts of two successive days. When one of these days is also selected by either the MonthOfYearMask, DayOfMonthMask, and/or DayOfWeekMask, but the other day is not, then the PolicySet is active only during the portion of the range that falls on the selected day. For example, if the range extends from 2100 until 0800, and the day of week mask selects Monday and Tuesday, then the PolicySet is active during the following three intervals: 
From midnight Sunday until 0800 Monday; 
From 2100 Monday until 0800 Tuesday; 
From 2100 Tuesday until 23:59:59 Tuesday. 

If a value for this property is not provided, then the PolicySet is treated as valid for all hours of the day, and only restricted by its TimePeriod property value and the other Mask properties.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PolicyTimePeriodCondition.TimePeriod"
                   "CIM_PolicyTimePeriodCondition.LocalOrUtcTime")))
                :INITFORM NIL)
               (LOCALORUTCTIME UINT16 :CIM-NAME "LocalOrUtcTime" :QUALIFIERS
                ((:DESCRIPTION
                  "This property indicates whether the times represented in the TimePeriod property and in the various Mask properties represent local times or UTC times. There is no provision for mixing of local times and UTC times: the value of this property applies to all of the other time-related properties. TimePeriods are synchronized worldwide by using the enumeration value 'UTCTime'. If the goal is to synchronize worldwide on a particular local time (such as 0300 - 0500 in New York), then if the TimePeriod property spans a Daylight Savings Time transition in New York, it will be necessary to create multiple instances of PolicyTimePeriodCondition, one based on the offset UTC-0500 for the part of each year when standard time is used in New York, and one based on the offset UTC-0400 for the part of each year when Daylight Savings Time is used there.")
                 (:VALUE-MAP ("1" "2")) (:VALUES ("Local Time" "UTC Time"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PolicyTimePeriodCondition.TimePeriod"
                   "CIM_PolicyTimePeriodCondition.MonthOfYearMask"
                   "CIM_PolicyTimePeriodCondition.DayOfMonthMask"
                   "CIM_PolicyTimePeriodCondition.DayOfWeekMask"
                   "CIM_PolicyTimePeriodCondition.TimeOfDayMask")))
                :INITFORM NIL)
               (SYSTEMCREATIONCLASSNAME STRING :CIM-NAME
                "SystemCreationClassName" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The name of the class or the subclass used in the creation of the System object in whose scope this PolicyCondition is defined. 

This property helps to identify the System object in whose scope this instance of PolicyCondition exists. For a rule-specific PolicyCondition, this is the System in whose context the PolicyRule is defined. For a reusable PolicyCondition, this is the instance of PolicyRepository (which is a subclass of System) that holds the Condition. 

Note that this property, and the analogous property SystemName, do not represent propagated keys from an instance of the class System. Instead, they are properties defined in the context of this class, which repeat the values from the instance of System to which this PolicyCondition is related, either directly via the PolicyConditionInPolicyRepository association or indirectly via the PolicyConditionInPolicyRule aggregation.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (SYSTEMNAME STRING :CIM-NAME "SystemName" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The name of the System object in whose scope this PolicyCondition is defined. 

This property completes the identification of the System object in whose scope this instance of PolicyCondition exists. For a rule-specific PolicyCondition, this is the System in whose context the PolicyRule is defined. For a reusable PolicyCondition, this is the instance of PolicyRepository (which is a subclass of System) that holds the Condition.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (POLICYRULECREATIONCLASSNAME STRING :CIM-NAME
                "PolicyRuleCreationClassName" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "For a rule-specific PolicyCondition, the CreationClassName of the PolicyRule object with which this Condition is associated. For a reusable Policy Condition, a special value, 'NO RULE', should be used to indicate that this Condition is reusable and not associated with a single PolicyRule.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (POLICYRULENAME STRING :CIM-NAME "PolicyRuleName" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "For a rule-specific PolicyCondition, the name of the PolicyRule object with which this Condition is associated. For a reusable PolicyCondition, a special value, 'NO RULE', should be used to indicate that this Condition is reusable and not associated with a single PolicyRule.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (CREATIONCLASSNAME STRING :CIM-NAME "CreationClassName"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "CreationClassName indicates the name of the class or the subclass used in the creation of an instance. When used with the other key properties of this class, this property allows all instances of this class and its subclasses to be uniquely identified.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (POLICYCONDITIONNAME STRING :CIM-NAME "PolicyConditionName"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION "A user-friendly name of this PolicyCondition.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (COMMONNAME STRING :CIM-NAME "CommonName" :QUALIFIERS
                ((:DESCRIPTION
                  "A user-friendly name of this policy-related object."))
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
               (MONTHOFYEARMASK (ARRAY UINT8) :CIM-NAME "MonthOfYearMask"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The purpose of this property is to refine the valid time period that is defined by the TimePeriod property, by explicitly specifying in which months the PolicySet is valid. These properties work together, with the TimePeriod used to specify the overall time period in which the PolicySet is valid, and the MonthOfYearMask used to pick out the months during which the PolicySet is valid. 

This property is formatted as an octet string, structured as follows: 
o a 4-octet length field, indicating the length of the entire octet string; this field is always set to 0x00000006 for this property; 
o a 2-octet field consisting of 12 bits identifying the 12 months of the year, beginning with January and ending with December, followed by 4 bits that are always set to '0'. For each month, the value '1' indicates that the policy is valid for that month, and the value '0' indicates that it is not valid. 

The value 0x000000060830, for example, indicates that a PolicySet is valid only in the months May, November, and December. 

If a value for this property is not provided, then the PolicySet is treated as valid for all twelve months, and only restricted by its TimePeriod property value and the other Mask properties.")
                 :OCTET-STRING
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PolicyTimePeriodCondition.TimePeriod"
                   "CIM_PolicyTimePeriodCondition.LocalOrUtcTime")))
                :INITFORM NIL)
               (DAYOFMONTHMASK (ARRAY UINT8) :CIM-NAME "DayOfMonthMask"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The purpose of this property is to refine the valid time period that is defined by the TimePeriod property, by explicitly specifying in which days of the month the PolicySet is valid. These properties work together, with the TimePeriod used to specify the overall time period in which the PolicySet is valid, and the DayOfMonthMask used to pick out the days of the month during which the PolicySet is valid. 

This property is formatted as an octet string, structured as follows: 
o a 4-octet length field, indicating the length of the entire octet string; this field is always set to 0x0000000C for this property; 
o an 8-octet field consisting of 31 bits identifying the days of the month counting from the beginning, followed by 31 more bits identifying the days of the month counting from the end, followed by 2 bits that are always set to '0'. For each day, the value '1' indicates that the PolicySet is valid for that day, and the value '0' indicates that it is not valid. 

The value 0x0000000C8000000100000000, for example, indicates that a PolicySet is valid on the first and last days of the month. 

For months with fewer than 31 days, the digits corresponding to days that the months do not have (counting in both directions) are ignored. 

If a value for this property is not provided, then the PolicySet is treated as valid for all days of the month, and only restricted by its TimePeriod property value and the other Mask properties.")
                 :OCTET-STRING
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PolicyTimePeriodCondition.TimePeriod"
                   "CIM_PolicyTimePeriodCondition.LocalOrUtcTime")))
                :INITFORM NIL)
               (DAYOFWEEKMASK (ARRAY UINT8) :CIM-NAME "DayOfWeekMask"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The purpose of this property is to refine the valid time period that is defined by the TimePeriod property, by explicitly specifying in which days of the week the PolicySet is valid. These properties work together, with the TimePeriod used to specify the overall time period in which the PolicySet is valid, and the DayOfWeekMask used to pick out the days of the week during which the PolicySet is valid. 

This property is formatted as an octet string, structured as follows: 
o a 4-octet length field, indicating the length of the entire octet string; this field is always set to 0x00000005 for this property; 
o a 1-octet field consisting of 7 bits identifying the 7 days of the week, beginning with Sunday and ending with Saturday, followed by 1 bit that is always set to '0'. For each day of the week, the value '1' indicates that the PolicySet is valid for that day, and the value '0' indicates that it is not valid. 

The value 0x000000057C, for example, indicates that a PolicySet is valid Monday through Friday. 

If a value for this property is not provided, then the PolicySet is treated as valid for all days of the week, and only restricted by its TimePeriod property value and the other Mask properties.")
                 :OCTET-STRING
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PolicyTimePeriodCondition.TimePeriod"
                   "CIM_PolicyTimePeriodCondition.LocalOrUtcTime")))
                :INITFORM NIL)
               (POLICYKEYWORDS (ARRAY STRING) :CIM-NAME "PolicyKeywords"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An array of keywords for characterizing / categorizing policy objects. Keywords are of one of two types: 
- Keywords defined in this and other MOFs, or in DMTF white papers. These keywords provide a vendor- independent, installation-independent way of characterizing policy objects. 
- Installation-dependent keywords for characterizing policy objects. Examples include 'Engineering', 'Billing', and 'Review in December 2000'. 
This MOF defines the following keywords: 'UNKNOWN', 'CONFIGURATION', 'USAGE', 'SECURITY', 'SERVICE', 'MOTIVATIONAL', 'INSTALLATION', and 'EVENT'. These concepts are self-explanatory and are further discussed in the SLA/Policy White Paper. One additional keyword is defined: 'POLICY'. The role of this keyword is to identify policy-related instances that may not be otherwise identifiable, in some implementations. The keyword 'POLICY' is NOT mutually exclusive of the other keywords specified above."))
                :INITFORM NIL))
              (:CIM-NAME "CIM_PolicyTimePeriodCondition")
              (:QUALIFIERS (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Policy")
               (:DESCRIPTION
                "This class provides a means of representing the time periods during which a PolicySet is valid, i.e., active. At all times that fall outside these time periods, the PolicySet has no effect. A PolicySet is treated as valid at ALL times, if it does not specify a PolicyTimePeriodCondition. 

In some cases a Policy Consumer may need to perform certain setup / cleanup actions when a PolicySet becomes active / inactive. For example, sessions that were established while a PolicySet was active might need to be taken down when the PolicySet becomes inactive. In other cases, however, such sessions might be left up. In this case, the effect of deactivating the PolicySet would just be to prevent the establishment of new sessions. 

Setup / cleanup behaviors on validity period transitions are not currently addressed by the Policy Model, and must be specified in 'guideline' documents or via subclasses of CIM_PolicySet, CIM_PolicyTimePeriod Condition or other concrete subclasses of CIM_Policy. If such behaviors need to be under the control of the policy administrator, then a mechanism to allow this control must also be specified in the subclasses. 

PolicyTimePeriodCondition is defined as a subclass of PolicyCondition. This is to allow the inclusion of time-based criteria in the AND/OR condition definitions for a PolicyRule. 

Instances of this class may have up to five properties identifying time periods at different levels. The values of all the properties present in an instance are ANDed together to determine the validity period(s) for the instance. For example, an instance with an overall validity range of January 1, 2000 through December 31, 2000; a month mask that selects March and April; a day-of-the-week mask that selects Fridays; and a time of day range of 0800 through 1600 would be represented using the following time periods: 
Friday, March 5, 2000, from 0800 through 1600; 
Friday, March 12, 2000, from 0800 through 1600; 
Friday, March 19, 2000, from 0800 through 1600; 
Friday, March 26, 2000, from 0800 through 1600; 
Friday, April 2, 2000, from 0800 through 1600; 
Friday, April 9, 2000, from 0800 through 1600; 
Friday, April 16, 2000, from 0800 through 1600; 
Friday, April 23, 2000, from 0800 through 1600; 
Friday, April 30, 2000, from 0800 through 1600. 

Properties not present in an instance of PolicyTimePeriodCondition are implicitly treated as having their value 'always enabled'. Thus, in the example above, the day-of-the-month mask is not present, and so the validity period for the instance implicitly includes a day-of-the-month mask that selects all days of the month. If this 'missing property' rule is applied to its fullest, we see that there is a second way to indicate that a PolicySet is always enabled: associate with it an instance of PolicyTimePeriodCondition whose only properties with specific values are its key properties.")))