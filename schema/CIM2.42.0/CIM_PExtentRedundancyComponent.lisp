
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PExtentRedundancyComponent.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PEXTENTREDUNDANCYCOMPONENT (CIM_EXTENTREDUNDANCYCOMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                ((:DEPRECATED ("CIM_ExtentRedundancyComponent.GroupComponent"))
                 :AGGREGATE (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION "The StorageRedundancyGroup.") :KEY)
                :INITFORM "CIM_StorageRedundancyGroup")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:DEPRECATED ("CIM_ExtentRedundancyComponent.PartComponent"))
                 (:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "The PhysicalExtent participating in the RedundancyGroup.")
                 :KEY)
                :INITFORM "CIM_PhysicalExtent"))
              (:CIM-NAME "CIM_PExtentRedundancyComponent")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_ExtentRedundancyComponent")) (NIL "true")
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Device::SccExtents")
               (:DESCRIPTION
                "Describes the PhysicalExtents participating in a Storage RedundancyGroup. However, there is no need for the specificity of this association. It is deprecated in lieu of the generic ExtentRedundancyComponent relationship, its superclass.")))