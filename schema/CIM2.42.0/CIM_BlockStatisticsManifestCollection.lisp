
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_BlockStatisticsManifestCollection.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_BLOCKSTATISTICSMANIFESTCOLLECTION
              (CIM_SYSTEMSPECIFICCOLLECTION)
              ((ELEMENTNAME STRING :CIM-NAME "ElementName" :QUALIFIERS
                ((:OVERRIDE "ElementName")
                 (:DESCRIPTION
                  "A user-friendly name for the BlockStatisticsManifestCollection. It can be set through the ElementName parameter of the StatisticsService.CreateManifestCollection method."))
                :INITFORM NIL)
               (ISDEFAULT BOOLEAN :CIM-NAME "IsDefault" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "Denotes whether or not this BlockStatisticsManifestCollection is a provider defined default BlockStatisticsManifestCollection."))
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
              (:CIM-NAME "CIM_BlockStatisticsManifestCollection")
              (:QUALIFIERS (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::StorageStatistics")
               (:DESCRIPTION
                "The BlockStatisticsManifestCollection class aggregates, via MemberOfCollection, a set of BlockStatisticsManifests. This collection is associated via AssociatedBlockStatisticsManifestCollection to exactly one StatisticsCollection. The BlockStatisticsManifestCollection is used to filter the retrieval of statistics. For example, a BlockStatisticsManifestCollection is specified as part of the StatisticsService.GetStatisticsCollection method to filter the statistics returned by that method.")))