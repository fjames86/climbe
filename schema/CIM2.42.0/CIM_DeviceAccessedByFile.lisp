
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DeviceAccessedByFile.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DEVICEACCESSEDBYFILE (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:DESCRIPTION "The DeviceFile.")
                 :KEY)
                :INITFORM "CIM_DeviceFile")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MAX "1")
                 (:DESCRIPTION
                  "The Device that is accessed using the DeviceFile.")
                 :KEY)
                :INITFORM "CIM_LogicalDevice"))
              (:CIM-NAME "CIM_DeviceAccessedByFile")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::System::FileElements")
               (:DESCRIPTION
                "Specifies the LogicalDevice that is associated with, and accessed using the referenced DeviceFile.")))