
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_HelpServiceAvailableToFile.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_HELPSERVICEAVAILABLETOFILE (CIM_SERVICEAVAILABLETOELEMENT)
              ((DOCUMENTFORMAT UINT16 :CIM-NAME "DocumentFormat" :QUALIFIERS
                ((:DESCRIPTION "Document format for the associated file.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6"))
                 (:VALUES
                  ("Unknown" "Other" "XML" "HTML" "Binary" "Executable"
                   ".hlp"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_HelpServiceAvailableToFile.OtherDocumentFormatDescription")))
                :INITFORM NIL)
               (OTHERDOCUMENTFORMATDESCRIPTION STRING :CIM-NAME
                "OtherDocumentFormatDescription" :QUALIFIERS
                ((:DESCRIPTION
                  "Describes the format of the file when DocumentFormat= \"Other\" is specified.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_HelpServiceAvailableToFile.DocumentFormat")))
                :INITFORM NIL)
               (SERVICEPROVIDED NIL :CIM-NAME "ServiceProvided" :QUALIFIERS
                ((:OVERRIDE "ServiceProvided")
                 (:DESCRIPTION "The Service that is available.") :KEY)
                :INITFORM "CIM_HelpService")
               (USEROFSERVICE NIL :CIM-NAME "UserOfService" :QUALIFIERS
                ((:OVERRIDE "UserOfService")
                 (:DESCRIPTION "The file that make use of this Service.") :KEY)
                :INITFORM "CIM_LogicalFile"))
              (:CIM-NAME "CIM_HelpServiceAvailableToFile")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.9.0")
               (:UML-PACKAGE-PATH "CIM::System::Help")
               (:DESCRIPTION
                "CIM_HelpServiceAvailableToFile indicates that the service is available for accessing the help file.")))