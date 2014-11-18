
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ExtendedStaticIPAssignmentSettingData.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_EXTENDEDSTATICIPASSIGNMENTSETTINGDATA
              (CIM_IPASSIGNMENTSETTINGDATA)
              ((ADDRESSORIGIN UINT16 :CIM-NAME "AddressOrigin" :QUALIFIERS
                ((:DESCRIPTION
                  "AddressOrigin identifies the method by which the IP Address, Subnet Mask for IPv4 or Prefix Length for IPv6, and Gateway shall be assigned to the IPProtocolEndpoint. 
A value of 3 \"Static\" shall indicate the values will be assigned manually. 
A value of 4 \"DHCP\" shall indicate the values will be assigned utilizing the Dynamic Host Configuration Protocol. See RFC 2131 and related. 
A value of 5 \"BOOTP\" shall indicate the values will be assigned utilizing BOOTP. See RFC 951 and related. 
A value of 6 \"IPv4 Link Local\" shall indicate the values will be assigned using the IPv4 Link Local protocol. See RFC 3927.
A value of 7 \"DHCPv6\" shall indicate the values will be assigned using DHCPv6. See RFC 3315. 
A value of 8 \"IPv6 AutoConfig \" shall indicate the values will be assigned using the IPv6 AutoConfig. See RFC 4862. 
A value of 9 \"Stateless\" shall indicate Stateless will be assigned. 
A value of 10 \"Link Local\" shall indicate Link Local values will be assigned.
A value of 11 \"cumulative configuration\" shall indicate an accumulation of settings is used. This instance of CIM_IPAssignmentSettingData should be associated with other instances of CIM_IPAssignmentSettingData or its subclasses to represent the detailed IP settings.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" ".."
                   "32768.."))
                 (:VALUES
                  ("Unknown" "Other" "Not Applicable" "Static" "DHCP" "BOOTP"
                   "IPv4 Link Local" "DHCPv6" "IPv6AutoConfig" "Stateless"
                   "Link Local" "cumulative configuration" "DMTF Reserved"
                   "Vendor Reserved")))
                :INITFORM "0")
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
                :INITFORM NIL)
               (IPADDRESSES (ARRAY STRING) :CIM-NAME "IPAddresses" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "IP addresses to be statically assigned. Either IPv4 address array or IPv6 address array shall be represented by this property. If it is IPv6 array, then for each element, there will be a corresponding element in IPv6SubnetPrefixLengths array. If it is IPv4 array, then for each element, there will be a corresponding element in SubnetMasks array.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_IPAssignmentSettingData.ProtocolIFType")))
                :INITFORM NIL)
               (IPV6SUBNETPREFIXLENGTHS (ARRAY UINT16) :CIM-NAME
                "IPv6SubnetPrefixLengths" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "IPv6SubnetPrefixLengths is used to identify the prefix length of the IPv6Addresses")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ExtendedStaticIPAssignmentSettingData.IPAddresses")))
                :INITFORM NIL)
               (SUBNETMASKS (ARRAY STRING) :CIM-NAME "SubnetMasks" :QUALIFIERS
                (:WRITE (:DESCRIPTION "The mask for the IPv4 address.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ExtendedStaticIPAssignmentSettingData.IPAddresses")))
                :INITFORM NIL)
               (GATEWAYADDRESSES (ARRAY STRING) :CIM-NAME "GatewayAddresses"
                :QUALIFIERS
                (:WRITE (:DESCRIPTION "IP Addresses for the Gateways"))
                :INITFORM NIL))
              (:CIM-NAME "CIM_ExtendedStaticIPAssignmentSettingData")
              (:QUALIFIERS (:VERSION "2.32.0")
               (:UML-PACKAGE-PATH "CIM::Network::IP")
               (:DESCRIPTION
                "CIM_ExtendedStaticIPAssignmentSettingData defines a IP configuration which could be statically assigned to a Network Interface / LANEndpoint.")))