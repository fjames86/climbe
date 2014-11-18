
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PolicyActionStructure.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_POLICYACTIONSTRUCTURE (CIM_POLICYCOMPONENT)
              ((ACTIONORDER UINT16 :CIM-NAME "ActionOrder" :QUALIFIERS
                ((:DESCRIPTION
                  "ActionOrder is an unsigned integer 'n' that indicates the relative position of a PolicyAction in the sequence of actions associated with a PolicyRule or CompoundPolicyAction. When 'n' is a positive integer, it indicates a place in the sequence of actions to be performed, with smaller integers indicating earlier positions in the sequence. The special value '0' indicates 'don't care'. If two or more PolicyActions have the same non-zero sequence number, they may be performed in any order, but they must all be performed at the appropriate place in the overall action sequence. 

A series of examples will make ordering of PolicyActions clearer: 
o If all actions have the same sequence number, regardless of whether it is '0' or non-zero, any order is acceptable. 
o The values: 
1:ACTION A 
2:ACTION B 
1:ACTION C 
3:ACTION D 
indicate two acceptable orders: A,C,B,D or C,A,B,D, 
since A and C can be performed in either order, but only at the '1' position. 
o The values: 
0:ACTION A 
2:ACTION B 
3:ACTION C 
3:ACTION D 
require that B,C, and D occur either as B,C,D or as B,D,C. Action A may appear at any point relative to B, C, and D. Thus the complete set of acceptable orders is: A,B,C,D; B,A,C,D; B,C,A,D; B,C,D,A; A,B,D,C; B,A,D,C; B,D,A,C; B,D,C,A. 

Note that the non-zero sequence numbers need not start with '1', and they need not be consecutive. All that matters is their relative magnitude."))
                :INITFORM NIL)
               (GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION
                  "PolicyAction instances may be aggregated into either PolicyRule instances or CompoundPolicyAction instances.")
                 :KEY)
                :INITFORM "CIM_Policy")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "A PolicyAction aggregated by a PolicyRule or CompoundPolicyAction.")
                 :KEY)
                :INITFORM "CIM_PolicyAction"))
              (:CIM-NAME "CIM_PolicyActionStructure")
              (:QUALIFIERS :ASSOCIATION :ABSTRACT (NIL "true")
               (:VERSION "2.6.0") (:UML-PACKAGE-PATH "CIM::Policy")
               (:DESCRIPTION
                "PolicyActions may be aggregated into rules and into compound actions. PolicyActionStructure is the abstract aggregation class for the structuring of policy actions.")))