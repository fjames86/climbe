
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ClusterServiceAccessBySAP.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CLUSTERSERVICEACCESSBYSAP (CIM_SERVICEACCESSBYSAP)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The ClusteringService.") :KEY)
                :INITFORM "CIM_ClusteringService")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "An access point for the ClusteringService.")
                 :KEY)
                :INITFORM "CIM_ClusteringSAP"))
              (:CIM-NAME "CIM_ClusterServiceAccessBySAP")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::System::SystemElements")
               (:DESCRIPTION
                "ClusterServiceAccessBySAP is the relationship between a ClusteringService and its access points.")))