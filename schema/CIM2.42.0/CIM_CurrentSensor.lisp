
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_CurrentSensor.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CURRENTSENSOR (CIM_NUMERICSENSOR)
              ((SENSORTYPE UINT16 :CIM-NAME "SensorType" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "SensorType")
                 (:DESCRIPTION
                  "The Type of the Sensor, e.g. Voltage or Temperature Sensor. If the type is set to \"Other\", then the OtherSensorType Description can be used to further identify the type, or if the Sensor has numeric readings, then the type of the Sensor can be implicitly determined by the Units. A description of the different Sensor types is as follows: A Temperature Sensor measures the environmental temperature. Voltage and Current Sensors measure electrical voltage and current readings. A Tachometer measures speed/revolutions of a Device. For example, a Fan Device can have an associated Tachometer which measures its speed. A Counter is a general purpose Sensor that measures some numerical property of a Device. A Counter value can be cleared, but it never decreases. A Switch Sensor has states like Open/Close, On/Off, or Up/Down. A Lock has states of Locked/Unlocked. Humidity, Smoke Detection and Air Flow Sensors measure the equivalent environmental characteristics. A Presence Sensor detects the presence of a PhysicalElement. A Power Consumption Sensor measures the instantaneous power consumed by a managed element. A Power Production Sensor measures the instantaneous power produced by a managed element such as a power supply or a voltage regulator. A pressure sensor is used to report pressure. Intrusion sensor reports an intrusion of an enclosure regardless whether it was authorized or not.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" ".." "32768..65535"))
                 (:VALUES
                  ("Unknown" "Other" "Temperature" "Voltage" "Current"
                   "Tachometer" "Counter" "Switch" "Lock" "Humidity"
                   "Smoke Detection" "Presence" "Air Flow" "Power Consumption"
                   "Power Production" "Pressure" "Intrusion" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Sensor.OtherSensorTypeDescription")))
                :INITFORM "4")
               (BASEUNITS UINT16 :CIM-NAME "BaseUnits" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "BaseUnits")
                 (:DESCRIPTION
                  "The base unit of the values returned by this Sensor. All the values returned by this Sensor are represented in the units obtained by (BaseUnits * 10 raised to the power of the UnitModifier). For example, if BaseUnits is Volts and the UnitModifier is -6, then the units of the values returned are MicroVolts. However, if the RateUnits property is set to a value other than \"None\", then the units are further qualified as rate units. In the above example, if RateUnits is set to \"Per Second\", then the values returned by the Sensor are in MicroVolts/Second. The units apply to all numeric properties of the Sensor, unless explicitly overridden by the Units qualifier.")
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
                 (:MODEL-CORRESPONDENCE
                  ("CIM_NumericSensor.UnitModifier"
                   "CIM_NumericSensor.RateUnits")))
                :INITFORM "6")
               (UNITMODIFIER SINT32 :CIM-NAME "UnitModifier" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "UnitModifier")
                 (:DESCRIPTION
                  "The unit multiplier for the values returned by this Sensor. All the values returned by this Sensor are represented in the units obtained by (BaseUnits * 10 raised to the power of the UnitModifier). For example, if BaseUnits is Volts and the Unit Modifier is -6, then the units of the values returned are MicroVolts. However, if the RateUnits property is set to a value other than \"None\", then the units are further qualified as rate units. In the above example, if RateUnits is set to \"Per Second\", then the values returned by the Sensor are in MicroVolts/Second. The units apply to all numeric properties of the Sensor, unless explicitly overridden by the Units qualifier.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_NumericSensor.BaseUnits"
                   "CIM_NumericSensor.RateUnits")))
                :INITFORM "-3")
               (RATEUNITS UINT16 :CIM-NAME "RateUnits" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "RateUnits")
                 (:DESCRIPTION
                  "Specifies if the units returned by this Sensor are rate units. All the values returned by this Sensor are represented in the units obtained by (BaseUnits * 10 raised to the power of the UnitModifier). This is true unless this property (RateUnits) has a value different than \"None\". For example, if BaseUnits is Volts and the UnitModifier is -6, then the units of the values returned are MicroVolts. But, if the RateUnits property is set to a value other than \"None\", then the units are further qualified as rate units. In the above example, if RateUnits is set to \"Per Second\", then the values returned by the Sensor are in MicroVolts/Second. The units apply to all numeric properties of the Sensor, unless explicitly overridden by the Units qualifier. Any implementation of CurrentReading should be qualified with either a Counter or a Gauge qualifier, depending on the characteristics of the sensor being modeled.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9"))
                 (:VALUES
                  ("None" "Per MicroSecond" "Per MilliSecond" "Per Second"
                   "Per Minute" "Per Hour" "Per Day" "Per Week" "Per Month"
                   "Per Year"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_NumericSensor.UnitModifier"
                   "CIM_NumericSensor.BaseUnits")))
                :INITFORM "0")
               (CURRENTREADING SINT32 :CIM-NAME "CurrentReading" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "CurrentReading")
                 (:MAPPING-STRINGS ("MIF.DMTF|Electrical Current Probe|001.5"))
                 (:DESCRIPTION "The current value indicated by the Sensor."))
                :INITFORM NIL)
               (NOMINALREADING SINT32 :CIM-NAME "NominalReading" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "NominalReading")
                 (:MAPPING-STRINGS ("MIF.DMTF|Electrical Current Probe|001.6"))
                 (:DESCRIPTION
                  "NominalReading indicates the 'normal' or expected value for the NumericSensor."))
                :INITFORM NIL)
               (NORMALMAX SINT32 :CIM-NAME "NormalMax" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "NormalMax")
                 (:MAPPING-STRINGS ("MIF.DMTF|Electrical Current Probe|001.7"))
                 (:DESCRIPTION
                  "NormalMax provides guidance for the user as to the normal maximum range for the NumericSensor."))
                :INITFORM NIL)
               (NORMALMIN SINT32 :CIM-NAME "NormalMin" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "NormalMin")
                 (:MAPPING-STRINGS ("MIF.DMTF|Electrical Current Probe|001.8"))
                 (:DESCRIPTION
                  "NormalMin provides guidance for the user as to the normal minimum range for the NumericSensor."))
                :INITFORM NIL)
               (MAXREADABLE SINT32 :CIM-NAME "MaxReadable" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "MaxReadable")
                 (:MAPPING-STRINGS ("MIF.DMTF|Electrical Current Probe|001.9"))
                 (:DESCRIPTION
                  "MaxReadable indicates the largest value of the measured property that can be read by the NumericSensor."))
                :INITFORM NIL)
               (MINREADABLE SINT32 :CIM-NAME "MinReadable" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "MinReadable")
                 (:MAPPING-STRINGS
                  ("MIF.DMTF|Electrical Current Probe|001.10"))
                 (:DESCRIPTION
                  "MinReadable indicates the smallest value of the measured property that can be read by the NumericSensor."))
                :INITFORM NIL)
               (RESOLUTION UINT32 :CIM-NAME "Resolution" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "Resolution")
                 (NIL "Tenths of MilliAmps")
                 (:MAPPING-STRINGS
                  ("MIF.DMTF|Electrical Current Probe|001.17"))
                 (:P-UNIT "ampere * 10^-4")
                 (:DESCRIPTION
                  "Resolution indicates the ability of the Sensor to resolve differences in the measured property. The units for this measurement are determined by BaseUnit*UnitModifier/RateUnit."))
                :INITFORM NIL)
               (TOLERANCE SINT32 :CIM-NAME "Tolerance" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "Tolerance")
                 (:MAPPING-STRINGS
                  ("MIF.DMTF|Electrical Current Probe|001.18"))
                 (:DESCRIPTION
                  "This property is being deprecated in lieu of using the Resolution and Accuracy properties. 
Indicates the tolerance of the Sensor for the measured property. Tolerance, along with Resolution and Accuracy, is used to calculate the actual value of the measured physical property. Tolerance may vary depending on whether the Device is linear over its dynamic range."))
                :INITFORM NIL)
               (ACCURACY SINT32 :CIM-NAME "Accuracy" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "Accuracy")
                 (:MAPPING-STRINGS
                  ("MIF.DMTF|Electrical Current Probe|001.19"))
                 (:DESCRIPTION
                  "Indicates the accuracy of the Sensor for the measured property. Its value is recorded as plus/minus hundredths of a percent. Accuracy, along with Resolution, is used to calculate the actual value of the measured physical property. Accuracy may vary depending on whether the Device is linear over its dynamic range.")
                 (NIL "Hundredths of Percent") (:P-UNIT "percent * 10^-2"))
                :INITFORM NIL)
               (LOWERTHRESHOLDNONCRITICAL SINT32 :CIM-NAME
                "LowerThresholdNonCritical" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:OVERRIDE "LowerThresholdNonCritical")
                 (:MAPPING-STRINGS
                  ("MIF.DMTF|Electrical Current Probe|001.11"))
                 :WRITE
                 (:DESCRIPTION
                  "The Sensor's threshold values specify the ranges (min and max values) for determining whether the Sensor is operating under Normal, NonCritical, Critical or Fatal conditions. If Current Reading is between LowerThresholdNonCritical and Upper ThresholdNonCritical, then the Sensor is reporting a normal value. If CurrentReading is between LowerThresholdNonCritical and LowerThresholdCritical, then the CurrentState is NonCritical."))
                :INITFORM NIL)
               (UPPERTHRESHOLDNONCRITICAL SINT32 :CIM-NAME
                "UpperThresholdNonCritical" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:OVERRIDE "UpperThresholdNonCritical")
                 (:MAPPING-STRINGS
                  ("MIF.DMTF|Electrical Current Probe|001.12"))
                 :WRITE
                 (:DESCRIPTION
                  "The Sensor's threshold values specify the ranges (min and max values) for determining whether the Sensor is operating under Normal, NonCritical, Critical or Fatal conditions. If the CurrentReading is between LowerThresholdNonCritical and UpperThresholdNonCritical, then the Sensor is reporting a normal value. If the CurrentReading is between UpperThreshold NonCritical and UpperThresholdCritical, then the CurrentState is NonCritical."))
                :INITFORM NIL)
               (LOWERTHRESHOLDCRITICAL SINT32 :CIM-NAME
                "LowerThresholdCritical" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:OVERRIDE "LowerThresholdCritical")
                 (:MAPPING-STRINGS
                  ("MIF.DMTF|Electrical Current Probe|001.13"))
                 :WRITE
                 (:DESCRIPTION
                  "The Sensor's threshold values specify the ranges (min and max values) for determining whether the Sensor is operating under Normal, NonCritical, Critical or Fatal conditions. If the CurrentReading is between LowerThresholdCritical and Lower ThresholdFatal, then the CurrentState is Critical."))
                :INITFORM NIL)
               (UPPERTHRESHOLDCRITICAL SINT32 :CIM-NAME
                "UpperThresholdCritical" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:OVERRIDE "UpperThresholdCritical")
                 (:MAPPING-STRINGS
                  ("MIF.DMTF|Electrical Current Probe|001.14"))
                 :WRITE
                 (:DESCRIPTION
                  "The Sensor's threshold values specify the ranges (min and max values) for determining whether the Sensor is operating under Normal, NonCritical, Critical or Fatal conditions. If the CurrentReading is between UpperThresholdCritical and Upper ThresholdFatal, then the CurrentState is Critical."))
                :INITFORM NIL)
               (LOWERTHRESHOLDFATAL SINT32 :CIM-NAME "LowerThresholdFatal"
                :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "LowerThresholdFatal")
                 (:MAPPING-STRINGS
                  ("MIF.DMTF|Electrical Current Probe|001.15"))
                 :WRITE
                 (:DESCRIPTION
                  "The Sensor's threshold values specify the ranges (min and max values) for determining whether the Sensor is operating under Normal, NonCritical, Critical or Fatal conditions. If the CurrentReading is below LowerThresholdFatal, then the Current State is Fatal."))
                :INITFORM NIL)
               (UPPERTHRESHOLDFATAL SINT32 :CIM-NAME "UpperThresholdFatal"
                :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "UpperThresholdFatal")
                 (:MAPPING-STRINGS
                  ("MIF.DMTF|Electrical Current Probe|001.16"))
                 :WRITE
                 (:DESCRIPTION
                  "The Sensor's threshold values specify the ranges (min and max values) for determining whether the Sensor is operating under Normal, NonCritical, Critical or Fatal conditions. If the CurrentReading is above UpperThresholdFatal, then the Current State is Fatal."))
                :INITFORM NIL)
               (ISLINEAR BOOLEAN :CIM-NAME "IsLinear" :QUALIFIERS
                ((:DESCRIPTION
                  "Indicates that the Sensor is linear over its dynamic range."))
                :INITFORM NIL)
               (HYSTERESIS UINT32 :CIM-NAME "Hysteresis" :QUALIFIERS
                ((:DESCRIPTION
                  "Indicates the margin built around the thresholds. This margin prevents unnecessary state changes when the Sensor reading may fluctuate very close to its thresholds. This could be due to the Sensor's tolerance/accuracy/resolution or due to environmental factors. Once a threshold is crossed, the state of the Sensor should change. However, the state should not fluctuate between the old and new states unless the Sensor's change in the reading exceeds the hysteresis value. The units for this measurement are determined by BaseUnit*UnitModifier/RateUnit."))
                :INITFORM NIL)
               (OTHERSENSORTYPEDESCRIPTION STRING :CIM-NAME
                "OtherSensorTypeDescription" :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing the Sensor type - used when the SensorType property is set to \"Other\".")
                 (:MAX-LEN "128")
                 (:MODEL-CORRESPONDENCE ("CIM_Sensor.SensorType")))
                :INITFORM NIL)
               (CURRENTSTATE STRING :CIM-NAME "CurrentState" :QUALIFIERS
                ((:DESCRIPTION
                  "The current state indicated by the Sensor. This is always one of the \"PossibleStates\".")
                 (:MAX-LEN "128"))
                :INITFORM NIL)
               (POLLINGINTERVAL UINT64 :CIM-NAME "PollingInterval" :QUALIFIERS
                ((:DESCRIPTION
                  "The polling interval that the Sensor hardware or the instrumentation uses to determine the current state of the Sensor.")
                 (NIL "NanoSeconds") (:P-UNIT "second * 10^-9"))
                :INITFORM NIL)
               (SENSORCONTEXT STRING :CIM-NAME "SensorContext" :QUALIFIERS
                ((:DESCRIPTION
                  "SensorContext indicates the purpose and context of the sensor. For example, the property may indicate what entity is being monitored or where the sensor is installed. Contextual and location information should be provided using associations to existing model elements. This property may be used if additional differentiation is necessary beyond that which is possible to convey using associations or values of SensorType. The value shall be formatted using the following algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon (:), and where <OrgID> shall include a copyrighted, trademarked, or otherwise unique name that is owned by the business entity that is creating or defining the SensorContext or that is a registered ID assigned to the business entity by a recognized global authority. In addition, to ensure uniqueness, <OrgID> shall not contain a colon (:). 
<LocalID> is chosen by the business entity and should not be reused to identify different underlying (real-world) elements."))
                :INITFORM NIL)
               (SYSTEMCREATIONCLASSNAME STRING :CIM-NAME
                "SystemCreationClassName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping System's CreationClassName.")
                 (:MAX-LEN "256") (:PROPOGATED "CIM_System.CreationClassName"))
                :INITFORM NIL)
               (SYSTEMNAME STRING :CIM-NAME "SystemName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping System's Name.")
                 (:MAX-LEN "256") (:PROPOGATED "CIM_System.Name"))
                :INITFORM NIL)
               (CREATIONCLASSNAME STRING :CIM-NAME "CreationClassName"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "CreationClassName indicates the name of the class or the subclass used in the creation of an instance. When used with the other key properties of this class, this property allows all instances of this class and its subclasses to be uniquely identified.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (DEVICEID STRING :CIM-NAME "DeviceID" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "An address or other identifying information to uniquely name the LogicalDevice.")
                 (:MAX-LEN "64"))
                :INITFORM NIL)
               (POWERMANAGEMENTSUPPORTED BOOLEAN :CIM-NAME
                "PowerManagementSupported" :QUALIFIERS
                ((:DEPRECATED ("CIM_PowerManagementCapabilities"))
                 (:DESCRIPTION
                  "Boolean indicating that the Device can be power managed. The use of this property has been deprecated. Instead, the existence of an associated PowerManagementCapabilities class (associated using the ElementCapabilities relationhip) indicates that power management is supported."))
                :INITFORM NIL)
               (AVAILABILITY UINT16 :CIM-NAME "Availability" :QUALIFIERS
                ((:DESCRIPTION
                  "The primary availability and status of the Device. (Additional status information can be specified using the Additional Availability array property.) For example, the Availability property indicates that the Device is running and has full power (value=3), or is in a warning (4), test (5), degraded (10) or power save state (values 13-15 and 17). Regarding the Power Save states, these are defined as follows: Value 13 (\"Power Save - Unknown\") indicates that the Device is known to be in a power save mode, but its exact status in this mode is unknown; 14 (\"Power Save - Low Power Mode\") indicates that the Device is in a power save state but still functioning, and may exhibit degraded performance; 15 (\"Power Save - Standby\") describes that the Device is not functioning but could be brought to full power 'quickly'; and value 17 (\"Power Save - Warning\") indicates that the Device is in a warning state, though also in a power save mode.")
                 (:VALUE-MAP
                  ("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14"
                   "15" "16" "17" "18" "19" "20" "21"))
                 (:VALUES
                  ("Other" "Unknown" "Running/Full Power" "Warning" "In Test"
                   "Not Applicable" "Power Off" "Off Line" "Off Duty"
                   "Degraded" "Not Installed" "Install Error"
                   "Power Save - Unknown" "Power Save - Low Power Mode"
                   "Power Save - Standby" "Power Cycle" "Power Save - Warning"
                   "Paused" "Not Ready" "Not Configured" "Quiesced"))
                 (:MAPPING-STRINGS
                  ("MIF.DMTF|Operational State|006.5"
                   "MIB.IETF|HOST-RESOURCES-MIB.hrDeviceStatus"
                   "MIF.DMTF|Host Device|001.5"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_LogicalDevice.AdditionalAvailability")))
                :INITFORM NIL)
               (STATUSINFO UINT16 :CIM-NAME "StatusInfo" :QUALIFIERS
                ((:DEPRECATED ("CIM_EnabledLogicalElement.EnabledState"))
                 (:DESCRIPTION
                  "The StatusInfo property indicates whether the Logical Device is in an enabled (value = 3), disabled (value = 4) or some other (1) or unknown (2) state. If this property does not apply to the LogicalDevice, the value, 5 (\"Not Applicable\"), should be used. StatusInfo has been deprecated in lieu of a more clearly named property with additional enumerated values (EnabledState), that is inherited from ManagedSystemElement. 
If a Device is (\"Enabled\")(value=3), it has been powered up, and is configured and operational. The Device may or may not be functionally active, depending on whether its Availability (or AdditionalAvailability) indicate that it is (\"Running/Full Power\")(value=3) or (\"Off line\") (value=8). In an enabled but offline mode, a Device may be performing out-of-band requests, such as running Diagnostics. If (\"Disabled\") StatusInfo value=4), a Device can only be \"enabled\" or powered off. In a personal computer environment, (\"Disabled\") means that the Device's driver is not available in the stack. In other environments, a Device can be disabled by removing its configuration file. A disabled device is physically present in a System and consuming resources, but can not be communicated with until a load of a driver, a load of a configuration file or some other \"enabling\" activity has occurred.")
                 (:VALUE-MAP ("1" "2" "3" "4" "5"))
                 (:VALUES
                  ("Other" "Unknown" "Enabled" "Disabled" "Not Applicable"))
                 (:MAPPING-STRINGS ("MIF.DMTF|Operational State|006.4")))
                :INITFORM NIL)
               (LASTERRORCODE UINT32 :CIM-NAME "LastErrorCode" :QUALIFIERS
                ((:DEPRECATED ("CIM_DeviceErrorData.LastErrorCode"))
                 (:DESCRIPTION
                  "LastErrorCode captures the last error code reported by the LogicalDevice."))
                :INITFORM NIL)
               (ERRORDESCRIPTION STRING :CIM-NAME "ErrorDescription"
                :QUALIFIERS
                ((:DEPRECATED ("CIM_DeviceErrorData.ErrorDescription"))
                 (:DESCRIPTION
                  "ErrorDescription is a free-form string supplying more information about the error recorded in LastErrorCode, and information on any corrective actions that may be taken."))
                :INITFORM NIL)
               (ERRORCLEARED BOOLEAN :CIM-NAME "ErrorCleared" :QUALIFIERS
                ((:DEPRECATED ("CIM_ManagedSystemElement.OperationalStatus"))
                 (:DESCRIPTION
                  "ErrorCleared is a boolean property indicating that the error reported in LastErrorCode is now cleared."))
                :INITFORM NIL)
               (POWERONHOURS UINT64 :CIM-NAME "PowerOnHours" :QUALIFIERS
                ((:DESCRIPTION
                  "The number of consecutive hours that this Device has been powered, since its last power cycle.")
                 (NIL "Hours") :COUNTER)
                :INITFORM NIL)
               (TOTALPOWERONHOURS UINT64 :CIM-NAME "TotalPowerOnHours"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The total number of hours that this Device has been powered.")
                 (NIL "Hours") :COUNTER)
                :INITFORM NIL)
               (MAXQUIESCETIME UINT64 :CIM-NAME "MaxQuiesceTime" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "The MaxQuiesceTime property has been deprecated. When evaluating the use of Quiesce, it was determine that this single property is not adequate for describing when a device will automatically exit a quiescent state. In fact, the most likely scenario for a device to exit a quiescent state was determined to be based on the number of outstanding requests queued rather than on a maximum time. This will be re-evaluated and repositioned later. 
Maximum time in milliseconds, that a Device can run in a \"Quiesced\" state. A Device's state is defined in its Availability and AdditionalAvailability properties, where \"Quiesced\" is conveyed by the value 21. What occurs at the end of the time limit is device-specific. The Device may unquiesce, may offline or take other action. A value of 0 indicates that a Device can remain quiesced indefinitely.")
                 (NIL "MilliSeconds"))
                :INITFORM NIL)
               (ENABLEDSTATE UINT16 :CIM-NAME "EnabledState" :QUALIFIERS
                ((:DESCRIPTION
                  "EnabledState is an integer enumeration that indicates the enabled and disabled states of an element. It can also indicate the transitions between these requested states. For example, shutting down (value=4) and starting (value=10) are transient states between enabled and disabled. The following text briefly summarizes the various enabled and disabled states: 
Enabled (2) indicates that the element is or could be executing commands, will process any queued commands, and queues new requests. 
Disabled (3) indicates that the element will not execute commands and will drop any new requests. 
Shutting Down (4) indicates that the element is in the process of going to a Disabled state. 
Not Applicable (5) indicates the element does not support being enabled or disabled. 
Enabled but Offline (6) indicates that the element might be completing commands, and will drop any new requests. 
Test (7) indicates that the element is in a test state. 
Deferred (8) indicates that the element might be completing commands, but will queue any new requests. 
Quiesce (9) indicates that the element is enabled but in a restricted mode.
Starting (10) indicates that the element is in the process of going to an Enabled state. New requests are queued.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11..32767"
                   "32768..65535"))
                 (:VALUES
                  ("Unknown" "Other" "Enabled" "Disabled" "Shutting Down"
                   "Not Applicable" "Enabled but Offline" "In Test" "Deferred"
                   "Quiesce" "Starting" "DMTF Reserved" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.OtherEnabledState")))
                :INITFORM "5")
               (OTHERENABLEDSTATE STRING :CIM-NAME "OtherEnabledState"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A string that describes the enabled or disabled state of the element when the EnabledState property is set to 1 (\"Other\"). This property must be set to null when EnabledState is any value other than 1.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.EnabledState")))
                :INITFORM NIL)
               (REQUESTEDSTATE UINT16 :CIM-NAME "RequestedState" :QUALIFIERS
                ((:DESCRIPTION
                  "RequestedState is an integer enumeration that indicates the last requested or desired state for the element, irrespective of the mechanism through which it was requested. The actual state of the element is represented by EnabledState. This property is provided to compare the last requested and current enabled or disabled states. Note that when EnabledState is set to 5 (\"Not Applicable\"), then this property has no meaning. Refer to the EnabledState property description for explanations of the values in the RequestedState enumeration. 
\"Unknown\" (0) indicates the last requested state for the element is unknown.
Note that the value \"No Change\" (5) has been deprecated in lieu of indicating the last requested state is \"Unknown\" (0). If the last requested or desired state is unknown, RequestedState should have the value \"Unknown\" (0), but may have the value \"No Change\" (5).Offline (6) indicates that the element has been requested to transition to the Enabled but Offline EnabledState. 
It should be noted that there are two new values in RequestedState that build on the statuses of EnabledState. These are \"Reboot\" (10) and \"Reset\" (11). Reboot refers to doing a \"Shut Down\" and then moving to an \"Enabled\" state. Reset indicates that the element is first \"Disabled\" and then \"Enabled\". The distinction between requesting \"Shut Down\" and \"Disabled\" should also be noted. Shut Down requests an orderly transition to the Disabled state, and might involve removing power, to completely erase any existing state. The Disabled state requests an immediate disabling of the element, such that it will not execute or accept any commands or processing requests. 

This property is set as the result of a method invocation (such as Start or StopService on CIM_Service), or can be overridden and defined as WRITEable in a subclass. The method approach is considered superior to a WRITEable property, because it allows an explicit invocation of the operation and the return of a result code. 

If knowledge of the last RequestedState is not supported for the EnabledLogicalElement, the property shall be NULL or have the value 12 \"Not Applicable\".")
                 (:VALUE-MAP
                  ("0" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" ".."
                   "32768..65535"))
                 (:VALUES
                  ("Unknown" "Enabled" "Disabled" "Shut Down" "No Change"
                   "Offline" "Test" "Deferred" "Quiesce" "Reboot" "Reset"
                   "Not Applicable" "DMTF Reserved" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.EnabledState")))
                :INITFORM "12")
               (ENABLEDDEFAULT UINT16 :CIM-NAME "EnabledDefault" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "An enumerated value indicating an administrator's default or startup configuration for the Enabled State of an element. By default, the element is \"Enabled\" (value=2).")
                 (:VALUE-MAP ("2" "3" "5" "6" "7" "9" ".." "32768..65535"))
                 (:VALUES
                  ("Enabled" "Disabled" "Not Applicable" "Enabled but Offline"
                   "No Default" "Quiesce" "DMTF Reserved" "Vendor Reserved")))
                :INITFORM "2")
               (TIMEOFLASTSTATECHANGE DATETIME :CIM-NAME
                "TimeOfLastStateChange" :QUALIFIERS
                ((:DESCRIPTION
                  "The date or time when the EnabledState of the element last changed. If the state of the element has not changed and this property is populated, then it must be set to a 0 interval value. If a state change was requested, but rejected or not yet processed, the property must not be updated."))
                :INITFORM NIL)
               (TRANSITIONINGTOSTATE UINT16 :CIM-NAME "TransitioningToState"
                :QUALIFIERS
                ((:DESCRIPTION
                  "TransitioningToState indicates the target state to which the instance is transitioning. 
A value of 5 \"No Change\" shall indicate that no transition is in progress.A value of 12 \"Not Applicable\" shall indicate the implementation does not support representing ongoing transitions. 
A value other than 5 or 12 shall identify the state to which the element is in the process of transitioning.")
                 (:VALUE-MAP
                  ("0" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" ".."))
                 (:VALUES
                  ("Unknown" "Enabled" "Disabled" "Shut Down" "No Change"
                   "Offline" "Test" "Defer" "Quiesce" "Reboot" "Reset"
                   "Not Applicable" "DMTF Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.RequestStateChange"
                   "CIM_EnabledLogicalElement.RequestedState"
                   "CIM_EnabledLogicalElement.EnabledState")))
                :INITFORM "12")
               (INSTALLDATE DATETIME :CIM-NAME "InstallDate" :QUALIFIERS
                ((:DESCRIPTION
                  "A datetime value that indicates when the object was installed. Lack of a value does not indicate that the object is not installed.")
                 (:MAPPING-STRINGS ("MIF.DMTF|ComponentID|001.5")))
                :INITFORM NIL)
               (NAME STRING :CIM-NAME "Name" :QUALIFIERS
                ((:DESCRIPTION
                  "The Name property defines the label by which the object is known. When subclassed, the Name property can be overridden to be a Key property.")
                 (:MAX-LEN "1024"))
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
               (SUPPORTEDTHRESHOLDS (ARRAY UINT16) :CIM-NAME
                "SupportedThresholds" :QUALIFIERS
                ((:DESCRIPTION
                  "An array representing the thresholds supported by this Sensor.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5"))
                 (:VALUES
                  ("LowerThresholdNonCritical" "UpperThresholdNonCritical"
                   "LowerThresholdCritical" "UpperThresholdCritical"
                   "LowerThresholdFatal" "UpperThresholdFatal")))
                :INITFORM NIL)
               (ENABLEDTHRESHOLDS (ARRAY UINT16) :CIM-NAME "EnabledThresholds"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An array representing the thresholds that are currently enabled for this Sensor.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5"))
                 (:VALUES
                  ("LowerThresholdNonCritical" "UpperThresholdNonCritical"
                   "LowerThresholdCritical" "UpperThresholdCritical"
                   "LowerThresholdFatal" "UpperThresholdFatal")))
                :INITFORM NIL)
               (SETTABLETHRESHOLDS (ARRAY UINT16) :CIM-NAME
                "SettableThresholds" :QUALIFIERS
                ((:DESCRIPTION
                  "An array representing the writable thresholds supported by Sensor.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5"))
                 (:VALUES
                  ("LowerThresholdNonCritical" "UpperThresholdNonCritical"
                   "LowerThresholdCritical" "UpperThresholdCritical"
                   "LowerThresholdFatal" "UpperThresholdFatal")))
                :INITFORM NIL)
               (POSSIBLESTATES (ARRAY STRING) :CIM-NAME "PossibleStates"
                :QUALIFIERS
                ((:DESCRIPTION
                  "PossibleStates enumerates the string outputs of the Sensor. For example, a \"Switch\" Sensor may output the states \"On\", or \"Off\". Another implementation of the Switch may output the states \"Open\", and \"Close\". Another example is a NumericSensor supporting thresholds. This Sensor can report the states like \"Normal\", \"Upper Fatal\", \"Lower Non-Critical\", etc. A NumericSensor that does not publish readings and thresholds, but stores this data internally, can still report its states.")
                 (:MAX-LEN "128"))
                :INITFORM NIL)
               (POWERMANAGEMENTCAPABILITIES (ARRAY UINT16) :CIM-NAME
                "PowerManagementCapabilities" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_PowerManagementCapabilities.PowerCapabilities"))
                 (:DESCRIPTION
                  "An enumerated array describing the power management capabilities of the Device. The use of this property has been deprecated. Instead, the PowerCapabilites property in an associated PowerManagementCapabilities class should be used.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6" "7"))
                 (:VALUES
                  ("Unknown" "Not Supported" "Disabled" "Enabled"
                   "Power Saving Modes Entered Automatically"
                   "Power State Settable" "Power Cycling Supported"
                   "Timed Power On Supported")))
                :INITFORM NIL)
               (OTHERIDENTIFYINGINFO (ARRAY STRING) :CIM-NAME
                "OtherIdentifyingInfo" :QUALIFIERS
                ((:DESCRIPTION
                  "OtherIdentifyingInfo captures additional data, beyond DeviceID information, that could be used to identify a LogicalDevice. One example would be to hold the Operating System's user friendly name for the Device in this property.")
                 (:ARRAYTYPE "Indexed") (:MAX-LEN "256")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_LogicalDevice.IdentifyingDescriptions")))
                :INITFORM NIL)
               (IDENTIFYINGDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "IdentifyingDescriptions" :QUALIFIERS
                ((:DESCRIPTION
                  "An array of free-form strings providing explanations and details behind the entries in the OtherIdentifyingInfo array. Note, each entry of this array is related to the entry in OtherIdentifyingInfo that is located at the same index.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_LogicalDevice.OtherIdentifyingInfo")))
                :INITFORM NIL)
               (ADDITIONALAVAILABILITY (ARRAY UINT16) :CIM-NAME
                "AdditionalAvailability" :QUALIFIERS
                ((:DESCRIPTION
                  "Additional availability and status of the Device, beyond that specified in the Availability property. The Availability property denotes the primary status and availability of the Device. In some cases, this will not be sufficient to denote the complete status of the Device. In those cases, the AdditionalAvailability property can be used to provide further information. For example, a Device's primary Availability may be \"Off line\" (value=8), but it may also be in a low power state (AdditonalAvailability value=14), or the Device could be running Diagnostics (AdditionalAvailability value=5, \"In Test\").")
                 (:VALUE-MAP
                  ("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14"
                   "15" "16" "17" "18" "19" "20" "21"))
                 (:VALUES
                  ("Other" "Unknown" "Running/Full Power" "Warning" "In Test"
                   "Not Applicable" "Power Off" "Off Line" "Off Duty"
                   "Degraded" "Not Installed" "Install Error"
                   "Power Save - Unknown" "Power Save - Low Power Mode"
                   "Power Save - Standby" "Power Cycle" "Power Save - Warning"
                   "Paused" "Not Ready" "Not Configured" "Quiesced"))
                 (:MODEL-CORRESPONDENCE ("CIM_LogicalDevice.Availability")))
                :INITFORM NIL)
               (AVAILABLEREQUESTEDSTATES (ARRAY UINT16) :CIM-NAME
                "AvailableRequestedStates" :QUALIFIERS
                ((:DESCRIPTION
                  "AvailableRequestedStates indicates the possible values for the RequestedState parameter of the method RequestStateChange, used to initiate a state change. The values listed shall be a subset of the values contained in the RequestedStatesSupported property of the associated instance of CIM_EnabledLogicalElementCapabilities where the values selected are a function of the current state of the CIM_EnabledLogicalElement. This property may be non-null if an implementation is able to advertise the set of possible values as a function of the current state. This property shall be null if an implementation is unable to determine the set of possible values as a function of the current state.")
                 (:VALUE-MAP ("2" "3" "4" "6" "7" "8" "9" "10" "11" ".."))
                 (:VALUES
                  ("Enabled" "Disabled" "Shut Down" "Offline" "Test" "Defer"
                   "Quiesce" "Reboot" "Reset" "DMTF Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.RequestStateChange"
                   "CIM_EnabledLogicalElementCapabilities.RequestedStatesSupported")))
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
              (:CIM-NAME "CIM_CurrentSensor")
              (:QUALIFIERS (:DEPRECATED ("CIM_NumericSensor"))
               (:VERSION "2.8.0") (:UML-PACKAGE-PATH "CIM::Device::Sensors")
               (:DESCRIPTION
                "The use of this class is being deprecated in lieu of the additions to Sensor and NumericSensor. A CurrentSensor can be defined by setting the SensorType property, inherited from Sensor, to 4 (\"Current\").")))
(DEFCIM-METHOD RESTOREDEFAULTTHRESHOLDS
    ((INSTANCE CIM_CURRENTSENSOR))
    ((:CIM-NAME "RestoreDefaultThresholds")
     (:QUALIFIERS
      (:DESCRIPTION
       "This method resets the values of the thresholds to hardware defaults. This method returns 0 if successful, 1 if unsupported and any other value if an error occurred. In a subclass, the set of possible return codes could be specified, using a ValueMap qualifier on the method. The strings to which the ValueMap contents are 'translated' may also be specified in the subclass as a Values array qualifier."))))
(DEFCIM-METHOD GETNONLINEARFACTORS
    ((INSTANCE CIM_CURRENTSENSOR)
     (SENSORREADING SINT32 "SensorReading" :IN
      (:DESCRIPTION "The sensor reading to get information for."))
     (ACCURACY SINT32 "Accuracy" :IN :OUT
      (:DESCRIPTION "The accuracy of the reading."))
     (RESOLUTION UINT32 "Resolution" :IN :OUT
      (:DESCRIPTION "The resolution of the reading."))
     (TOLERANCE SINT32 "Tolerance" :IN :OUT
      (:DESCRIPTION "The tolerance of the reading."))
     (HYSTERESIS UINT32 "Hysteresis" :IN :OUT
      (:DESCRIPTION "The Hysteresis of the reading.")))
    ((:CIM-NAME "GetNonLinearFactors")
     (:QUALIFIERS (:DEPRECATED ("No value"))
      (:DESCRIPTION
       "The use of this method is being deprecated, since Current senor reading can be retrieved through the GetInstance operation. 
For a non-linear Sensor, the resolution, accuracy, tolerance and hysteresis vary as the current reading moves. This method can be used to get these factors for a given reading. It returns 0 if successful, 1 if unsupported, and any other value if an error occurred. In a subclass, the set of possible return codes could be specified, using a ValueMap qualifier on the method. The strings to which the ValueMap contents are 'translated' may also be specified in the subclass as a Values array qualifier."))))
(DEFCIM-METHOD SETPOWERSTATE
    ((INSTANCE CIM_CURRENTSENSOR)
     (POWERSTATE UINT16 "PowerState" :IN
      (:DESCRIPTION "The power state to set.")
      (:VALUE-MAP ("1" "2" "3" "4" "5" "6"))
      (:VALUES
       ("Full Power" "Power Save - Low Power Mode" "Power Save - Standby"
        "Power Save - Other" "Power Cycle" "Power Off")))
     (TIME
      DATETIME
      "Time"
      :IN
      (:DESCRIPTION
       "Time indicates when the power state should be set, either as a regular date-time value or as an interval value (where the interval begins when the method invocation is received.")))
    ((:CIM-NAME "SetPowerState")
     (:QUALIFIERS (:DEPRECATED ("CIM_PowerManagementService.SetPowerState"))
      (:DESCRIPTION
       "Sets the power state of the Device. The use of this method has been deprecated. Instead, use the SetPowerState method in the associated PowerManagementService class."))))
(DEFCIM-METHOD RESET
    ((INSTANCE CIM_CURRENTSENSOR))
    ((:CIM-NAME "Reset")
     (:QUALIFIERS
      (:DESCRIPTION
       "Requests a reset of the LogicalDevice. The return value should be 0 if the request was successfully executed, 1 if the request is not supported and some other value if an error occurred. In a subclass, the set of possible return codes could be specified, using a ValueMap qualifier on the method. The strings to which the ValueMap contents are 'translated' may also be specified in the subclass as a Values array qualifier."))))
(DEFCIM-METHOD ENABLEDEVICE
    ((INSTANCE CIM_CURRENTSENSOR)
     (ENABLED BOOLEAN "Enabled" :IN
      (:DESCRIPTION "If TRUE enable the device, if FALSE disable the device.")))
    ((:CIM-NAME "EnableDevice")
     (:QUALIFIERS
      (:DEPRECATED ("CIM_EnabledLogicalElement.RequestStateChange"))
      (:DESCRIPTION
       "The EnableDevice method has been deprecated in lieu of the more general RequestStateChange method that directly overlaps with the functionality provided by this method. 
Requests that the LogicalDevice be enabled (\"Enabled\" input parameter = TRUE) or disabled (= FALSE). If successful, the Device's StatusInfo/EnabledState properties should reflect the desired state (enabled/disabled). Note that this method's function overlaps with the RequestedState property. RequestedState was added to the model to maintain a record (i.e., a persisted value) of the last state request. Invoking the EnableDevice method should set the RequestedState property appropriately. 
The return code should be 0 if the request was successfully executed, 1 if the request is not supported and some other value if an error occurred. In a subclass, the set of possible return codes could be specified, using a ValueMap qualifier on the method. The strings to which the ValueMap contents are 'translated' may also be specified in the subclass as a Values array qualifier."))))
(DEFCIM-METHOD ONLINEDEVICE
    ((INSTANCE CIM_CURRENTSENSOR)
     (ONLINE BOOLEAN "Online" :IN
      (:DESCRIPTION
       "If TRUE, take the device online, if FALSE, take the device OFFLINE.")))
    ((:CIM-NAME "OnlineDevice")
     (:QUALIFIERS
      (:DEPRECATED ("CIM_EnabledLogicalElement.RequestStateChange"))
      (:DESCRIPTION
       "The OnlineDevice method has been deprecated in lieu of the more general RequestStateChange method that directly overlaps with the functionality provided by this method. 
Requests that the LogicalDevice be brought online (\"Online\" input parameter = TRUE) or taken offline (= FALSE). \"Online\" indicates that the Device is ready to accept requests, and is operational and fully functioning. In this case, the Device's Availability property would be set to a value of 3 (\"Running/Full Power\"). \"Offline\" indicates that a Device is powered up and operational, but not processing functional requests. In an offline state, a Device may be capable of running diagnostics or generating operational alerts. For example, when the \"Offline\" button is pushed on a Printer, the Device is no longer available to process print jobs, but could be available for diagnostics or maintenance. 
If this method is successful, the Device's Availability and AdditionalAvailability properties should reflect the updated status. If a failure occurs trying to bring the Device online or offline, it should remain in its current state. IE, the request, if unsuccessful, should not leave the Device in an indeterminate state. When bringing a Device back \"Online\", from an \"Offline\" mode, the Device should be restored to its last \"Online\" state, if at all possible. Only a Device that has an EnabledState/StatusInfo of \"Enabled\" and has been configured can be brought online or taken offline. 
OnlineDevice should return 0 if successful, 1 if the request is not supported at all, 2 if the request is not supported due to the current state of the Device, and some other value if any other error occurred. In a subclass, the set of possible return codes could be specified, using a ValueMap qualifier on the method. The strings to which the ValueMap contents are 'translated' may also be specified in the subclass as a Values array qualifier. 
Note that this method's function overlaps with the RequestedState property. RequestedState was added to the model to maintain a record (i.e., a persisted value) of the last state request. Invoking the OnlineDevice method should set the RequestedState property appropriately."))))
(DEFCIM-METHOD QUIESCEDEVICE
    ((INSTANCE CIM_CURRENTSENSOR)
     (QUIESCE BOOLEAN "Quiesce" :IN
      (:DESCRIPTION
       "If set to TRUE then cleanly cease all activity, if FALSE resume activity.")))
    ((:CIM-NAME "QuiesceDevice")
     (:QUALIFIERS
      (:DEPRECATED ("CIM_EnabledLogicalElement.RequestStateChange"))
      (:DESCRIPTION
       "The QuiesceDevice method has been deprecated in lieu of the more general RequestStateChange method that directly overlaps with the functionality provided by this method. 
Requests that the LogicalDevice cleanly cease all current activity (\"Quiesce\" input parameter = TRUE) or resume activity (= FALSE). For this method to quiesce a Device, that Device should have an Availability (or Additional Availability) of \"Running/Full Power\" (value=3) and an EnabledStatus/StatusInfo of \"Enabled\". For example, if quiesced, a Device may then be offlined for diagnostics, or disabled for power off and hot swap. For the method to \"unquiesce\" a Device, that Device should have an Availability (or AdditionalAvailability) of \"Quiesced\" (value=21) and an EnabledStatus/StatusInfo of \"Enabled\". In this case, the Device would be returned to an \"Enabled\" and \"Running/Full Power\" status. 
The method's return code should indicate the success or failure of the quiesce. It should return 0 if successful, 1 if the request is not supported at all, 2 if the request is not supported due to the current state of the Device, and some other value if any other error occurred. In a subclass, the set of possible return codes could be specified, using a ValueMap qualifier on the method. The strings to which the ValueMap contents are 'translated' may also be specified in the subclass as a Values array qualifier."))))
(DEFCIM-METHOD SAVEPROPERTIES
    ((INSTANCE CIM_CURRENTSENSOR))
    ((:CIM-NAME "SaveProperties")
     (:QUALIFIERS
      (:DESCRIPTION
       "Requests that the Device capture its current configuration, setup and/or state information in a backing store. The goal would be to use this information at a later time (via the RestoreProperties method), to return a Device to its present \"condition\". This method may not be supported by all Devices. The method should return 0 if successful, 1 if the request is not supported, and some other value if any other error occurred. In a subclass, the set of possible return codes could be specified, using a ValueMap qualifier on the method. The strings to which the ValueMap contents are 'translated' may also be specified in the subclass as a Values array qualifier."))))
(DEFCIM-METHOD RESTOREPROPERTIES
    ((INSTANCE CIM_CURRENTSENSOR))
    ((:CIM-NAME "RestoreProperties")
     (:QUALIFIERS
      (:DESCRIPTION
       "Requests that the Device re-establish its configuration, setup and/or state information from a backing store. The intent is to capture this information at an earlier time (via the SaveProperties method), and use it to return a Device to this earlier \"condition\". This method may not be supported by all Devices. The method should return 0 if successful, 1 if the request is not supported, and some other value if any other error occurred. In a subclass, the set of possible return codes could be specified, using a ValueMap qualifier on the method. The strings to which the ValueMap contents are 'translated' may also be specified in the subclass as a Values array qualifier."))))
(DEFCIM-METHOD REQUESTSTATECHANGE
    ((INSTANCE CIM_CURRENTSENSOR)
     (REQUESTEDSTATE UINT16 "RequestedState" :IN
      (:DESCRIPTION
       "The state requested for the element. This information will be placed into the RequestedState property of the instance if the return code of the RequestStateChange method is 0 ('Completed with No Error'), or 4096 (0x1000) ('Job Started'). Refer to the description of the EnabledState and RequestedState properties for the detailed explanations of the RequestedState values.")
      (:VALUE-MAP ("2" "3" "4" "6" "7" "8" "9" "10" "11" ".." "32768..65535"))
      (:VALUES
       ("Enabled" "Disabled" "Shut Down" "Offline" "Test" "Defer" "Quiesce"
        "Reboot" "Reset" "DMTF Reserved" "Vendor Reserved"))
      (:MODEL-CORRESPONDENCE ("CIM_EnabledLogicalElement.RequestedState")))
     (TIMEOUTPERIOD DATETIME "TimeoutPeriod" :IN
      (:DESCRIPTION
       "A timeout period that specifies the maximum amount of time that the client expects the transition to the new state to take. The interval format must be used to specify the TimeoutPeriod. A value of 0 or a null parameter indicates that the client has no time requirements for the transition. 
If this property does not contain 0 or null and the implementation does not support this parameter, a return code of 'Use Of Timeout Parameter Not Supported' shall be returned."))
     (JOB "CIM_ConcreteJob" "Job" :IN :OUT
      (:DESCRIPTION
       "May contain a reference to the ConcreteJob created to track the state transition initiated by the method invocation.")))
    ((:CIM-NAME "RequestStateChange")
     (:QUALIFIERS
      (:DESCRIPTION
       "Requests that the state of the element be changed to the value specified in the RequestedState parameter. When the requested state change takes place, the EnabledState and RequestedState of the element will be the same. Invoking the RequestStateChange method multiple times could result in earlier requests being overwritten or lost. 
A return code of 0 shall indicate the state change was successfully initiated. 
A return code of 3 shall indicate that the state transition cannot complete within the interval specified by the TimeoutPeriod parameter. 
A return code of 4096 (0x1000) shall indicate the state change was successfully initiated, a ConcreteJob has been created, and its reference returned in the output parameter Job. Any other return code indicates an error condition.")
      (:VALUE-MAP
       ("0" "1" "2" "3" "4" "5" "6" ".." "4096" "4097" "4098" "4099"
        "4100..32767" "32768..65535"))
      (:VALUES
       ("Completed with No Error" "Not Supported"
        "Unknown or Unspecified Error" "Cannot complete within Timeout Period"
        "Failed" "Invalid Parameter" "In Use" "DMTF Reserved"
        "Method Parameters Checked - Job Started" "Invalid State Transition"
        "Use of Timeout Parameter Not Supported" "Busy" "Method Reserved"
        "Vendor Specific"))
      (:MODEL-CORRESPONDENCE ("CIM_EnabledLogicalElement.RequestedState")))))