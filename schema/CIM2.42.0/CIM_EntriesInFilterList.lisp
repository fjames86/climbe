
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_EntriesInFilterList.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ENTRIESINFILTERLIST (CIM_COMPONENT)
              ((ENTRYSEQUENCE UINT16 :CIM-NAME "EntrySequence" :QUALIFIERS
                ((:DESCRIPTION
                  "The order of the Entry relative to all others in the FilterList. The only permissible value is zero - indicating that all the Entries are ANDed together.")
                 (:VALUE-MAP ("0")))
                :INITFORM "0")
               (GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MAX "1")
                 (:DESCRIPTION
                  "The FilterList, which aggregates the set of FilterEntries.")
                 :KEY)
                :INITFORM "CIM_FilterList")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "Any subclass of FilterEntryBase which is a part of the FilterList.")
                 :KEY)
                :INITFORM "CIM_FilterEntryBase"))
              (:CIM-NAME "CIM_EntriesInFilterList")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::Filtering")
               (:DESCRIPTION
                "This is a specialization of the CIM_Component aggregation which is used to define a set of filter entries (subclasses of FilterEntryBase) that are aggregated by a particular FilterList.")))