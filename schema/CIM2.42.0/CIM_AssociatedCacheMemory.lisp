
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AssociatedCacheMemory.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ASSOCIATEDCACHEMEMORY (CIM_ASSOCIATEDMEMORY)
              ((LEVEL UINT16 :CIM-NAME "Level" :QUALIFIERS
                ((:DESCRIPTION
                  "Defines whether this is the Primary (value=3), Secondary (value=4) or Tertiary (value=5) Cache. Also, \"Other\" (1), \"Unknown\" (0) and \"Not Applicable\" (2) can be defined.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5"))
                 (:VALUES
                  ("Unknown" "Other" "Not Applicable" "Primary" "Secondary"
                   "Tertiary"))
                 (:MAPPING-STRINGS ("MIF.DMTF|System Cache|006.2"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_AssociatedCacheMemory.OtherLevelDescription")))
                :INITFORM NIL)
               (OTHERLEVELDESCRIPTION STRING :CIM-NAME "OtherLevelDescription"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing the cache level when the Level value is 1, \"Other\".")
                 (:MODEL-CORRESPONDENCE ("CIM_AssociatedCacheMemory.Level")))
                :INITFORM NIL)
               (WRITEPOLICY UINT16 :CIM-NAME "WritePolicy" :QUALIFIERS
                ((:DESCRIPTION
                  "Defines whether this is write-back (value=2) or write-through (value=3) Cache, or whether this information \"Varies with Address\" (4) or is defined individually for each I/O (5). Also, \"Other\" (1) and \"Unknown\" (0) can be specified.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5"))
                 (:VALUES
                  ("Unknown" "Other" "Write Back" "Write Through"
                   "Varies with Address" "Determination Per I/O"))
                 (:MAPPING-STRINGS ("MIF.DMTF|System Cache|006.5"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_AssociatedCacheMemory.OtherWritePolicyDescription")))
                :INITFORM NIL)
               (OTHERWRITEPOLICYDESCRIPTION STRING :CIM-NAME
                "OtherWritePolicyDescription" :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing the Write Policy when the WritePolicy value is 1, \"Other\".")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_AssociatedCacheMemory.WritePolicy")))
                :INITFORM NIL)
               (CACHETYPE UINT16 :CIM-NAME "CacheType" :QUALIFIERS
                ((:DESCRIPTION
                  "Defines whether this is for instruction caching (value=2), data caching (value=3) or both (value=4, \"Unified\"). Also, \"Other\" (1) and \"Unknown\" (0) can be defined.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4"))
                 (:VALUES ("Unknown" "Other" "Instruction" "Data" "Unified"))
                 (:MAPPING-STRINGS ("MIF.DMTF|System Cache|006.9"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_AssociatedCacheMemory.OtherCacheTypeDescription")))
                :INITFORM NIL)
               (OTHERCACHETYPEDESCRIPTION STRING :CIM-NAME
                "OtherCacheTypeDescription" :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing the Cache Type when the CacheType value is 1, \"Other\".")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_AssociatedCacheMemory.CacheType")))
                :INITFORM NIL)
               (LINESIZE UINT32 :CIM-NAME "LineSize" :QUALIFIERS
                ((:DESCRIPTION
                  "Size, in bytes, of a single cache bucket or line.")
                 (NIL "Bytes")
                 (:MAPPING-STRINGS ("MIF.DMTF|System Cache|006.10"))
                 (:P-UNIT "byte"))
                :INITFORM NIL)
               (REPLACEMENTPOLICY UINT16 :CIM-NAME "ReplacementPolicy"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An integer enumeration describing the algorithm to determine which cache lines or buckets should be re-used.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6" "7" "8"))
                 (:VALUES
                  ("Unknown" "Other" "Unknown" "Least Recently Used (LRU)"
                   "First In First Out (FIFO)" "Last In First Out (LIFO)"
                   "Least Frequently Used (LFU)" "Most Frequently Used (MFU)"
                   "Data Dependent Multiple Algorithms"))
                 (:MAPPING-STRINGS ("MIF.DMTF|System Cache|006.12"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_AssociatedCacheMemory.OtherReplacementPolicyDescription")))
                :INITFORM NIL)
               (OTHERREPLACEMENTPOLICYDESCRIPTION STRING :CIM-NAME
                "OtherReplacementPolicyDescription" :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing the Cache replacement policy when the ReplacementPolicy value is 1, \"Other\".")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_AssociatedCacheMemory.ReplacementPolicy")))
                :INITFORM NIL)
               (READPOLICY UINT16 :CIM-NAME "ReadPolicy" :QUALIFIERS
                ((:DESCRIPTION
                  "Policy that shall be employed by the Cache for handling read requests. For example, \"Read\", \"Read-Ahead\" or both can be specified using the values, 2, 3 or 4, respectively. If the read policy is determined individually (ie, for each request), then the value 5 (\"Determination per I/O\") should be specified. \"Other\" (1) and \"Unknown\" (0) are also valid values.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5"))
                 (:VALUES
                  ("Unknown" "Other" "Read" "Read-Ahead" "Read and Read-Ahead"
                   "Determination Per I/O"))
                 (:MAPPING-STRINGS ("MIF.DMTF|System Cache|006.13"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_AssociatedCacheMemory.OtherReadPolicyDescription")))
                :INITFORM NIL)
               (OTHERREADPOLICYDESCRIPTION STRING :CIM-NAME
                "OtherReadPolicyDescription" :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing the read policy when the ReadPolicy value is 1, \"Other\".")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_AssociatedCacheMemory.ReadPolicy")))
                :INITFORM NIL)
               (FLUSHTIMER UINT32 :CIM-NAME "FlushTimer" :QUALIFIERS
                ((:DESCRIPTION
                  "Maximum amount of time, in seconds, dirty lines or buckets may remain in the Cache before they are flushed. A value of zero indicated that a cache flush is not controlled by a flushing timer.")
                 (NIL "Seconds")
                 (:MAPPING-STRINGS ("MIF.DMTF|System Cache|006.14"))
                 (:P-UNIT "second"))
                :INITFORM NIL)
               (ASSOCIATIVITY UINT16 :CIM-NAME "Associativity" :QUALIFIERS
                ((:DESCRIPTION
                  "An integer enumeration defining the system cache associativity. For example, 5 indicates a fully associative cache.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12"
                   "13"))
                 (:VALUES
                  ("Unknown" "Other" "Direct Mapped" "2-way Set-Associative"
                   "4-way Set-Associative" "Fully Associative"
                   "8-way Set-Associative" "16-way Set-Associative"
                   "12-way Set Associative" "24-way Set Associative"
                   "32-way Set Associative" "48-way Set Associative"
                   "64-way Set Associative" "20-way Set Associative"))
                 (:MAPPING-STRINGS ("MIF.DMTF|System Cache|006.15"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_AssociatedCacheMemory.OtherAssociativityDescription")))
                :INITFORM NIL)
               (OTHERASSOCIATIVITYDESCRIPTION STRING :CIM-NAME
                "OtherAssociativityDescription" :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing the cache associativity when the Associativity value is 1, \"Other\".")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_AssociatedCacheMemory.Associativity")))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "Memory installed on or associated with a Device.")
                 :KEY)
                :INITFORM "CIM_Memory")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:DESCRIPTION "The LogicalElement.")
                 :KEY)
                :INITFORM "CIM_LogicalElement"))
              (:CIM-NAME "CIM_AssociatedCacheMemory")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.28.0")
               (:UML-PACKAGE-PATH "CIM::Device::Memory")
               (:DESCRIPTION
                "Indicates that the Memory provides Cache to the Dependent Logical Element.")))