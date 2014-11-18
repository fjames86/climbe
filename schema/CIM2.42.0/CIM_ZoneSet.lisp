
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ZoneSet.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ZONESET (CIM_CONNECTIVITYCOLLECTION)
              ((ELEMENTNAME STRING :CIM-NAME "ElementName" :QUALIFIERS
                (:REQUIRED (:OVERRIDE "ElementName") :WRITE
                 (:DESCRIPTION
                  "A user-friendly name for the ZoneSet that is unique within the AdminDomain."))
                :INITFORM NIL)
               (ACTIVE BOOLEAN :CIM-NAME "Active" :QUALIFIERS
                (:REQUIRED :WRITE
                 (:DESCRIPTION
                  "Indicates that this ZoneSet is currently active (that is, under enforcement of a fabric). This property can be used to distinguish between a ZoneSet that is currently active and a snapshot of a ZoneSet (with the same InstanceName) that is for \"offline\" editing."))
                :INITFORM NIL)
               (CONNECTIVITYSTATUS UINT16 :CIM-NAME "ConnectivityStatus"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration describing the current or potential connectivity between endpoints in this collection. Connectivity may be provided or not, or may be in a degraded/partitioned state if one or more endpoints or links have failed. The latter would prevent full connectivity between all elements in the Collection, but would permit connectivity between subsets.")
                 (:VALUE-MAP ("0" "2" "3" "4"))
                 (:VALUES
                  ("Unknown" "Connectivity/Up" "No Connectivity/Down"
                   "Partitioned")))
                :INITFORM NIL)
               (INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. To ensure uniqueness within the NameSpace, the value of InstanceID should be constructed using the following 'preferred' algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon ':', and where <OrgID> must include a unique name. It can be a copyrighted, trademarked, or otherwise unique name that is owned by the business entity that is creating or defining the InstanceID. Or, it could be a registered ID that is assigned to the business entity by a recognized global authority.(This requirement is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness <OrgID> must not contain a colon (':'). When using this algorithm, the first colon to appear in InstanceID must appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and should not be re-used to identify different underlying (real-world) elements. If the above 'preferred' algorithm is not used, the defining entity must ensure that the resulting InstanceID is not re-used as any of InstanceIDs produced by this or other providers for the NameSpace of this instance. 
For DMTF-defined instances, the 'preferred' algorithm must be used with the <OrgID> set to 'CIM'."))
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
              (:CIM-NAME "CIM_ZoneSet")
              (:QUALIFIERS (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::FC")
               (:DESCRIPTION
                "A ZoneSet is a group of zones that are managed collectively by the same domain. The managing domain is indicated by the HostedCollection association. For example, for Fibre Channel, this property would indicate a set of zones that are part of a fabric. The zones are under enforcement by the fabric, only if the Zoneset is set to active.")))