
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_IndicationServiceCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_INDICATIONSERVICECAPABILITIES (CIM_CAPABILITIES)
              ((FILTERCREATIONENABLEDISSETTABLE BOOLEAN :CIM-NAME
                "FilterCreationEnabledIsSettable" :QUALIFIERS
                ((:DESCRIPTION
                  "Boolean indicating whether the FilterCreationEnabled property can be set by a client application.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_IndicationService.FilterCreationEnabled")))
                :INITFORM NIL)
               (DELIVERYRETRYATTEMPTSISSETTABLE BOOLEAN :CIM-NAME
                "DeliveryRetryAttemptsIsSettable" :QUALIFIERS
                ((:DESCRIPTION
                  "Boolean indicating whether the DeliveryRetryAttempts property can be set by a client application.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_IndicationService.DeliveryRetryAttempts")))
                :INITFORM NIL)
               (DELIVERYRETRYINTERVALISSETTABLE BOOLEAN :CIM-NAME
                "DeliveryRetryIntervalIsSettable" :QUALIFIERS
                ((:DESCRIPTION
                  "Boolean indicating whether the DeliveryRetryInterval property can be set by a client application.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_IndicationService.DeliveryRetryInterval")))
                :INITFORM NIL)
               (SUBSCRIPTIONREMOVALACTIONISSETTABLE BOOLEAN :CIM-NAME
                "SubscriptionRemovalActionIsSettable" :QUALIFIERS
                ((:DESCRIPTION
                  "Boolean indicating whether the SubscriptionRemovalAction property can be set by a client application.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_IndicationService.SubscriptionRemovalAction")))
                :INITFORM NIL)
               (SUBSCRIPTIONREMOVALTIMEINTERVALISSETTABLE BOOLEAN :CIM-NAME
                "SubscriptionRemovalTimeIntervalIsSettable" :QUALIFIERS
                ((:DESCRIPTION
                  "Boolean indicating whether the SubscriptionRemovalTimeInterval property can be set by a client application.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_IndicationService.SubscriptionRemovalTimeInterval")))
                :INITFORM NIL)
               (MAXLISTENERDESTINATIONS UINT32 :CIM-NAME
                "MaxListenerDestinations" :QUALIFIERS
                ((:DESCRIPTION
                  "MaxListenerDestinations specifies the maximum number of instances of CIM_ListenerDestination allowed by the associated CIM_IndicationService.")
                 (:MIN-VALUE "1"))
                :INITFORM "1")
               (MAXACTIVESUBSCRIPTIONS UINT32 :CIM-NAME
                "MaxActiveSubscriptions" :QUALIFIERS
                ((:DESCRIPTION
                  "MaxActiveSubscriptions specifies the maximum total number of instances of CIM_IndicationSubcription and CIM_FilterCollectionSubscription instances supported by the CIM_IndicationService.")
                 (:MIN-VALUE "1"))
                :INITFORM "1")
               (SUBSCRIPTIONSPERSISTED BOOLEAN :CIM-NAME
                "SubscriptionsPersisted" :QUALIFIERS
                ((:DESCRIPTION
                  "SubscriptionsPersisted indicates whether or not the IndicationService persists indication subscriptions across restarts of the service. If SubscriptionsPersisted has a value of true, the indication service shall persist indication subscriptions across restarts of service. If SubscriptionsPersisted has a value of false, the indication service shall not persist indication subscriptions across restarts of the service. A value of NULL indicates support for subscription persistence is unknown."))
                :INITFORM "false")
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
              (:CIM-NAME "CIM_IndicationServiceCapabilities")
              (:QUALIFIERS (:VERSION "2.20.0")
               (:UML-PACKAGE-PATH "CIM::Core::Capabilities")
               (:DESCRIPTION
                "IndicationServiceCapabilities describes whether properties on the Indication Service can be modified by a client.")))