
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ComputerSystemNodeCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_COMPUTERSYSTEMNODECAPABILITIES (CIM_CAPABILITIES)
              ((BATTERYSUPPORTED UINT16 :CIM-NAME "BatterySupported"
                :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "Enumeration indicating whether a battery is installable/ supportable on this System. This is independent of whether one is currently installed. The latter is indicated by an instance of the CIM_Battery class associated using the SystemDevice relationship.")
                 (:VALUE-MAP ("0" "2" "3"))
                 (:VALUES
                  ("Unknown" "Battery Supported" "Battery Not Supported")))
                :INITFORM NIL)
               (ECCSUPPORTED UINT16 :CIM-NAME "ECCSupported" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "Enumeration indicating whether ECC single or multi-bit memory is supported on this node. This is independent of whether ECC memory is actually installed. The latter is indicated by an instance of CIM_PhysicalMemory that 'Realizes' the CIM_Memory of the System (associated using SystemDevice).")
                 (:VALUE-MAP ("0" "2" "3"))
                 (:VALUES ("Unknown" "Single-bit ECC" "Multi-bit ECC"))
                 (:MAPPING-STRINGS ("MIF.DMTF|Physical Memory|002.10")))
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
                :INITFORM NIL))
              (:CIM-NAME "CIM_ComputerSystemNodeCapabilities")
              (:QUALIFIERS (:VERSION "2.7.2")
               (:UML-PACKAGE-PATH "CIM::System::SystemElements")
               (:DESCRIPTION
                "Indicates general capabilities of a ComputerSystem node, such as the ability to support a battery (and be portable), and ECC memory. To tie these capabilities to a ComputerSystem instance, the ElementCapabilities association is used.")))