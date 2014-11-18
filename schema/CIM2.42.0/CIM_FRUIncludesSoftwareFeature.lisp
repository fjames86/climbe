
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_FRUIncludesSoftwareFeature.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_FRUINCLUDESSOFTWAREFEATURE NIL
              ((FRU NIL :CIM-NAME "FRU" :QUALIFIERS
                (:KEY :AGGREGATE (:MAX "1")
                 (:DESCRIPTION "The field replaceable unit."))
                :INITFORM "CIM_FRU")
               (COMPONENT NIL :CIM-NAME "Component" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The SoftwareFeature which is included in the FRU and whose SoftwareElements should be evaluated."))
                :INITFORM "CIM_SoftwareFeature"))
              (:CIM-NAME "CIM_FRUIncludesSoftwareFeature")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Application::DeploymentModel")
               (:DESCRIPTION
                "The FRUIncludesSoftwareFeature association identifies the SoftwareFeature(s) packaged with a particular FRU. A common usage is to determine whether the FRU is compatible with a hardware/software platform. In order to determine this, the following conditions need to be verified: 
(1) Is the physical package of the FRU compatible with the slots or equivalent packaging of the hardware? 
(2) Are there any physical constraints (such as power consumption) that prevent the FRU from being installed? 
(3) Are the SoftwareFeatures packaged with the FRU compatiable with the underlying operating system and other software already installed/to be installed on the platform? 
This latter question can be answered by first checking if an instance of FRUIncludesSoftwareFeature exists. If it does, then the compatibility of each SoftwareFeature can be determined by evaluating the Check classes for the Software Elements that are part of the Feature (found by traversing the association, SoftwareFeatureSoftwareElements). For example, there might be a SoftwareElementVersionCheck that declares that a SoftwareElement (of the FRU's Software Feature) is not compatible with current software.")))