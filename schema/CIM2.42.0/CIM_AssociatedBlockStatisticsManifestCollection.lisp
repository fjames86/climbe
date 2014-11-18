
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AssociatedBlockStatisticsManifestCollection.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ASSOCIATEDBLOCKSTATISTICSMANIFESTCOLLECTION NIL
              ((STATISTICS NIL :CIM-NAME "Statistics" :QUALIFIERS
                (:KEY (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The collection of statistics filtered by the BlockStatisticsManifestCollection."))
                :INITFORM "CIM_StatisticsCollection")
               (MANIFESTCOLLECTION NIL :CIM-NAME "ManifestCollection"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The collection of Manifests applied to the StatisticsCollection."))
                :INITFORM "CIM_BlockStatisticsManifestCollection"))
              (:CIM-NAME "CIM_AssociatedBlockStatisticsManifestCollection")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::StorageStatistics")
               (:DESCRIPTION
                "Instances of this class associate a BlockStatisticsManifestCollection to the StatisticsCollection to which is is applied. The ManifestCollection contains the Manifests that are used to filter requests for the retrieval of statistics.")))