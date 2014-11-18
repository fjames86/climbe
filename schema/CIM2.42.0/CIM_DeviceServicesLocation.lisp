
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DeviceServicesLocation.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DEVICESERVICESLOCATION (CIM_DEPENDENCY)
              ((INACCESSIBLE BOOLEAN :CIM-NAME "Inaccessible" :QUALIFIERS
                ((:DESCRIPTION
                  "Boolean indicating that the referenced StorageMediaLocation is not currently accessible to the MediaTransferDevice. For example, the Location could be the realization of an InterLibraryPort that is currently servicing another Library. The DeviceServicesLocation association describes that the TransferDevice COULD service the MediaLocation. This boolean indicates that that this is temporarily not possible."))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The MediaTransferDevice that handles Media from the StorageMediaLocation.")
                 :KEY)
                :INITFORM "CIM_MediaTransferDevice")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The MediaLocation that is serviced.") :KEY)
                :INITFORM "CIM_StorageMediaLocation"))
              (:CIM-NAME "CIM_DeviceServicesLocation")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Device::StorageLib")
               (:DESCRIPTION
                "Within an automated StorageLibrary, Media should be accessible to the various robotics and MediaTransferDevices (Pickers, Changers, InterLibraryPorts, etc.). The Library may be serviced by different TransferDevices, each responsible for a subset of the Library's StorageMediaLocations. The Device ServicesLocation association indicates that the Transfer Device handles Media stored in the referenced Location. For example, LibraryPort 'A' may only service Media from Slots 1-10, while LibraryPort 'B' covers Slots 11-33. This detail is conveyed by this association.")))