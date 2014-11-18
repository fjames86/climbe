
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PowerManagementCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_POWERMANAGEMENTCAPABILITIES (CIM_CAPABILITIES)
              ((OTHERPOWERCHANGECAPABILITIES STRING :CIM-NAME
                "OtherPowerChangeCapabilities" :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing the additional power management capabilities of the element, used when the PowerChangeCapabilities is set to the value 1, \"Other\".")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PowerManagementCapabilities.PowerChangeCapabilities")))
                :INITFORM NIL)
               (INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
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
                  "The user friendly name for this instance of Capabilities. In addition, the user friendly name can be used as a index property for a search of query. (Note: Name does not have to be unique within a namespace.)"))
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
               (POWERCAPABILITIES (ARRAY UINT16) :CIM-NAME "PowerCapabilities"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration indicating the specific power-related capabilities of a managed element. Since this is an array, multiple values may be specified. The current values in the enumeration are: 
0 = Unknown 
1 = Other 
2 = Power Saving Modes Entered Automatically, describing that a managed element can change its power state based on usage or other criteria 
3 = Power State Settable, indicating that the SetPowerState method is supported 
4 = Power Cycling Supported, indicating that the SetPowerState method can be invoked with the PowerState input variable set to 'Power Cycle' 
5 = Timed Power On Supported, indicating that the SetPowerState method can be invoked with the PowerState input variable set to 'Power Cycle' and the Time parameter set to a specific date and time, or interval, for power-on.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5"))
                 (:VALUES
                  ("Unknown" "Other" "Power Saving Modes Entered Automatically"
                   "Power State Settable" "Power Cycling Supported"
                   "Timed Power On Supported"))
                 (:MAPPING-STRINGS ("MIF.DMTF|System Power Controls|001.2"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PowerManagementCapabilities.OtherPowerCapabilitiesDescriptions"
                   "CIM_PowerManagementService.SetPowerState")))
                :INITFORM NIL)
               (OTHERPOWERCAPABILITIESDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "OtherPowerCapabilitiesDescriptions" :QUALIFIERS
                ((:DESCRIPTION
                  "An array of strings describing an element's additional power management capabilities, used when the PowerCapabilities array includes the value 1, \"Other\".")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PowerManagementCapabilities.PowerCapabilities")))
                :INITFORM NIL)
               (POWERSTATESSUPPORTED (ARRAY UINT16) :CIM-NAME
                "PowerStatesSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration that indicates the power states supported by a managed element. Because this is an array, multiple values can be specified. The current values in the enumeration are: 
2=On, corresponding to ACPI state G0 or S0 or D0. 
3=Sleep - Light, corresponding to ACPI state G1, S1/S2, or D1. 
4=Sleep - Deep, corresponding to ACPI state G1, S3, or D2.
5=Power Cycle (Off - Soft), corresponding to ACPI state G2, S5, or D3, but where the managed element is set to return to power state \"On\" at a pre-determined time. 
6=Off - Hard, corresponding to ACPI state G3, S5, or D3. 
7=Hibernate (Off - Soft), corresponding to ACPI state S4, where the state of the managed element is preserved and will be recovered upon powering on. 
8=Off - Soft, corresponding to ACPI state G2, S5, or D3. 9= Power Cycle (Off-Hard), corresponds to the managed element reaching the ACPI state G3 followed by ACPI state S0. 
10=Master Bus Reset, corresponds to the system reaching ACPI state S5 followed by ACPI state S0. This is used to represent system master bus reset. 11=Diagnostic Interrupt (NMI), corresponding to the system reaching ACPI state S5 followed by ACPI state S0. This is used to represent system non-maskable interrupt. 12=Off - Soft Graceful, equivalent to Off Soft but preceded by a request to the managed element to perform an orderlyshutdown. 
13=Off - Hard Graceful, equivalent to Off Hard but preceded by a request to the managed element to perform an orderly shutdown. 
14=Master Bus Rest Graceful, equivalent to Master Bus Reset but preceded by a request to the managed element to perform an orderly shutdown. 
15=Power Cycle (Off - Soft Graceful), equivalent to Power Cycle (Off - Soft) but preceded by a request to the managed element to perform an orderly shutdown. 
16=Power Cycle (Off - Hard Graceful), equivalent to Power Cycle (Off - Hard) but preceded by a request to the managed element to perform an orderly shutdown. 
..=DMTF Reserved. 
0x7FFF..0xFFFF = Vendor Specific.")
                 (:VALUE-MAP
                  ("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14"
                   "15" "16" ".." "0x7FFF..0xFFFF"))
                 (:VALUES
                  ("Other" "On" "Sleep - Light" "Sleep -Deep"
                   "Power Cycle (Off - Soft)" "Off - Hard"
                   "Hibernate (Off - Soft)" "Off - Soft"
                   "Power Cycle (Off-Hard)" "Master Bus Reset"
                   "Diagnostic Interrupt (NMI)" "Off - Soft Graceful"
                   "Off - Hard Graceful" "Master Bus Reset Graceful"
                   "Power Cycle (Off - Soft Graceful)"
                   "Power Cycle (Off - Hard Graceful)" "DMTF Reserved"
                   "Vendor Specific"))
                 (:MAPPING-STRINGS ("IEEE P1621 | 3.2"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PowerManagementService.RequestPowerStateChange"
                   "CIM_AssociatedPowerManagementService.PowerState")))
                :INITFORM NIL)
               (POWERCHANGECAPABILITIES (ARRAY UINT16) :CIM-NAME
                "PowerChangeCapabilities" :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration indicating the specific power-related capabilities of a managed element. Since this is an array, multiple values may be specified. The current values in the enumeration are: 
0 = Unknown 
1 = Other 
2 = Power Saving Modes Entered Automatically, describing that a managed element can change its power state based on usage or other criteria 
3 = Power State Settable, indicating that the RequestPowerStateChange method is supported 
4 = Power Cycling Supported, indicating that the RequestPowerStateChange method can be invoked with the PowerState input variable set to 'Power Cycle (Off Soft)' 
5 = Timed Power On Supported, indicating that the RequestPowerStateChange method can be invoked with the PowerState input variable set to 'Power On' and the Time parameter set to a specific date and time, or interval, for power-on.8 = Graceful Shutdown Supported, indicating that the managed element can be sent a hardware signal requesting an orderly shutdown prior to the requested power state change.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6" "7" "8"))
                 (:VALUES
                  ("Unknown" "Other" "Power Saving Modes Entered Automatically"
                   "Power State Settable" "Power Cycling Supported"
                   "Timed Power On Supported"
                   "Off Hard Power Cycling Supported" "HW Reset Supported"
                   "Graceful Shutdown Supported"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PowerManagementService.RequestPowerStateChange"
                   "CIM_PowerManagementCapabilities.OtherPowerChangeCapabilities")))
                :INITFORM NIL)
               (REQUESTEDPOWERSTATESSUPPORTED (ARRAY UINT16) :CIM-NAME
                "RequestedPowerStatesSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration that indicates the requested power states supported by the power management service. Because this is an array, multiple values can be specified. The current values in the enumeration are: 
2=On, corresponding to ACPI state G0 or S0 or D0. 
3=Sleep - Light, corresponding to ACPI state G1, S1/S2, or D1. 
4=Sleep - Deep, corresponding to ACPI state G1, S3, or D2.
5=Power Cycle (Off - Soft), corresponding to ACPI state G2, S5, or D3, but where the managed element is set to return to power state \"On\" at a pre-determined time. 
6=Off - Hard, corresponding to ACPI state G3, S5, or D3. 
7=Hibernate (Off - Soft), corresponding to ACPI state S4, where the state of the managed element is preserved and will be recovered upon powering on. 
8=Off - Soft, corresponding to ACPI state G2, S5, or D3. 9= Power Cycle (Off-Hard), corresponds to the managed element reaching the ACPI state G3 followed by ACPI state S0. 
10=Master Bus Reset, corresponds to the system reaching ACPI state S5 followed by ACPI state S0. This is used to represent system master bus reset. 11=Diagnostic Interrupt (NMI), corresponding to the system reaching ACPI state S5 followed by ACPI state S0. This is used to represent system non-maskable interrupt. 12=Off - Soft Graceful, equivalent to Off Soft but preceded by a request to the managed element to perform an orderlyshutdown. 
13=Off - Hard Graceful, equivalent to Off Hard but preceded by a request to the managed element to perform an orderly shutdown. 
14=Master Bus Rest Graceful, equivalent to Master Bus Reset but preceded by a request to the managed element to perform an orderly shutdown. 
15=Power Cycle (Off - Soft Graceful), equivalent to Power Cycle (Off - Soft) but preceded by a request to the managed element to perform an orderly shutdown. 
16=Power Cycle (Off - Hard Graceful), equivalent to Power Cycle (Off - Hard) but preceded by a request to the managed element to perform an orderly shutdown. 
17=Diagnostic Interrupt (INIT), equivalent to Diagnostic Interrupt (NMI) but performed by an INIT switch instead because the NMI signal is masked. 
..=DMTF Reserved. 
0x7FFF..0xFFFF = Vendor Specific.")
                 (:VALUE-MAP
                  ("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14"
                   "15" "16" "17" ".." "0x7FFF..0xFFFF"))
                 (:VALUES
                  ("Other" "On" "Sleep - Light" "Sleep -Deep"
                   "Power Cycle (Off - Soft)" "Off - Hard"
                   "Hibernate (Off - Soft)" "Off - Soft"
                   "Power Cycle (Off-Hard)" "Master Bus Reset"
                   "Diagnostic Interrupt (NMI)" "Off - Soft Graceful"
                   "Off - Hard Graceful" "Master Bus Reset Graceful"
                   "Power Cycle (Off - Soft Graceful)"
                   "Power Cycle (Off - Hard Graceful)"
                   "Diagnostic Interrupt (INIT)" "DMTF Reserved"
                   "Vendor Specific"))
                 (:MAPPING-STRINGS ("IEEE P1621 | 3.2"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PowerManagementCapabilities.PowerStatesSupported"
                   "CIM_PowerManagementService.RequestPowerStateChange"
                   "CIM_AssociatedPowerManagementService.PowerState")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_PowerManagementCapabilities")
              (:QUALIFIERS (:VERSION "2.23.0")
               (:UML-PACKAGE-PATH "CIM::Core::PowerMgmt")
               (:DESCRIPTION
                "A class derived from Capabilities that describes the power management aspects of an element (typically a system or device). The element's power management capabilities are decoupled from a PowerManagementService, since a single service could apply to multiple elements, each with specific capabilities.")))