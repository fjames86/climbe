
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_Synchronized.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SYNCHRONIZED NIL
              ((WHENSYNCED DATETIME :CIM-NAME "WhenSynced" :QUALIFIERS
                ((:DESCRIPTION
                  "The point in time that the Elements were synchronized."))
                :INITFORM NIL)
               (SYNCMAINTAINED BOOLEAN :CIM-NAME "SyncMaintained" :QUALIFIERS
                ((:DESCRIPTION
                  "Boolean indicating whether synchronization is maintained."))
                :INITFORM NIL)
               (SYSTEMELEMENT NIL :CIM-NAME "SystemElement" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "SystemElement represents one ManagedElement that is synchronized with the entity referenced as SyncedElement."))
                :INITFORM "CIM_ManagedElement")
               (SYNCEDELEMENT NIL :CIM-NAME "SyncedElement" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "SyncedElement represents another ManagedElement that is synchronized with the entity referenced as SystemElement."))
                :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_Synchronized")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::CoreElements")
               (:DESCRIPTION
                "Indicates that two ManagedElements were aligned or made to be equivalent at the specified point in time. If the Boolean property SyncMaintained is true, then synchronization of the Elements is preserved. Both like and unlike objects can be synchronized. For example, two WatchDog timers can be aligned, or the contents of a LogicalFile can be synchronized with the contents of a StorageExtent.")))