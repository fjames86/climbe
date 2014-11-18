
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_iSCSILoginStatistics.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ISCSILOGINSTATISTICS (CIM_STATISTICALDATA)
              ((LOGINFAILURES UINT64 :CIM-NAME "LoginFailures" :QUALIFIERS
                ((:DESCRIPTION
                  "This property counts the number of times a login attempt from this node(initiator) or to this node(target) has failed.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|iSCSI-MIB.iscsiIntrLoginFailures"
                   "MIB.IETF|iSCSI-MIB.iscsiTgtLoginFailures")))
                :INITFORM NIL)
               (LASTLOGINFAILURETIME DATETIME :CIM-NAME "LastLoginFailureTime"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The timestamp of the most recent failure of a login attempt from this node(initiator) or to this node(target). A value of zero indicates that no such failures have occurred since the last system boot.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|iSCSI-MIB.iscsiIntrLastFailureTime"
                   "MIB.IETF|iSCSI-MIB.iscsiTgtLastFailureTime"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_iSCSILoginStatistics.LastLoginFailureType"
                   "CIM_iSCSILoginStatistics.LastLoginFailureRemoteNodeName")))
                :INITFORM NIL)
               (LASTLOGINFAILURETYPE UINT16 :CIM-NAME "LastLoginFailureType"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The type of the most recent failure of a login attempt from this node(initiator) or to this node(target).")
                 (:VALUE-MAP ("1" "2" "3" "4" "5"))
                 (:VALUES
                  ("Other" "Negotiate" "Authenticate" "Authorize" "Redirect"))
                 (:MAPPING-STRINGS
                  ("MIB.IETF|iSCSI-MIB.iscsiIntrLastFailureType"
                   "MIB.IETF|iSCSI-MIB.iscsiTgtLastFailureType"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_iSCSILoginStatistics.OtherLastLoginFailureType"
                   "CIM_iSCSILoginStatistics.LastLoginFailureTime"
                   "CIM_iSCSILoginStatistics.LastLoginFailureRemoteNodeName")))
                :INITFORM NIL)
               (OTHERLASTLOGINFAILURETYPE STRING :CIM-NAME
                "OtherLastLoginFailureType" :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing the type of the last login failure when LastLoginFailureType is equal to the value 1, \"Other\".")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_iSCSILoginStatistics.LastLoginFailureType")))
                :INITFORM NIL)
               (LASTLOGINFAILUREREMOTENODENAME STRING :CIM-NAME
                "LastLoginFailureRemoteNodeName" :QUALIFIERS
                ((:DESCRIPTION
                  "The iSCSI name of the remote node that failed the last login attempt.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|iSCSI-MIB.iscsiIntrLastTgtFailureName"
                   "MIB.IETF|iSCSI-MIB.iscsiTgtLastIntrFailureName"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_iSCSILoginStatistics.LastLoginFailureTime"
                   "CIM_iSCSILoginStatistics.LastLoginFailureType"
                   "CIM_iSCSILoginStatistics.LastLoginFailureRemoteAddressType"
                   "CIM_iSCSILoginStatistics.LastLoginFailureRemoteAddress")))
                :INITFORM NIL)
               (LASTLOGINFAILUREREMOTEADDRESSTYPE UINT16 :CIM-NAME
                "LastLoginFailureRemoteAddressType" :QUALIFIERS
                ((:DESCRIPTION
                  "The type of Internet Network Address of the remote node that failed the last login attempt.")
                 (:VALUE-MAP ("1" "2")) (:VALUES ("IPv4" "IPv6"))
                 (:MAPPING-STRINGS
                  ("MIB.IETF|iSCSI-MIB.iscsiIntrLastTgtFailureAddrType"
                   "MIB.IETF|iSCSI-MIB.iscsiTgtLastIntrFailureAddrType"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_iSCSILoginStatistics.LastLoginFailureRemoteNodeName"
                   "CIM_iSCSILoginStatistics.LastLoginFailureRemoteAddress")))
                :INITFORM NIL)
               (LASTLOGINFAILUREREMOTEADDRESS UINT32 :CIM-NAME
                "LastLoginFailureRemoteAddress" :QUALIFIERS
                ((:DESCRIPTION
                  "An Internet Network Address giving the host address of the remote node that failed the last login attempt.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|iSCSI-MIB.iscsiIntrLastTgtFailureAddr"
                   "MIB.IETF|iSCSI-MIB.iscsiTgtLastIntrFailureAddr"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_iSCSILoginStatistics.LastLoginFailureRemoteNodeName"
                   "CIM_iSCSILoginStatistics.LastLoginFailureRemoteAddressType")))
                :INITFORM NIL)
               (SUCCESSFULLOGINS UINT64 :CIM-NAME "SuccessfulLogins"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The count of Login Response PDUs with status 0x0000, Accept Login, received by this node(initator), or transmitted by this node (target).")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|iSCSI-MIB.iscsiIntrLoginAcceptRsps"
                   "MIB.IETF|iSCSI-MIB.iscsiTgtLoginAccepts")))
                :INITFORM NIL)
               (NEGOTIATIONLOGINFAILURES UINT64 :CIM-NAME
                "NegotiationLoginFailures" :QUALIFIERS
                ((:DESCRIPTION
                  "If the node is an initiator this property is the number of times it has aborted a login because parameter negotiation with the target failed. 
If the node is a target the property is the number of times a it has effectively refused a login because the parameter negotiation failed. While this situation can occur, the exact mechanism is as yet undefined in the iSCSI Protocol Spec.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|iSCSI-MIB.iscsiIntrLoginNegotiateFails"
                   "MIB.IETF|iSCSI-MIB.iscsiTgtLoginNegotiateFails")))
                :INITFORM NIL)
               (AUTHENTICATIONLOGINFAILURES UINT64 :CIM-NAME
                "AuthenticationLoginFailures" :QUALIFIERS
                ((:DESCRIPTION
                  "If the node is an initiator this property is the number of times it has aborted a login because the target could not be authenticated. If the node is a target this property is the count of Login Response PDUs with status 0x0201, Authentication Failed, transmitted by this target.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|iSCSI-MIB.iscsiIntrLoginAuthenticateFails"
                   "MIB.IETF|iSCSI-MIB.iscsiTgtLoginAuthenticateFails")))
                :INITFORM NIL)
               (AUTHORIZATIONLOGINFAILURES UINT64 :CIM-NAME
                "AuthorizationLoginFailures" :QUALIFIERS
                ((:DESCRIPTION
                  "If the node is an initiator this property is the count of Login Response PDUs with status class 0x201, 'Authentication Failed', received by this initiator. If the node is a target the property is the count of Login Response PDUs with status 0x0202, 'Forbidden Target', transmitted by this target.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|iSCSI-MIB.iscsiIntrLoginAuthFailRsps"
                   "MIB.IETF|iSCSI-MIB.iscsiTgtLoginAuthorizeFails")))
                :INITFORM NIL)
               (LOGINREDIRECTS UINT64 :CIM-NAME "LoginRedirects" :QUALIFIERS
                ((:DESCRIPTION
                  "The count of Login Response PDUs with status class 0x01, Redirection, received by this node(initiator) or transmitted by this node(target).")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|iSCSI-MIB.iscsiIntrLoginRedirectRsps"
                   "MIB.IETF|iSCSI-MIB.iscsiTgtLoginRedirects")))
                :INITFORM NIL)
               (OTHERLOGINFAILURES UINT64 :CIM-NAME "OtherLoginFailures"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The number of failure Login Response PDUs which were received by this node(initiator) or were transmitted by this node(target), and which were not counted by any other property in this class.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|iSCSI-MIB.iscsiIntrLoginOtherFailRsps"
                   "MIB.IETF|iSCSI-MIB.iscsiTgtLoginOtherFails")))
                :INITFORM NIL)
               (NORMALLOGOUTS UINT64 :CIM-NAME "NormalLogouts" :QUALIFIERS
                ((:DESCRIPTION
                  "The count of Logout Command PDUs generated by this node (initiator) or received by this node(target), with reason code 0 (closes the session).")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|iSCSI-MIB.iscsiIntrLogoutNormals"
                   "MIB.IETF|iSCSI-MIB.iscsiTgtLogoutNormals")))
                :INITFORM NIL)
               (OTHERLOGOUTS UINT64 :CIM-NAME "OtherLogouts" :QUALIFIERS
                ((:DESCRIPTION
                  "The count of Logout Command PDUs generated by this node, (initiator) or received by this node(target), with any reason code other than 0.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|iSCSI-MIB.iscsiIntrLogoutOthers"
                   "MIB.IETF|iSCSI-MIB.iscsiTgtLogoutOthers")))
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
                  "The user friendly name for this instance of StatisticalData. In addition, the user friendly name can be used as a index property for a search of query. (Note: Name does not have to be unique within a namespace.)"))
                :INITFORM NIL)
               (STARTSTATISTICTIME DATETIME :CIM-NAME "StartStatisticTime"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The time, relative to managed element where the statistic was collected, when the first measurement was taken. If the statistic is reset, the StartStatisticTime is the time when the reset was performed."))
                :INITFORM NIL)
               (STATISTICTIME DATETIME :CIM-NAME "StatisticTime" :QUALIFIERS
                ((:DESCRIPTION
                  "The time the most recent measurement was taken, relative to the managed element where the statistic was collected."))
                :INITFORM NIL)
               (SAMPLEINTERVAL DATETIME :CIM-NAME "SampleInterval" :QUALIFIERS
                ((:DESCRIPTION
                  "Some statistics are sampled at consistent time intervals. This property provides the sample interval so that client applications can determine the minimum time that new statistics should be pulled. If the statistics are not sampled at consistent time intervals, this property must be set to a zero time interval."))
                :INITFORM "00000000000000.000000:000")
               (CAPTION STRING :CIM-NAME "Caption" :QUALIFIERS
                ((:DESCRIPTION
                  "The Caption property is a short textual description (one- line string) of the object.")
                 (:MAX-LEN "64"))
                :INITFORM NIL)
               (DESCRIPTION STRING :CIM-NAME "Description" :QUALIFIERS
                ((:DESCRIPTION
                  "The Description property provides a textual description of the object."))
                :INITFORM NIL))
              (:CIM-NAME "CIM_iSCSILoginStatistics")
              (:QUALIFIERS (:VERSION "2.11.0")
               (:UML-PACKAGE-PATH "CIM::Network::iSCSI")
               (:DESCRIPTION
                "Statistics for Logins and Logouts to or from an iSCSI Node. An instance of this class will be associated by ElementStatisticalData to an instance of SCSIProtocolController that represents the Node. The Node can be either an Initiator or Target and so the interpretation of the properties in this class varies accordingly.")))
(DEFCIM-METHOD RESETSELECTEDSTATS
    ((INSTANCE CIM_ISCSILOGINSTATISTICS)
     (SELECTEDSTATISTICS (ARRAY STRING) "SelectedStatistics" :IN
      (:DESCRIPTION "Array of strings indicating which statistics to reset.")))
    ((:CIM-NAME "ResetSelectedStats")
     (:QUALIFIERS
      (:DESCRIPTION
       "Method to reset one or more of the instance's statistics. The method takes one parameter as input - an array of strings indicating which statistics to reset. If all the statistics in the instance should be reset, the first element of the array MUST be set to \"All\" or \"ALL\". If one or more individual statistics should be reset, the corresponding property names are entered into the elements of the array. 
The method returns 0 if successful, 1 if not supported, and any other value if an error occurred. A method is specified so that the StatisticalInformation's provider/ instrumentation, which calculates the statistics, can reset its internal processing, counters, etc. 
In a subclass, the set of possible return codes could be specified, using a ValueMap qualifier on the method. The strings to which the ValueMap contents are 'translated' may also be specified in the subclass as a Values array qualifier."))))