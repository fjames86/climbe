
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PrintJobFile.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PRINTJOBFILE (CIM_COMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION
                  "The PrintJob that is based on one or more Files.")
                 :KEY)
                :INITFORM "CIM_PrintJob")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION "The Files that make up a PrintJob.") :KEY)
                :INITFORM "CIM_DataFile"))
              (:CIM-NAME "CIM_PrintJobFile")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::Printing")
               (:DESCRIPTION
                "This association indicates which files are associated with a PrintJob.")))