
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ServiceAvailableToDatabase.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SERVICEAVAILABLETODATABASE (CIM_SERVICEAVAILABLETOELEMENT)
              ((AVAILABLESTATE UINT16 :CIM-NAME "AvailableState" :QUALIFIERS
                ((:DESCRIPTION
                  "The AvailableState property indicates the current state of a database service regarding its ability to access a specific database. A service can be actively using a database (ACTIVE), or it can be waiting for a task to perform (AVAILABLE), or the service can be less than completely available for use by the database (RESTRICTED), or the database is not accessible from this service (UNAVAILABLE). Any service states that do not match one of these values should specify (OTHER).")
                 (:VALUE-MAP ("1" "2" "3" "4" "5"))
                 (:VALUES
                  ("Other" "Active" "Available" "Restricted" "Unavailable"))
                 (:MAPPING-STRINGS ("MIB.IETF|RDBMS-MIB.rdbmsRelState"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ServiceAvailableToDatabase.OtherAvailableState")))
                :INITFORM NIL)
               (OTHERAVAILABLESTATE STRING :CIM-NAME "OtherAvailableState"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A string that describes the available state of the service when the AvailableState property is set to 1 (\"Other\"). This property must be set to NULL when AvailableState is any value other than 1.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ServiceAvailableToDatabase.AvailableState")))
                :INITFORM NIL)
               (ACTIVETIME DATETIME :CIM-NAME "ActiveTime" :QUALIFIERS
                ((:DESCRIPTION
                  "The time that the database was made active by this service. 
If the AvailableState property is not active, then the value of this property must be set to 0.")
                 (:MAPPING-STRINGS ("MIB.IETF|RDBMS-MIB.rdbmsRelActiveTime")))
                :INITFORM NIL)
               (SERVICEPROVIDED NIL :CIM-NAME "ServiceProvided" :QUALIFIERS
                ((:OVERRIDE "ServiceProvided")
                 (:DESCRIPTION
                  "The database service that is providing service.")
                 :KEY)
                :INITFORM "CIM_DatabaseService")
               (USEROFSERVICE NIL :CIM-NAME "UserOfService" :QUALIFIERS
                ((:OVERRIDE "UserOfService")
                 (:DESCRIPTION "The database that is being served.") :KEY)
                :INITFORM "CIM_CommonDatabase"))
              (:CIM-NAME "CIM_ServiceAvailableToDatabase")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Database::System")
               (:DESCRIPTION
                "The CIM_ServiceAvailableToDatabase association relates databases to the database services that are available for database use.")))