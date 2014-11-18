
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_NetworkVirtualAdapter.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_NETWORKVIRTUALADAPTER (CIM_LOGICALIDENTITY)
              ((SYSTEMELEMENT NIL :CIM-NAME "SystemElement" :QUALIFIERS
                ((:DEPRECATED ("CIM_ConcreteIdentity.SystemElement"))
                 (:OVERRIDE "SystemElement")
                 (:DESCRIPTION
                  "Note: The use of this method has been deprecated. 
Deprecated description: The 'virtual' NetworkAdapter.")
                 :KEY)
                :INITFORM "CIM_NetworkAdapter")
               (SAMEELEMENT NIL :CIM-NAME "SameElement" :QUALIFIERS
                ((:DEPRECATED ("CIM_ConcreteIdentity.SameElement"))
                 (:OVERRIDE "SameElement")
                 (:DESCRIPTION
                  "Note: The use of this method has been deprecated. 
Deprecated description: The ExtraCapacity RedundancyGroup that describes the load balancing. The result of the load balancing is the 'virtual' Adapter.")
                 :KEY)
                :INITFORM "CIM_ExtraCapacityGroup"))
              (:CIM-NAME "CIM_NetworkVirtualAdapter")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("CIM_ConcreteIdentity"))
               (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::NetworkAdapter")
               (:DESCRIPTION
                "Note: The use of the CIM_NetworkVirtualAdapter class has been deprecated. A specific association is not needed. Instead use the CIM_ConcreteIdentity class. 
Deprecated description: NetworkVirtual Adapter describes that an instance of NetworkAdapter is actually the result of several Adapters participating in a load-balanced RedundancyGroup.")))