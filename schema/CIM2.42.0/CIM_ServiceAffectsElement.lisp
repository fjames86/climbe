
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ServiceAffectsElement.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SERVICEAFFECTSELEMENT NIL
              ((ELEMENTEFFECTS (ARRAY UINT16) :CIM-NAME "ElementEffects"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration that describes the effect on the ManagedElement. This array corresponds to the OtherElementEffectsDescriptions array, where the latter provides details that are related to the high-level effects enumerated by this property. Additional detail is required if the ElementEffects array contains the value 1 (Other). The values are defined as follows: 
- Exclusive Use (2): No other Service may have this association to the element. 
- Performance Impact (3): Deprecated in favor of \"Consumes\", \"Enhances Performance\", or \"Degrades Performance\". Execution of the Service may enhance or degrade the performance of the element. This may be as a side-effect of execution or as an intended consequence of methods provided by the Service. 
- Element Integrity (4): Deprecated in favor of \"Consumes\", \"Enhances Integrity\", or \"Degrades Integrity\". Execution of the Service may enhance or degrade the integrity of the element. This may be as a side-effect of execution or as an intended consequence of methods provided by the Service. 
- Manages (5): The Service manages the element. 
- Consumes (6): Execution of the Service consumes some or all of the associated element as a consequence of running the Service. For example, the Service may consume CPU cycles, which may affect performance, or Storage which may affect both performance and integrity. (For instance, the lack of free storage can degrade integrity by reducing the ability to save state. ) \"Consumes\" may be used alone or in conjunction with other values, in particular, \"Degrades Performance\" and \"Degrades Integrity\". 
\"Manages\" and not \"Consumes\" should be used to reflect allocation services that may be provided by a Service. 
- Enhances Integrity (7): The Service may enhance integrity of the associated element. 
- Degrades Integrity (8): The Service may degrade integrity of the associated element. 
- Enhances Performance (9): The Service may enhance performance of the associated element. 
- Degrades Performance (10): The Service may degrade performance of the associated element.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" ".."
                   "0x8000..0xFFFF"))
                 (:VALUES
                  ("Unknown" "Other" "Exclusive Use" "Performance Impact"
                   "Element Integrity" "Manages" "Consumes"
                   "Enhances Integrity" "Degrades Integrity"
                   "Enhances Performance" "Degrades Performance"
                   "DMTF Reserved" "Vendor Reserved"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ServiceAffectsElement.OtherElementEffectsDescriptions")))
                :INITFORM NIL)
               (OTHERELEMENTEFFECTSDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "OtherElementEffectsDescriptions" :QUALIFIERS
                ((:DESCRIPTION
                  "Provides details for the effect at the corresponding array position in ElementEffects. This information is required if ElementEffects contains the value 1 (Other).")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ServiceAffectsElement.ElementEffects")))
                :INITFORM NIL)
               (AFFECTEDELEMENT NIL :CIM-NAME "AffectedElement" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The Managed Element that is affected by the Service."))
                :INITFORM "CIM_ManagedElement")
               (AFFECTINGELEMENT NIL :CIM-NAME "AffectingElement" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The Service that is affecting the ManagedElement."))
                :INITFORM "CIM_Service"))
              (:CIM-NAME "CIM_ServiceAffectsElement")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.14.0")
               (:UML-PACKAGE-PATH "CIM::Core::Service")
               (:DESCRIPTION
                "ServiceAffectsElement represents an association between a Service and the ManagedElements that might be affected by its execution. Instantiating this association indicates that running the service may change, manage, provide functionality for,or pose some burden on the ManagedElement. This burden might affect performance, throughput, availability, and so on.")))