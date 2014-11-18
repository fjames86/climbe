
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_CollectedSoftwareFeatures.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_COLLECTEDSOFTWAREFEATURES (CIM_MEMBEROFCOLLECTION)
              ((COLLECTION NIL :CIM-NAME "Collection" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "Collection")
                 (:DESCRIPTION
                  "The collection representing the installed image of a Product.")
                 :KEY)
                :INITFORM "CIM_InstalledProduct")
               (MEMBER NIL :CIM-NAME "Member" :QUALIFIERS
                       ((:OVERRIDE "Member")
                        (:DESCRIPTION
                         "The SoftwareFeature that is a member of the InstalledProduct collection.")
                        :KEY)
                       :INITFORM "CIM_SoftwareFeature"))
              (:CIM-NAME "CIM_CollectedSoftwareFeatures")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Application::InstalledProduct")
               (:DESCRIPTION
                "CollectedSoftwareFeatures defines the SoftwareFeatures that are collected by InstalledProduct (ie, the installed image of a Product).")))