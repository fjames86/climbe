
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_J2eeManagedObjectCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_J2EEMANAGEDOBJECTCAPABILITIES (CIM_CAPABILITIES)
              ((INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                ((:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "InstanceID identifies a unique instance of a J2EE ManagedObject's Capabilities in a given namespace. In order to ensure uniqueness, the value of InstanceID MUST be constructed using the form specified in JSR77.3.1.1.1 in order to avoid the need for manual key propagation.")
                 (:MAPPING-STRINGS ("JSR77.JCP|JSR77.3.1.1.1 objectName|V1.0"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_J2eeManagedObjectCapabilities.ElementName"))
                 :KEY)
                :INITFORM NIL)
               (ELEMENTNAME STRING :CIM-NAME "ElementName" :QUALIFIERS
                ((:OVERRIDE "ElementName")
                 (:DESCRIPTION
                  "The name of a J2EE managed object. The name MUST be constructed using the form specified in JSR77.3.1.1.1 in order to avoid the need for manual key propagation.")
                 (:MAX-LEN "256")
                 (:MAPPING-STRINGS ("JSR77.JCP|JSR77.3.1.1.1 objectName|V1.0"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_J2eeManagedObjectCapabilities.InstanceID"))
                 :REQUIRED)
                :INITFORM NIL)
               (STATEMANAGEABLE BOOLEAN :CIM-NAME "StateManageable" :QUALIFIERS
                ((:DESCRIPTION
                  "A property that indicates whether the managed object implements the state management model as defined in State Management chapter of the JSR77 specification. A value of true indicates that the managed object implements the state management interface. A value of false indicates that the managed object does not implement the state management interface.")
                 (:MAPPING-STRINGS
                  ("JSR77.JCP|JSR77.3.1.1.2 stateManageable|V1.0")))
                :INITFORM NIL)
               (STATISTICSPROVIDER BOOLEAN :CIM-NAME "StatisticsProvider"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A property that indicates whether the managed object implements the statistics provider model as defined in Performance Monitoring chapter of the JSR77 specification. A value of true indicates that the managed object implements the statistics provider interface. A value of false indicates that the managed object does not implement the statistics provider interface.")
                 (:MAPPING-STRINGS
                  ("JSR77.JCP|JSR77.3.1.1.3 statisticsProvider|V1.0")))
                :INITFORM NIL)
               (EVENTPROVIDER BOOLEAN :CIM-NAME "EventProvider" :QUALIFIERS
                ((:DESCRIPTION
                  "A property that indicates whether the managed object implements the event provider model as defined in the Events chapter of the JSR77 specification. A value of true indicates that the managed object implements the event provider interface. A value of false indicates that the managed object does not implement the event provider interface.")
                 (:MAPPING-STRINGS
                  ("JSR77.JCP|JSR77.3.1.1.4 eventProvider|V1.0")))
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
              (:CIM-NAME "CIM_J2eeManagedObjectCapabilities")
              (:QUALIFIERS :ABSTRACT (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Application::J2eeAppServer")
               (:DESCRIPTION
                "CIM_J2eeManagedObjectCapabilities is a class for defining additional capabilities of J2EE managed objects. It contains the attributes that are common to all J2EE managed objects. These common attributes are mapped to the corresponding J2EE classes using the CIM_ElementCapabilities association.")))