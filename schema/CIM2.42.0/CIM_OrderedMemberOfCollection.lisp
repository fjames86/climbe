
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_OrderedMemberOfCollection.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ORDEREDMEMBEROFCOLLECTION (CIM_MEMBEROFCOLLECTION)
              ((ASSIGNEDSEQUENCE UINT64 :CIM-NAME "AssignedSequence"
                :QUALIFIERS
                ((:DESCRIPTION
                  "AssignedSequence is an unsigned integer 'n' that indicates the relative position of members within a Collection. When 'n' is a positive integer, it indicates a place in the sequence of members, with smaller integers indicating earlier positions in the sequence. The special value '0' indicates 'don't care'. If two or more members have the same non-zero sequence number, then the ordering between those members is irrelevant, but they must all be ordered at the appropriate place in the overall sequence. 

A series of examples will make ordering of members clearer: 
If all members have the same sequence number, 
regardless of whether it is '0' or non-zero, any 
order is acceptable. 
o The values: 
1:MEMBER A 
2:MEMBER B 
1:MEMBER C 
3:MEMBER D 
indicate two acceptable orders: A,C,B,D or C,A,B,D, 
because A and C can be ordered in either sequence, but 
only at the '1' position. 

Note that the non-zero sequence numbers do not need to start with '1', and they do not need to be consecutive. However, the sequencenumbers must reflect their relative magnitude."))
                :INITFORM NIL)
               (COLLECTION NIL :CIM-NAME "Collection" :QUALIFIERS
                (:KEY :AGGREGATE
                 (:DESCRIPTION "The Collection that aggregates members."))
                :INITFORM "CIM_Collection")
               (MEMBER NIL :CIM-NAME "Member" :QUALIFIERS
                       (:KEY
                        (:DESCRIPTION
                         "The aggregated member of the Collection."))
                       :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_OrderedMemberOfCollection")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::Collection")
               (:DESCRIPTION
                "CIM_OrderedMemberOfCollection is an aggregation used to establish an ordered membership of ManagedElements in a Collection.")))