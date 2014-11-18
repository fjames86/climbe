
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ActionSequence.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ACTIONSEQUENCE NIL
              ((NEXT NIL :CIM-NAME "Next" :QUALIFIERS
                (:KEY (:MAX "1")
                 (:DESCRIPTION "The next Action in the sequence."))
                :INITFORM "CIM_Action")
               (PRIOR NIL :CIM-NAME "Prior" :QUALIFIERS
                (:KEY (:MAX "1")
                 (:DESCRIPTION "The previous Action in the sequence."))
                :INITFORM "CIM_Action"))
              (:CIM-NAME "CIM_ActionSequence")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Application::CheckAction")
               (:DESCRIPTION
                "The CIM_ActionSequence association defines a series of operations that either transition a SoftwareElement, referenced by the CIM_SoftwareElementActions association, to the next state or removes the element from its current state. The Action classes participating in this association must have the same value for the Action.Direction property - since they are either part of a sequence to transition a SoftwareElement into its next state or to uninstall it. The next-state and uninstall Actions associated with a particular SoftwareElement must be a continuous sequence. 
ActionSequence is an association that loops on the Action classes with roles for the 'prior' and 'next' Actions in the sequence. The need for a continuous sequence imples: (1)Within the set of next-state or uninstall Actions, there is one and only one Action that does not have an instance of ActionSequence referencing it in the 'next' role. This is the first Action in the sequence. (2) Within the set of next-state or uninstall Actions, there is one and only one Action that does not have an instance of ActionSequence referencing it in the 'prior' role. This is the last Action in the sequence. (3) All other Actions within the set of next-state and uninstall Actions must participate in two instances of ActionSequence, one in a 'prior' role and the other in the 'next' role.")))