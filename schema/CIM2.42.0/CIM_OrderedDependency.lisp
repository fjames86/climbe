
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_OrderedDependency.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ORDEREDDEPENDENCY (CIM_DEPENDENCY)
              ((ASSIGNEDSEQUENCE UINT64 :CIM-NAME "AssignedSequence"
                :QUALIFIERS
                ((:DESCRIPTION
                  "AssignedSequence is an unsigned integer 'n' that indicates the relative order of ManagedElement instances. When 'n' is a positive integer, it indicates a place in the sequence of members, with smaller integers indicating earlier positions in the sequence. The special value '0' indicates 'don't care'. If two or more members have the same non-zero sequence number, then the ordering between those members is irrelevant, but they must all be ordered at the appropriate place in the overall sequence. 

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
since A and C can be ordered in either sequence, but 
only at the '1' position. 

Note that the non-zero sequence numbers need not start with '1', and they need not be consecutive. All that matters is their relative magnitude."))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "Antecedent represents the independent object in this association."))
                :INITFORM "CIM_ManagedElement")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "Dependent represents the object that is dependent on the Antecedent."))
                :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_OrderedDependency")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.22.0")
               (:UML-PACKAGE-PATH "CIM::Core::CoreElements")
               (:DESCRIPTION
                "CIM_OrderedDependency is used to establish a relationship between a ManagedElement and its dependencies. Each dependency is an Antecedent reference and the order in which the dependencies need to be resolved is indicated by the AssignedSequence property. 
For example, if this association is used to arrange dependencies of a software in a hierarchical order, then this specifies the sequence in which the dependencies need to be installed prior to installing the software.")))