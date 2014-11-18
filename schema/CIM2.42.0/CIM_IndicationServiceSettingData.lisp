
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_IndicationServiceSettingData.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_INDICATIONSERVICESETTINGDATA (CIM_SETTINGDATA)
              ((FILTERCREATIONENABLED BOOLEAN :CIM-NAME "FilterCreationEnabled"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The FilterCreationEnabled property controls whether or not clients can create indication filters. If this value is set to false, only the indication filters that exist can be subscribed to. If this value is true clients may attempt to create filters.
Note that implementations may preset this setting and not allow this value to be modified."))
                :INITFORM "false")
               (DELIVERYRETRYATTEMPTS UINT16 :CIM-NAME "DeliveryRetryAttempts"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "Defines the number of retries that the indication service will try to deliver an indication to a particular listener destination. This does not effect the original delivery attempt, thus if set to 0, it will only try to deliver the indication once. Note that implementations may preset this setting and not allow this value to be modified.")
                 (:MIN-VALUE "0")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_IndicationServiceSettingData.DeliveryRetryInterval")))
                :INITFORM "3")
               (DELIVERYRETRYINTERVAL UINT32 :CIM-NAME "DeliveryRetryInterval"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "Defines the minimal time interval in seconds for the indication service to use before delivering an indication to a particular listener destination that previously failed. The implementation may take longer due to QoS or other processing. Note that implementations may preset this setting and not allow this value to be modified.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_IndicationServiceSettingData.DeliveryRetryAttempts"))
                 (:P-UNIT "second"))
                :INITFORM "30")
               (SUBSCRIPTIONREMOVALACTION UINT16 :CIM-NAME
                "SubscriptionRemovalAction" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "Defines the removal action for subscriptions that have two failed indication deliveries without any successful indication deliveries in between and the time between the failed deliveries exceeded the timeout defined in the SubscriptionRemovalTimeInterval property. \"Remove\" defines the subscription is to be removed. 
\"Disable\" indicates that subscription removal process isnot being enforced.
\"Ignore\" indicates that the removal action is temporarily not enforced.
Implementations may preset this setting and not allow this value to be modified.")
                 (:VALUE-MAP ("2" "3" "4" ".."))
                 (:VALUES ("Remove" "Disable" "Ignore" "DMTF Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_IndicationServiceSettingData.SubscriptionRemovalTimeInterval")))
                :INITFORM NIL)
               (SUBSCRIPTIONREMOVALTIMEINTERVAL UINT32 :CIM-NAME
                "SubscriptionRemovalTimeInterval" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "Minimum time between two failed indication deliveries without any successful indication deliveries in between before the SubscriptionRemovalPolicy goes into effect.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_IndicationServiceSettingData.SubscriptionRemovalAction"))
                 (:P-UNIT "second"))
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
              (:CIM-NAME "CIM_IndicationServiceSettingData")
              (:QUALIFIERS (:VERSION "2.20.0") (:UML-PACKAGE-PATH "CIM::Event")
               (:DESCRIPTION
                "An IndicationService is a Service of the CIM Object Manager that is responsible for delivering indications. The following are available settings for the Indication Service. The following describes a possible configuration of settings for the associated Indication Service.")))