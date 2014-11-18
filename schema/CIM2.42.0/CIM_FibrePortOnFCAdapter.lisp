
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_FibrePortOnFCAdapter.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_FIBREPORTONFCADAPTER (CIM_PORTONDEVICE)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION
                  "Note: The use of this method has been deprecated. 
Deprecated description: The FibreChannelAdapter that includes the Port.")
                 :KEY)
                :INITFORM "CIM_FibreChannelAdapter")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "Dependent") (:MAX "1")
                 (:DESCRIPTION
                  "Note: The use of this method has been deprecated. 
Deprecated description: The FibrePort on the Adapter.")
                 :KEY)
                :INITFORM "CIM_FibrePort"))
              (:CIM-NAME "CIM_FibrePortOnFCAdapter")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("No value"))
               (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::NetworkAdapter")
               (:DESCRIPTION "Note: The use of this method has been deprecated. 
Deprecated description: The use of FibrePortOnFCAdapter is deprecated because both FibrePort and FibreChannelAdapter have been deprecated. No replacement is needed because the 2 classes are combined into a single class. FibrePortOnFCAdapter associates a FibrePort with a FibreChannelAdapter.")))