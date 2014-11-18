
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SharedSecret.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SHAREDSECRET (CIM_CREDENTIAL)
              ((SYSTEMCREATIONCLASSNAME STRING :CIM-NAME
                "SystemCreationClassName" :QUALIFIERS
                ((:DEPRECATED ("CIM_SharedCredential.InstanceID")) :KEY
                 (:DESCRIPTION "The scoping System's CCN.") (:MAX-LEN "256")
                 (:PROPOGATED
                  "CIM_SharedSecretService.SystemCreationClassName"))
                :INITFORM NIL)
               (SYSTEMNAME STRING :CIM-NAME "SystemName" :QUALIFIERS
                ((:DEPRECATED ("CIM_SharedCredential.InstanceID")) :KEY
                 (:DESCRIPTION "The scoping System's Name.") (:MAX-LEN "256")
                 (:PROPOGATED "CIM_SharedSecretService.SystemName"))
                :INITFORM NIL)
               (SERVICECREATIONCLASSNAME STRING :CIM-NAME
                "ServiceCreationClassName" :QUALIFIERS
                ((:DEPRECATED ("CIM_SharedCredential.InstanceID")) :KEY
                 (:DESCRIPTION "The scoping Service's CCN.") (:MAX-LEN "256")
                 (:PROPOGATED "CIM_SharedSecretService.CreationClassName"))
                :INITFORM NIL)
               (SERVICENAME STRING :CIM-NAME "ServiceName" :QUALIFIERS
                ((:DEPRECATED ("CIM_SharedCredential.InstanceID")) :KEY
                 (:DESCRIPTION "The scoping Service's Name.") (:MAX-LEN "256")
                 (:PROPOGATED "CIM_SharedSecretService.Name"))
                :INITFORM NIL)
               (REMOTEID STRING :CIM-NAME "RemoteID" :QUALIFIERS
                ((:DEPRECATED ("CIM_SharedCredential.RemoteID")) :KEY
                 (:DESCRIPTION
                  "RemoteID is the name by which the principal is known at the remote secret key authentication service.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (SECRET STRING :CIM-NAME "Secret" :QUALIFIERS
                ((:DEPRECATED ("CIM_SharedCredential.Secret"))
                 (:DESCRIPTION "The secret known by the principal.")
                 :OCTET-STRING)
                :INITFORM NIL)
               (ALGORITHM STRING :CIM-NAME "Algorithm" :QUALIFIERS
                ((:DEPRECATED ("CIM_SharedCredential.Algorithm"))
                 (:DESCRIPTION
                  "The transformation algorithm, if any, used to protect passwords before use in the protocol. For instance, Kerberos doesn't store passwords as the shared secret, but rather, a hash of the password."))
                :INITFORM NIL)
               (PROTOCOL STRING :CIM-NAME "Protocol" :QUALIFIERS
                ((:DEPRECATED ("CIM_SharedCredential.Protocol"))
                 (:DESCRIPTION
                  "The protocol with which the SharedSecret is used."))
                :INITFORM NIL)
               (ISSUED DATETIME :CIM-NAME "Issued" :QUALIFIERS
                ((:DESCRIPTION
                  "The date and time when the credential was issued. Use a value of all '00000101000000.000000+000', (midnight, January 1, 1 BCE at coordinated universal time +0 minutes), if this information is not applicable. On CreateInstance, if this property is unspecified, or set to NULL, then current time is assumed."))
                :INITFORM NIL)
               (EXPIRES DATETIME :CIM-NAME "Expires" :QUALIFIERS
                ((:DESCRIPTION
                  "The date and time when the credential expires (and is not appropriate for use for authentication/ authorization). If this information is not applicable, Use a value of '99991231235959.999999+999', (1 microsecond before midnight, December 31, 9999 CE, at coordinated universal time + 999 minutes). 
On CreateInstance, if this property is unspecified, or set to NULL, then a value of '99991231235959.999999+999' is assumed. Note that this property does not define how the expiration is set - but that there IS an expiration. The property may be set to either a specific date/time or an interval (calculated from the Issued datetime). For example, for Certificate Authority-signed public key, the expiration is determined by the CA. Another example is a voice mail password that expires 60 days after it is set/issued."))
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
              (:CIM-NAME "CIM_SharedSecret")
              (:QUALIFIERS (:DEPRECATED ("CIM_SharedCredential"))
               (:VERSION "2.16.0")
               (:UML-PACKAGE-PATH "CIM::User::SharedSecret")
               (:DESCRIPTION
                "CIM_SharedSecret is a secret (such as a password or the response to a challenge question) that is shared between a principal and a particular SharedSecret security service. Secrets may be in the form of a password used for initial authentication, or as with a session key, used as part of a message to verify the originator of the message. It is important to note that SharedSecret is not just a password, but rather is the password used with a particular security service.")))