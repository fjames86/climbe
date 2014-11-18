
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ParticipatingCS.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PARTICIPATINGCS (CIM_DEPENDENCY)
              ((STATEOFNODE UINT16 :CIM-NAME "StateOfNode" :QUALIFIERS
                ((:DESCRIPTION
                  "StateOfNode indicates the condition of the participating ComputerSystem in the Cluster. For example, one value is \"Joining\" (2).")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6"))
                 (:VALUES
                  ("Unknown" "Other" "Joining" "Paused" "Available"
                   "Unavailable" "Degraded")))
                :INITFORM NIL)
               (ROLEOFNODE UINT16 :CIM-NAME "RoleOfNode" :QUALIFIERS
                ((:DESCRIPTION
                  "RoleOfNode indicates whether the Cluster nodes are peers (value = 2), connected in a master-slave/primary- secondary relationship (values = 3 for primary, 4 for secondary), available in a standby configuration (5) or of some other (1) or unknown (0) relationship. In a System/390 environment, the nodes are identified as \"Base Plex\" (value=6) or \"Enhanced Plex\" (value=7).")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6" "7"))
                 (:VALUES
                  ("Unknown" "Other" "Peer" "Primary" "Secondary" "Standby"
                   "Base Plex" "Enhanced Plex")))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1")
                 (:DESCRIPTION
                  "The ComputerSystem which participates in the Cluster.")
                 :KEY)
                :INITFORM "CIM_ComputerSystem")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:DESCRIPTION "The Cluster.") :KEY)
                :INITFORM "CIM_Cluster"))
              (:CIM-NAME "CIM_ParticipatingCS")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::System::SystemElements")
               (:DESCRIPTION
                "A Cluster is composed of two or more ComputerSystems, operating together. A ComputerSystem may participate in multiple Clusters. 

When first establishing or bringing up a Cluster, only one ComputerSystem may be defined as participating in it. Therfore, the cardinality of the association for the ComputerSystem reference is Min (1).")))