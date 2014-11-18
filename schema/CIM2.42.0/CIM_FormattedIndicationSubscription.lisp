
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_FormattedIndicationSubscription.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_FORMATTEDINDICATIONSUBSCRIPTION (CIM_INDICATIONSUBSCRIPTION)
              ((TEXTFORMATOWNINGENTITY STRING :CIM-NAME
                "TextFormatOwningEntity" :QUALIFIERS
                ((:DESCRIPTION
                  "The TextFormatOwningEntity is a string that uniquely identifies the entity that owns the definition of the human-readable format described in this instance. OwningEntity MUST include a copyrighted, trademarked or otherwise unique name that is owned by the business entity or standards body defining the format.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_FormattedIndicationSubscription.TextFormatID"
                   "CIM_FormattedIndicationSubscription.TextFormat"
                   "CIM_FormattedIndicationSubscription.TextFormatParameters")))
                :INITFORM NIL)
               (TEXTFORMATID STRING :CIM-NAME "TextFormatID" :QUALIFIERS
                ((:DESCRIPTION
                  "An opaque string that uniquely identifies, within the scope of the TextFormatOwningEntity, a human-readable format for representing the Indications described by this Subscription.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_FormattedIndicationSubscription.TextFormatOwningEntity"
                   "CIM_FormattedIndicationSubscription.TextFormat"
                   "CIM_FormattedIndicationSubscription.TextFormatParameters")))
                :INITFORM NIL)
               (TEXTFORMAT STRING :CIM-NAME "TextFormat" :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing the human-readable format for representing the Indications described by this Subscription. The actual text is constructed by applying the dynamic content, defined in the Indication, to the string specified in this property. /n /n The dynamic content is specified by embedding the following syntax in the appropriate places in the format string: 
\"{\" <index>[\"[\"[<index>]\"]\"],<type>\"}\" 
- the first occurrence of <index> defines the element of TextFormatParameters that contains the name of the Indication property to be used to populate the text message.
- if the Indication property defined by the first <index> is an array property, then the first index MUST be followed by either empty brackets (i.e., []) or an index value enclosed in brackets (e.g., [1]). If empty brackets are specified (e.g., {4[], string}), then the dynamic content of the text message is populated with a list of the array elements. If an index is specified (e.g., {4[1], string}, then only the specified array element is used to populate the message. If the value of the dynamic content is not defined in the Indication, then the string \"UNKNOWN\" is used to populate the text message.
- <type> defines the type of the dynamic content. Valid values for <type> are: 'boolean', 'string', 'char16', 'uint8', 'sint8', 'uint16', 'sint16', 'uint32', 'sint32', 'uint64', 'sint64', 'datetime', 'real32', 'real64' or 'ref'. 

The string encoding for the dynamic content MUST conform to the MOF Syntax Grammar described in the CIM Infrastructure Specification. The string encoding for a list of array elements MUST conform to the definition of the arrayInitializer element.
As an example, a format string for a UPS AlertIndication could be defined as follows: \"A {4,string} UPS Alert of type {5,uint16} was detected on the device {6,string} on the system {2,string} at {1,datetime}. The following actions have been recommended to resolve the alert: {3[],string}\"."))
                :INITFORM NIL)
               (ONFATALERRORPOLICY UINT16 :CIM-NAME "OnFatalErrorPolicy"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Defines the desired behavior for a subscription when a fatal error occurs in one of the Indication processing subcomponents (e.g., Indication processor, Indication or instance provider, or Indication handler) and the Indication cannot be successfully sent. Specifically, a failure implies that some aspect of Indication generation, processing or dispatch is no longer functioning and Indications may be lost. If the value of OnFatalErrorPolicy is 2 (\"Ignore\") or not set (NULL), the subscription MUST continue to be processed in a 'best effort' mode. This mode of operation can lead to unpredictable, and potentially misleading results, because Indications may be lost. If the value is 3 (\"Disable\"), the subscription MUST be disabled. With this policy, no new Indications will be generated or dispatched until the subscription is explicitly enabled. This is accomplished via the property, SubscriptionState. If the value is 4 (\"Remove\"), the subscription MUST be deleted. Selecting this policy has the same effect as issuing a DeleteInstance operation on this subscription instance.")
                 (:VALUE-MAP ("1" "2" "3" "4"))
                 (:VALUES ("Other" "Ignore" "Disable" "Remove")))
                :INITFORM NIL)
               (OTHERONFATALERRORPOLICY STRING :CIM-NAME
                "OtherOnFatalErrorPolicy" :QUALIFIERS
                ((:DESCRIPTION
                  "A string defining \"Other\" values for OnFatalErrorPolicy. This value MUST be set to a non NULL value when OnFatalErrorPolicy is set to a value of 1 (\"Other\"). For all other values, the OtherOnFatalErrorPolicy MUST be NULL."))
                :INITFORM NIL)
               (FAILURETRIGGERTIMEINTERVAL UINT64 :CIM-NAME
                "FailureTriggerTimeInterval" :QUALIFIERS
                ((:DESCRIPTION
                  "The FailureTriggerTimeInterval is used by the client to specify a recommended minimum delay before the OnFatalErrorPolicy is implemented.")
                 (NIL "Seconds") (:P-UNIT "second"))
                :INITFORM NIL)
               (SUBSCRIPTIONSTATE UINT16 :CIM-NAME "SubscriptionState"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "Indicates the current processing state of the subscription.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4"))
                 (:VALUES
                  ("Unknown" "Other" "Enabled" "Enabled Degraded" "Disabled")))
                :INITFORM NIL)
               (OTHERSUBSCRIPTIONSTATE STRING :CIM-NAME
                "OtherSubscriptionState" :QUALIFIERS
                ((:DESCRIPTION
                  "A string defining \"Other\" values for SubscriptionState. This value MUST be set to a non NULL value when SubscriptionState is set to a value of 1 (\"Other\"). For all other values, the OtherSubscriptionState MUST be NULL."))
                :INITFORM NIL)
               (TIMEOFLASTSTATECHANGE DATETIME :CIM-NAME
                "TimeOfLastStateChange" :QUALIFIERS
                ((:DESCRIPTION
                  "Date and time of the last state change. This value is based on the notion of local date and time of the Managed System Element running the Indication processing subcomponents."))
                :INITFORM NIL)
               (SUBSCRIPTIONDURATION UINT64 :CIM-NAME "SubscriptionDuration"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "SubscriptionDuration defines the desired length of the subscription. Indications generated after the duration of the subscription has exceeded SubscriptionDuration MUST NOT be sent. The duration of a subscription MAY be changed by modifying this property. An expired subscription MAY be deleted and MUST NOT be modified. If the value of SubscriptionDuration is not set, the subscription MUST be treated as having no expiration date.")
                 (NIL "Seconds") (:P-UNIT "second"))
                :INITFORM NIL)
               (SUBSCRIPTIONSTARTTIME DATETIME :CIM-NAME
                "SubscriptionStartTime" :QUALIFIERS
                ((:DESCRIPTION
                  "SubscriptionStartTime is the time the subscription was started. The value of this property is computed based on the notion of date and time of the ManagedSystemElement running the Indication processing subcomponents."))
                :INITFORM NIL)
               (SUBSCRIPTIONTIMEREMAINING UINT64 :CIM-NAME
                "SubscriptionTimeRemaining" :QUALIFIERS
                ((:DESCRIPTION
                  "SubscriptionTimeRemaining is a computed value that provides a snapshot of the time remaining in the Subscription.")
                 (NIL "Seconds") (:P-UNIT "second"))
                :INITFORM NIL)
               (REPEATNOTIFICATIONPOLICY UINT16 :CIM-NAME
                "RepeatNotificationPolicy" :QUALIFIERS
                ((:DESCRIPTION
                  "The RepeatNotificationPolicy property defines the desired behavior for handling Indications that report the occurrence of the same underlying event (e.g., the disk is still generating I/O errors and has not yet been repaired). The defined semantics for the RepeatNotificationCount, RepeatNotificationInterval, and RepeatNotificationGap properties depend on the value of RepeatNotificationPolicy, but values for these properties MUST be set if the property is defined for the selected policy. If the value of RepeatNotificationPolicy is 0 (\"Unknown\") or not set, no special processing for repeat Indications is defined by the subscription. The semantics associated with the handling of repeat Indications MAY be defined by the Indication processing subcomponents. If the value of RepeatNotificationPolicy is 2 (\"None\"), special processing of repeat Indications MUST NOT be performed. If the value is 3 (\"Suppress\") the first RepeatNotificationCount Indications, describing the same event, MUST be sent and all subsequent Indications for this event suppressed for the remainder of the time interval RepeatNotificationInterval. A new interval starts when the next Indication for this event is received. If the value of RepeatNotificationPolicy is 4 (\"Delay\") and an Indication is received, this Indication MUST be suppressed if, including this Indication, RepeatNoticationCount or fewer Indications for this event have been received during the prior time interval defined by RepeatNotificationInterval. If this Indication is the RepeatNotificationCount + 1 Indication, this Indication MUST be sent and all subsequent Indications for this event ignored until the RepeatNotificationGap has elapsed. A RepeatNotificationInterval MAY NOT overlap a RepeatNotificationGap time interval.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4"))
                 (:VALUES ("Unknown" "Other" "None" "Suppress" "Delay")))
                :INITFORM NIL)
               (OTHERREPEATNOTIFICATIONPOLICY STRING :CIM-NAME
                "OtherRepeatNotificationPolicy" :QUALIFIERS
                ((:DESCRIPTION
                  "A string defining \"Other\" values for RepeatNotificationPolicy. This value MUST be set to a non NULL value when RepeatNotificationPolicy is set to a value of 1 (\"Other\"). For all other values, the OtherRepeatNotificationPolicy MUST be NULL."))
                :INITFORM NIL)
               (REPEATNOTIFICATIONINTERVAL UINT64 :CIM-NAME
                "RepeatNotificationInterval" :QUALIFIERS
                ((:DESCRIPTION
                  "Defines the time interval for the repeat notification policy calculation.")
                 (NIL "Seconds") (:P-UNIT "second"))
                :INITFORM NIL)
               (REPEATNOTIFICATIONGAP UINT64 :CIM-NAME "RepeatNotificationGap"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Defines the gap interval for the repeat notification policy calculation.")
                 (NIL "Seconds") (:P-UNIT "second"))
                :INITFORM NIL)
               (REPEATNOTIFICATIONCOUNT UINT16 :CIM-NAME
                "RepeatNotificationCount" :QUALIFIERS
                ((:DESCRIPTION
                  "Defines the count property for the repeat notification policy calculation."))
                :INITFORM NIL)
               (SUBSCRIPTIONINFO STRING :CIM-NAME "SubscriptionInfo"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "Subscription identification information. May be used by the client or protocol to store subscription identification information."))
                :INITFORM NIL)
               (TEXTFORMATPARAMETERS (ARRAY STRING) :CIM-NAME
                "TextFormatParameters" :QUALIFIERS
                ((:DESCRIPTION
                  "An indexed array containing the names of properties defined in the select clause of the associated CIM_IndicationFilter Query. The values of these Indication properties are used to populate the dynamic content of the text message.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_FormattedIndicationSubscription.TextFormatOwningEntity"
                   "CIM_FormattedIndicationSubscription.TextFormatID"
                   "CIM_FormattedIndicationSubscription.TextFormat")))
                :INITFORM NIL)
               (FILTER NIL :CIM-NAME "Filter" :QUALIFIERS
                (:KEY (:OVERRIDE "Filter")
                 (:DESCRIPTION
                  "The Filter that defines the criteria and data of the possible Indications of this subscription."))
                :INITFORM "CIM_IndicationFilter")
               (HANDLER NIL :CIM-NAME "Handler" :QUALIFIERS
                (:KEY (:OVERRIDE "Handler")
                 (:DESCRIPTION
                  "The Handler addressing delivery of the possible Indications of this subscription."))
                :INITFORM "CIM_ListenerDestination"))
              (:CIM-NAME "CIM_FormattedIndicationSubscription")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Event")
               (:DESCRIPTION
                "A subclass of IndicationSubscription that defines the text formatting of Indication information. The TextFormatOwningEntity, TextFormatID, TextFormat, and TextFormatParameters properties are used to describe a human-readable representation of the Indication as defined by the referenced CIM_IndicationFilter. This representation MAY be used by the CIM_ListenerDestination when the intended consumer of the Indication is human. For example, this format could be used when writing the Indication to a system log or sending an e-mail notification to a system administrator.")))