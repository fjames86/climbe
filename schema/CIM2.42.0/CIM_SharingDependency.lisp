
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SharingDependency.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SHARINGDEPENDENCY (CIM_HOSTEDDEPENDENCY)
              ((CURRENTACCESS UINT16 :CIM-NAME "CurrentAccess" :QUALIFIERS
                ((:DESCRIPTION
                  "CurrentAccess describes the current ability of the System owning the Dependent LogicalDevice to access the shared device. This property does not model whether or not the referenced System is authorized to utilize the shared resource. It is intended to model the current sharing relationship the system has to the device. Authorization for a user or service running within the system would be modeled identical to if the resource was owned exclusively by the system. However, the ability of an authorized user to utilize a shared resource is contingent on the System having access to the shared resource. 
Unknown (0) indicates that the current access of the System to the shared resource is unknown 
No Access (1) indicates that the System currently does not have access to the shared resource 
Exclusive Access (2) indicates that the System has exclusive access to the shared resource. The resource is effectively locked. Granting another System access to the shared resource will cause this system to lose access. 
Shared Read (3) indicates that the System is accessing the resource in a read only mode. Other Systems can have concurrent access to the device of type \"Shared Read\" or \"Shared Full\" 
Shared Full (4) indicates that the System is accessing the resource in read/write mode. Other Systems can have concurrent access to the device of type \"Shared Read\" or \"Shared Full\".")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" ".." "32768..65535"))
                 (:VALUES
                  ("Unknown" "Other" "No Access" "Exclusive Access"
                   "Shared Read" "Shared Full" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SharingDependency.OtherCurrentAccess"
                   "CIM_DeviceSharingCapabilities.SupportedAccessModes")))
                :INITFORM NIL)
               (OTHERCURRENTACCESS STRING :CIM-NAME "OtherCurrentAccess"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A string value describing CurrentAccess when it has a value of \"1 (Other)\".")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SharingDependency.CurrentAccess")))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION "The shared LogicalDevice.") :KEY)
                :INITFORM "CIM_LogicalDevice")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The LogicalDevice owned by the sharing System.")
                 :KEY)
                :INITFORM "CIM_LogicalDevice"))
              (:CIM-NAME "CIM_SharingDependency")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.22.0")
               (:UML-PACKAGE-PATH "CIM::Device::SCSI")
               (:DESCRIPTION
                "In some configurations, a logical device may be shared among multiple systems while only belonging to one. When modeling this sharing relationship, one instance of LogicalDevice exists to model the resource. This instance is associated with the owning system via the SystemDevice association. An additional instance of LogicalDevice will exist for each system the device is shared with to represent the device in the context of each System it is shared with. Each of these instances is associated with a single instance of System via an instance of the SystemDevice association. This is very similar to the way that virtual devices are modeled. However, there are additional semantics associated with shared devices that need to be modeled, including the current access of a sharing system to the shared device. The SharingDependency association will be used to add support for modeling this additional semantic. It is used to associate a LogicalDevice instance in the sharing system to the LogicalDevice representing the underlying shared resource.")))