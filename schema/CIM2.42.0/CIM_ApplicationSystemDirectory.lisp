
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ApplicationSystemDirectory.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_APPLICATIONSYSTEMDIRECTORY NIL
              ((NAME STRING :CIM-NAME "Name" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "Name is a string representing a meaningful identifier for referring to the associated Directory in the context of the ApplicationSystem. As an example, this might be the name of the environment variable used to hold the same directory information.")
                 (:MAX-LEN "1024"))
                :INITFORM NIL)
               (APPLICATIONDIRECTORYUSES (ARRAY UINT16) :CIM-NAME
                "ApplicationDirectoryUses" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "ApplicationDirectoryUse is an enumerated array which indicates the purpose(s) of the associated directory within the context of the ApplicationSystem. A value of \"Root\" indicates that the associated directory is the one and only root directory for the ApplicationSystem. This would typically be the directory path in which the application is installed. For applications which are installed in multiple directories, this would represent the directory from which initial program and configuration files are loaded. A value of \"Program\" indicates that the directory contains supplemental program files used by the ApplicationSystem. A value of \"Data\" indicates that the directory is used for data storage. A value of \"Log\" indicates that the directory is used to contain log files for the ApplicationSystem. It is considered invalid for multiple associations from the same ApplicationSystem to have a value of \"Root\". The \"Unknown\" state is expected to be short-lived and would typically be seen only in the installation phase of an ApplicationSystem, if at all. A value of \"Temp\" indicates that the associated directory is used to contain temporary files created by the ApplicationSystem. The \"Other\" state should only be used in cases where none of the designated values are appropriate. This is intended to enable use of the model for unanticipated purposes and would usually signal a need to extend this enumeration through the standards process.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6"))
                 (:VALUES
                  ("Unknown" "Other" "Root" "Program" "Data" "Log" "Temp"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ApplicationSystemDirectory.OtherUseDescriptions")))
                :INITFORM NIL)
               (OTHERUSEDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "OtherUseDescriptions" :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing how the ApplicationSystem utilizes the associated directory when the corresponding entry in ApplicationDirectoryUses is set to 1, \"Other\". This attribute is meaningless and should be null when the corresponding entry in ApplicationDirectoryUses is set to any value other than 1.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ApplicationSystemDirectory.ApplicationDirectoryUses")))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "A Directory which is used by the associated ApplicationSystem."))
                :INITFORM "CIM_Directory")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "An ApplicationSystem which depends upon the associated Directory."))
                :INITFORM "CIM_ApplicationSystem"))
              (:CIM-NAME "CIM_ApplicationSystemDirectory")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Application::DeploymentModel")
               (:DESCRIPTION
                "CIM_ApplicationSystemDirectory is an association used to establish a relationship between an ApplicationSystem and the Directories that it uses. This is used to identify the single root installation directory for an ApplicationSystem, as well as the logical purpose of other directories utilized by the ApplicationSystem. Note: This class is intended to be a subclass of CIM_Dependency but the current specification prohibits the extension of parent keys in a subclass. This will be revisited when the specification changes to make the intended inheritance possible.")))