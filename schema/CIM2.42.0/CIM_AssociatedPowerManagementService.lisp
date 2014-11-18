
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AssociatedPowerManagementService.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ASSOCIATEDPOWERMANAGEMENTSERVICE
              (CIM_SERVICEAVAILABLETOELEMENT)
              ((POWERSTATE UINT16 :CIM-NAME "PowerState" :QUALIFIERS
                ((:DESCRIPTION
                  "The current power state of the associated Managed System Element.")
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
                 (:MAPPING-STRINGS ("MIF.DMTF|System Power Controls|001.2"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PowerManagementCapabilities.PowerCapabilities")))
                :INITFORM NIL)
               (OTHERPOWERSTATE STRING :CIM-NAME "OtherPowerState" :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing the additional power management state of the element, used when the PowerState is set to the value 1, \"Other\".")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_AssociatedPowerManagementService.PowerState")))
                :INITFORM NIL)
               (REQUESTEDPOWERSTATE UINT16 :CIM-NAME "RequestedPowerState"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The desired or the last requested power state of the associated Managed System Element, irrespective of the mechanism through which the request was made. If the requested power state is unknown, then the property shall have the value of 0 (\"Unknown\"). If the property has no meaning or is not supported, then the property shall have value 12(\"Not Applicable\").")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" "17" "18" ".." "0x7FFF..0xFFFF"))
                 (:VALUES
                  ("Unknown" "Other" "On" "Sleep - Light" "Sleep -_Deep"
                   "Power Cycle (Off - Soft)" "Off - Hard"
                   "Hibernate (Off - Soft)" "Off - Soft"
                   "Power Cycle (Off-Hard)" "Master Bus Reset"
                   "Diagnostic Interrupt (NMI)" "Not Applicable"
                   "Off - Soft Graceful" "Off - Hard Graceful"
                   "Master Bus Reset Graceful"
                   "Power Cycle (Off - Soft Graceful)"
                   "Power Cycle (Off - Hard Graceful)"
                   "Diagnostic Interrupt (INIT)" "DMTF Reserved"
                   "Vendor Specific"))
                 (:MAPPING-STRINGS ("MIF.DMTF|System Power Controls|001.2"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PowerManagementCapabilities.PowerCapabilities"
                   "CIM_AssociatedPowerManagementService.OtherRequestedPowerState")))
                :INITFORM "12")
               (OTHERREQUESTEDPOWERSTATE STRING :CIM-NAME
                "OtherRequestedPowerState" :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing the additional power management state of the element, used when the RequestedPowerState is set to the value 1, \"Other\".")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_AssociatedPowerManagementService.RequestedPowerState")))
                :INITFORM NIL)
               (POWERONTIME DATETIME :CIM-NAME "PowerOnTime" :QUALIFIERS
                ((:DESCRIPTION
                  "The time when the element will be powered on again, used when the RequestedPowerState has the value 2, \"On\", 5, \"Power Cycle (Off - Soft)\" or 6, \"Power Cycle (Off - Hard)\".")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_AssociatedPowerManagementService.RequestedPowerState")))
                :INITFORM NIL)
               (TRANSITIONINGTOPOWERSTATE UINT16 :CIM-NAME
                "TransitioningToPowerState" :QUALIFIERS
                ((:DESCRIPTION
                  "TransitioningToPowerState indicates the target power state to which the system is transitioning. 
A value of 19 \"No Change\" shall indicate that no transition is in progress. A value of 18 \"Not Applicable\" shall indicate the implementation does not support representing ongoing transitions. 
A value other than 18 or 19 shall identify the power state to which the element is in the process of transitioning.")
                 (:VALUE-MAP
                  ("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14"
                   "15" "16" "17" "18" "19" ".." "0x7FFF..0xFFFF"))
                 (:VALUES
                  ("Other" "On" "Sleep - Light" "Sleep -Deep"
                   "Power Cycle (Off - Soft)" "Off - Hard"
                   "Hibernate (Off - Soft)" "Off - Soft"
                   "Power Cycle (Off-Hard)" "Master Bus Reset"
                   "Diagnostic Interrupt (NMI)" "Off - Soft Graceful"
                   "Off - Hard Graceful" "Master Bus Reset Graceful"
                   "Power Cycle (Off - Soft Graceful)"
                   "Power Cycle (Off - Hard Graceful)"
                   "Diagnostic Interrupt (INIT)" "Not Applicable" "No Change"
                   "DMTF Reserved" "Vendor Specific"))
                 (:MAPPING-STRINGS ("MIF.DMTF|System Power Controls|001.2"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PowerManagementCapabilities.PowerCapabilities")))
                :INITFORM NIL)
               (AVAILABLEREQUESTEDPOWERSTATES (ARRAY UINT16) :CIM-NAME
                "AvailableRequestedPowerStates" :QUALIFIERS
                ((:DESCRIPTION
                  "AvailableRequestedPowerStates indicates the possible values for the PowerState parameter of the method RequestPowerStateChange, used to initiate a power state change.The values listed shall be a subset of the values contained in the RequestedPowerStatesSupported property of the CIM_PowerManagementCapabilities where the values selected are a function of the current power state of the system. This property shall be non-null if an implementation supports the advertisement of the set of possible values as a function of the current state. This property shall be null if an implementation does not support the advertisement of the set of possible values as a function of the current state. 
The current values in the enumeration are: 
2=On, corresponding to ACPI state G0 or S0 or D0. 
3=Sleep - Light, corresponding to ACPI state G1, S1/S2, or D1. 
4=Sleep - Deep, corresponding to ACPI state G1, S3, or D2.
5=Power Cycle (Off - Soft), corresponding to ACPI state G2, S5, or D3, but where the managed element is set to return to power state \"On\" at a pre-determined time. 
6=Off - Hard, corresponding to ACPI state G3, S5, or D3. 
7=Hibernate (Off - Soft), corresponding to ACPI state S4, where the state of the managed element is preserved and will be recovered upon powering on. 
8=Off - Soft, corresponding to ACPI state G2, S5, or D3. 9= Power Cycle (Off-Hard), corresponds to the managed element reaching the ACPI state G3 followed by ACPI state S0. 
10=Master Bus Reset, corresponds to the system reaching ACPI state S5 followed by ACPI state S0. This is used to represent system master bus reset. 11=Diagnostic Interrupt (NMI), corresponding to the system reaching ACPI state S5 followed by ACPI state S0. This is used to represent system non-maskable interrupt. 12=Off - Soft Graceful, equivalent to Off Soft but preceded by a request to the managed element to perform an orderly shutdown. 
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
                  ("CIM_PowerManagementCapabilities.RequestedPowerStatesSupported"
                   "CIM_PowerManagementService.RequestPowerStateChange"
                   "CIM_AssociatedPowerManagementService.PowerState")))
                :INITFORM NIL)
               (SERVICEPROVIDED NIL :CIM-NAME "ServiceProvided" :QUALIFIERS
                ((:OVERRIDE "ServiceProvided") (:MAX "1")
                 (:DESCRIPTION "The Service that is available.") :KEY)
                :INITFORM "CIM_PowerManagementService")
               (USEROFSERVICE NIL :CIM-NAME "UserOfService" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION "The ManagedElement that can use the Service."))
                :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_AssociatedPowerManagementService")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.24.1")
               (:UML-PACKAGE-PATH "CIM::Core::PowerMgmt")
               (:DESCRIPTION
                "The association between a Managed System Element and its power management service.")))