
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_J2eeStatistic.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_J2EESTATISTIC (CIM_STATISTICALDATA)
              ((INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. In order to ensure uniqueness within the NameSpace, the value of InstanceID SHOULD be constructed using the following 'preferred' algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon ':', and where <OrgID> MUST include a copyrighted, trademarked or otherwise unique name that is owned by the business entity creating/defining the InstanceID, or is a registered ID that is assigned to the business entity by a recognized global authority (This is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness <OrgID> MUST NOT contain a colon (':'). When using this algorithm, the first colon to appear in InstanceID MUST appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and SHOULD not be re-used to identify different underlying (real-world) elements. If the above 'preferred' algorithm is not used, the defining entity MUST assure that the resultant InstanceID is not re-used across any InstanceIDs produced by this or other providers for this instance's NameSpace. 
For DMTF defined instances, the 'preferred' algorithm MUST be used with the <OrgID> set to 'CIM'."))
                :INITFORM NIL)
               (ELEMENTNAME STRING :CIM-NAME "ElementName" :QUALIFIERS
                (:REQUIRED (:OVERRIDE "ElementName")
                 (:DESCRIPTION
                  "The user friendly name for this instance of StatisticalData. In addition, the user friendly name can be used as a index property for a search of query. (Note: Name does not have to be unique within a namespace.)"))
                :INITFORM NIL)
               (STARTSTATISTICTIME DATETIME :CIM-NAME "StartStatisticTime"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The time, relative to managed element where the statistic was collected, when the first measurement was taken. If the statistic is reset, the StartStatisticTime is the time when the reset was performed."))
                :INITFORM NIL)
               (STATISTICTIME DATETIME :CIM-NAME "StatisticTime" :QUALIFIERS
                ((:DESCRIPTION
                  "The time the most recent measurement was taken, relative to the managed element where the statistic was collected."))
                :INITFORM NIL)
               (SAMPLEINTERVAL DATETIME :CIM-NAME "SampleInterval" :QUALIFIERS
                ((:DESCRIPTION
                  "Some statistics are sampled at consistent time intervals. This property provides the sample interval so that client applications can determine the minimum time that new statistics should be pulled. If the statistics are not sampled at consistent time intervals, this property must be set to a zero time interval."))
                :INITFORM "00000000000000.000000:000")
               (CAPTION STRING :CIM-NAME "Caption" :QUALIFIERS
                ((:DESCRIPTION
                  "The Caption property is a short textual description (one- line string) of the object.")
                 (:MAX-LEN "64"))
                :INITFORM NIL)
               (DESCRIPTION STRING :CIM-NAME "Description" :QUALIFIERS
                ((:DESCRIPTION
                  "The Description property provides a textual description of the object."))
                :INITFORM NIL))
              (:CIM-NAME "CIM_J2eeStatistic")
              (:QUALIFIERS :ABSTRACT (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Application::J2eeAppServerStats")
               (:DESCRIPTION
                "The J2eeStatistic class is a base class that defines the properties that are common to all J2EE statistics. The JSR77 specification defines a set of statistical types, then it defines each J2EE statistic in terms of these types. Since CIM does not support multiple inheritance or embedded objects, the count, time, range, bounded range, and boundary statistics defined have been broken out into individual properties for each statistic that is defined in the JSR77 specification. 
Many of the properties defined for J2EE statistics are inherited from the CIM_StatisticalData class. Some of the inherited properties are CIM dates, which are not consistent with the definitions in the JSR77 specification. In order to minimize implementation differences, methods are defined to provide the dates as specified. Some of the subclasses of CIM_J2EEStatistic do not add any new properties. However, these subclasses were chosen over adding a type property to the superclass because the vendor extensions were likely to result in classes with characteristics distinct enough to warrant the existence of subclasses.")))
(DEFCIM-METHOD GETSTARTTIME
    ((INSTANCE CIM_J2EESTATISTIC))
    ((:CIM-NAME "GetStartTime")
     (:QUALIFIERS
      (:DESCRIPTION
       "The time the first measurement was taken represented as a long, whose value is the number of milliseconds since January 1, 1970,00:00:00. This method converts the StartStatisticTime property to the format defined in the JSR77 specification. The related property CIM_StatisticalData.StartStatisticTime represents the same information as a CIMDatetime entity.")
      (:MAPPING-STRINGS ("JSR77.JCP|JSR77.6.4.1.4 getStartTime|V1.0"))
      (:MODEL-CORRESPONDENCE ("CIM_StatisticalData.StartStatisticTime")))))
(DEFCIM-METHOD GETLASTSAMPLETIME
    ((INSTANCE CIM_J2EESTATISTIC))
    ((:CIM-NAME "GetLastSampleTime")
     (:QUALIFIERS
      (:DESCRIPTION
       "The time the most recent measurement was taken represented as a long, whose value is the number of milliseconds since January 1, 1970,00:00:00. This method converts the StatisticTime property to the format defined in the JSR77 specification. The related property CIM_StatisticalData.StatisticTime represents the same information as a CIMDatatime entity.")
      (:MAPPING-STRINGS ("JSR77.JCP|JSR77.6.4.1.5 getLastSampleTime|V1.0"))
      (:MODEL-CORRESPONDENCE ("CIM_StatisticalData.StatisticTime")))))
(DEFCIM-METHOD RESETSELECTEDSTATS
    ((INSTANCE CIM_J2EESTATISTIC)
     (SELECTEDSTATISTICS (ARRAY STRING) "SelectedStatistics" :IN
      (:DESCRIPTION "Array of strings indicating which statistics to reset.")))
    ((:CIM-NAME "ResetSelectedStats")
     (:QUALIFIERS
      (:DESCRIPTION
       "Method to reset one or more of the instance's statistics. The method takes one parameter as input - an array of strings indicating which statistics to reset. If all the statistics in the instance should be reset, the first element of the array MUST be set to \"All\" or \"ALL\". If one or more individual statistics should be reset, the corresponding property names are entered into the elements of the array. 
The method returns 0 if successful, 1 if not supported, and any other value if an error occurred. A method is specified so that the StatisticalInformation's provider/ instrumentation, which calculates the statistics, can reset its internal processing, counters, etc. 
In a subclass, the set of possible return codes could be specified, using a ValueMap qualifier on the method. The strings to which the ValueMap contents are 'translated' may also be specified in the subclass as a Values array qualifier."))))