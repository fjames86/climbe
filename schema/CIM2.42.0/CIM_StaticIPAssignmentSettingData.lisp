
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_StaticIPAssignmentSettingData.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_STATICIPASSIGNMENTSETTINGDATA (CIM_IPASSIGNMENTSETTINGDATA)
              ((ADDRESSORIGIN UINT16 :CIM-NAME "AddressOrigin" :QUALIFIERS
                ((:OVERRIDE "AddressOrigin")
                 (:DESCRIPTION
                  "AddressOrigin identifies the method by which the IP Address, Subnet Mask, and Gateway were assigned to the IPProtocolEndpoint. A value of 2 indicates that the application of the IPAssignmentSettingData instance does not affect these properties.")
                 (:VALUE-MAP ("0..2" "3" "4..32767" "32768.."))
                 (:VALUES
                  ("DMTF Reserved" "Static" "DMTF Reserved"
                   "Vendor Reserved")))
                :INITFORM "3")
               (IPV4ADDRESS STRING :CIM-NAME "IPv4Address" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The IPv4 address that will be assigned to the ProtocolEndpoint."))
                :INITFORM NIL)
               (SUBNETMASK STRING :CIM-NAME "SubnetMask" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The subnet mask for the IPv4 address of this ProtocolEndpoint, if one is defined."))
                :INITFORM NIL)
               (GATEWAYIPV4ADDRESS STRING :CIM-NAME "GatewayIPv4Address"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION "The IP v4 address of the default gateway."))
                :INITFORM NIL)
               (GATEWAYIPV6ADDRESS STRING :CIM-NAME "GatewayIPv6Address"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "GatewayIPv6Address is used to identify the IPv6 address of the Gateway"))
                :INITFORM NIL)
               (IPV6ADDRESS STRING :CIM-NAME "IPv6Address" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The IPv6 address that this ProtocolEndpoint represents.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StaticIPAssignmentSettingData.IPv6AddressType"
                   "CIM_StaticIPAssignmentSettingData.IPv6SubnetPrefixLength")))
                :INITFORM NIL)
               (IPV6ADDRESSTYPE UINT16 :CIM-NAME "IPv6AddressType" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "IPv6AddressType identifies the type of address found in the IPv6Address property of this class. The values of this property shall be interpreted according to RFC4291, Section 2.4")
                 (:VALUE-MAP ("2" "3" "4" "5" "6" "7" "8" ".." "32768..65535"))
                 (:VALUES
                  ("Unspecified" "Loopback" "Multicast" "Link Local Unicast"
                   "Global Unicast" "Embedded IPv4 Address"
                   "Site Local Unicast" "DMTF Reserved" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StaticIPAssignmentSettingData.IPv6AddressType")))
                :INITFORM NIL)
               (IPV6SUBNETPREFIXLENGTH UINT16 :CIM-NAME
                "IPv6SubnetPrefixLength" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "IPv6SubnetPrefixLength is used to identify the prefix length of the IPv6Address property that is used to specify a subnet")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StaticIPAssignmentSettingData.IPv6Address")))
                :INITFORM NIL)
               (PROTOCOLIFTYPE UINT16 :CIM-NAME "ProtocolIFType" :QUALIFIERS
                ((:DESCRIPTION "An enumeration that describes the IP version.")
                 (:VALUE-MAP ("0" ".." "4096" "4097" "32768.."))
                 (:VALUES
                  ("Unknown" "DMTF Reserved" "IPv4" "IPv6" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ProtocolEndpoint.ProtocolIFType")))
                :INITFORM NIL)
               (INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. To ensure uniqueness within the NameSpace, the value of InstanceID should be constructed using the following \"preferred\" algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon (:), and where <OrgID> must include a copyrighted, trademarked, or otherwise unique name that is owned by the business entity that is creating or defining the InstanceID or that is a registered ID assigned to the business entity by a recognized global authority. (This requirement is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness, <OrgID> must not contain a colon (:). When using this algorithm, the first colon to appear in InstanceID must appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and should not be reused to identify different underlying (real-world) elements. If the above \"preferred\" algorithm is not used, the defining entity must assure that the resulting InstanceID is not reused across any InstanceIDs produced by this or other providers for the NameSpace of this instance. 
For DMTF-defined instances, the \"preferred\" algorithm must be used with the <OrgID> set to CIM."))
                :INITFORM NIL)
               (ELEMENTNAME STRING :CIM-NAME "ElementName" :QUALIFIERS
                (:REQUIRED (:OVERRIDE "ElementName")
                 (:DESCRIPTION
                  "The user-friendly name for this instance of SettingData. In addition, the user-friendly name can be used as an index property for a search or query. (Note: The name does not have to be unique within a namespace.)"))
                :INITFORM NIL)
               (CHANGEABLETYPE UINT16 :CIM-NAME "ChangeableType" :QUALIFIERS
                ((:DESCRIPTION
                  "Enumeration indicating the type of setting. 0 \"Not Changeable - Persistent\" indicates the instance of SettingData represents primordial settings and shall not be modifiable. 1 \"Changeable - Transient\" indicates the SettingData represents modifiable settings that are not persisted. Establishing persistent settings from transient settings may be supported. 2 \"Changeable - Persistent\" indicates the SettingData represents a persistent configuration that may be modified. 3 \"Not Changeable - Transient\" indicates the SettingData represents a snapshot of the settings of the associated ManagedElement and is not persistent.")
                 (:VALUE-MAP ("0" "1" "2" "3"))
                 (:VALUES
                  ("Not Changeable - Persistent" "Changeable - Transient"
                   "Changeable - Persistent" "Not Changeable - Transient")))
                :INITFORM NIL)
               (CONFIGURATIONNAME STRING :CIM-NAME "ConfigurationName"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An instance of CIM_SettingData may correspond to a well-known configuration that exists for an associated CIM_ManagedElement. If the ConfigurationName property is non-NULL, the instance of CIM_SettingData shall correspond to a well-known configuration for a Managed Element, the value of the ConfigurationName property shall be the name of the configuration, and the ChangeableType property shall have the value 0 or 2. A value of NULL for the ConfigurationName property shall mean that the instance of CIM_SettingData does not correspond to a well-known configuration for a Managed Element or that this information is unknown."))
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
              (:CIM-NAME "CIM_StaticIPAssignmentSettingData")
              (:QUALIFIERS (:VERSION "2.27.0")
               (:UML-PACKAGE-PATH "CIM::Network::IP")
               (:DESCRIPTION
                "CIM_StaticIPAssignmentSettingData defines a basic IP configuration which could be statically assigned to an IPProtocolEndpoint. This class defines a partial configuration. Instances are aggregated into an instance of IPAssignmentSettingData which defines a full configuration.")))