
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ServiceProcess.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SERVICEPROCESS NIL
              ((EXECUTIONTYPE UINT16 :CIM-NAME "ExecutionType" :QUALIFIERS
                ((:DESCRIPTION
                  "Enumeration indicating how the Service runs in the context of, or owns the Process. \"Unknown\" indicates that the ExecutionType is not known. \"Other\" indicates that the ExecutionType does not match any of the values in the ExecutionType enumeration. \"Executes in Existing Process\" indicates that the Service is hosted in a Process that already exists in the system. The lifecycle of the Service is separate from that of the Process. \"Exeutes as Independent Process\" indicates that the Service is responsible for the lifecycle of the Process. When the Service is started, the Process is created. For example, ServletEngines can run \"InProcess\" within the existing Apache processes or \"OutOfProcess\" in its own servlet engine process. In this case the Apache process would communicate with the servlet engine process based on the content of the request. The association may be many to many.")
                 (:VALUE-MAP ("0" "1" "2" "3"))
                 (:VALUES
                  ("Unknown" "Other" "Executes in Existing Process"
                   "Executes as Independent Process")))
                :INITFORM NIL)
               (SERVICE NIL :CIM-NAME "Service" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The Service whose Process is described by this association."))
                :INITFORM "CIM_Service")
               (PROCESS NIL :CIM-NAME "Process" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The Process which represents or hosts the executing Service."))
                :INITFORM "CIM_Process"))
              (:CIM-NAME "CIM_ServiceProcess")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.14.0")
               (:UML-PACKAGE-PATH "CIM::System::Processing")
               (:DESCRIPTION
                "CIM_ServiceProcess is an association used to establish relationships between Services and Processes. It is used to indicate if a Service is running in a particular Process. It is also used to indicate, via the ExecutionType property, if the Service started and is wholly responsible for the Process, or if the Service is running in an existing Process, perhaps with other unrelated Services, which is owned or started by a different entity.")))