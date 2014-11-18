
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AbstractIndicationSubscription.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ABSTRACTINDICATIONSUBSCRIPTION NIL
              ((ONFATALERRORPOLICY UINT16 :CIM-NAME "OnFatalErrorPolicy"
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
               (FILTER NIL :CIM-NAME "Filter" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The Filter that defines the criteria and data of the possible Indications of this subscription."))
                :INITFORM "CIM_ManagedElement")
               (HANDLER NIL :CIM-NAME "Handler" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The Handler addressing delivery of the possible Indications of this subscription."))
                :INITFORM "CIM_ListenerDestination"))
              (:CIM-NAME "CIM_AbstractIndicationSubscription")
              (:QUALIFIERS :ASSOCIATION :ABSTRACT (:VERSION "2.31.0")
               (:UML-PACKAGE-PATH "CIM::Event")
               (:DESCRIPTION
                "CIM_IndicationSubscription describes a flow of Indications. The flow is specified by the referenced Filter, and directed to the referenced destination or process in the Handler. Property values of the referenced CIM_IndicationFilter instance and CIM_ListenerDestination instance MAY significantly effect the definition of the subscription. E.g., a subscription associated with a \"Transient\" destination MAY be deleted when the destination terminates or is no longer available.")))