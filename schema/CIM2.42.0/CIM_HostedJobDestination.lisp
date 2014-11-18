
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_HostedJobDestination.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_HOSTEDJOBDESTINATION (CIM_HOSTEDDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The hosting System.") :KEY)
                :INITFORM "CIM_System")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") :WEAK
                 (:DESCRIPTION "The JobDestination hosted on the System.")
                 :KEY)
                :INITFORM "CIM_JobDestination"))
              (:CIM-NAME "CIM_HostedJobDestination")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::System::Processing")
               (:DESCRIPTION
                "An association between a JobDestination and a System on which it resides. The cardinality of this association is 1-to-many. A System may host many Job queues. Job Destinations are weak with respect to their hosting System. Heuristic: A JobDestination is hosted on the System where the LogicalDevices, SoftwareFeatures or Services that implement/ provide the JobDestination are located.")))