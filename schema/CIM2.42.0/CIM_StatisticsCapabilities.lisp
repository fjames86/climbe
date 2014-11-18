
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_StatisticsCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_STATISTICSCAPABILITIES (CIM_CAPABILITIES)
              ((INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
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
                :INITFORM NIL)
               (ELEMENTTYPESSUPPORTED (ARRAY UINT16) :CIM-NAME
                "ElementTypesSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "The list of element types for which statistical data is available. This property may not be meaningful if the StatisticsService these capabilities describe does not support StatisticalData instances for different types of elements."))
                :INITFORM NIL)
               (SYNCHRONOUSMETHODSSUPPORTED (ARRAY UINT16) :CIM-NAME
                "SynchronousMethodsSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "The synchronous mechanisms supported for retrieving statistics and defining and modifying filters for statistics retrieval.")
                 (:VALUE-MAP (".." "0x8000.."))
                 (:VALUES ("DMTF Reserved" "Vendor Specific")))
                :INITFORM NIL)
               (ASYNCHRONOUSMETHODSSUPPORTED (ARRAY UINT16) :CIM-NAME
                "AsynchronousMethodsSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "The asychronous mechanisms supported for retrieving statistics.")
                 (:VALUE-MAP (".." "0x8000.."))
                 (:VALUES ("DMTF Reserved" "Vendor Specific")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_StatisticsCapabilities")
              (:QUALIFIERS (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::StorageStatistics")
               (:DESCRIPTION
                "An instance of this class defines the specific support for the metered elements and methods for retrieving that statistical data from a StatisticsService.")))