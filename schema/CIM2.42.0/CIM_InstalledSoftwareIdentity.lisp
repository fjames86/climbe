
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_InstalledSoftwareIdentity.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_INSTALLEDSOFTWAREIDENTITY NIL
              ((SYSTEM NIL :CIM-NAME "System" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The system on which the software is installed."))
                :INITFORM "CIM_System")
               (INSTALLEDSOFTWARE NIL :CIM-NAME "InstalledSoftware" :QUALIFIERS
                (:KEY (:DESCRIPTION "The SoftwareIdentity that is installed."))
                :INITFORM "CIM_SoftwareIdentity"))
              (:CIM-NAME "CIM_InstalledSoftwareIdentity")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Core::Software")
               (:DESCRIPTION
                "The InstalledSoftwareIdentity association identifies the System on which a SoftwareIdentity is installed. This class is a corollary to InstalledSoftwareElement, but deals with the asset aspects of software (as indicated by SoftwareIdentity), versus the deployment aspects (as indicated by SoftwareElement).")))