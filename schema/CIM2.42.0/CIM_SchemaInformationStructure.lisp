
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SchemaInformationStructure.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SCHEMAINFORMATIONSTRUCTURE NIL
              ((NAME STRING :CIM-NAME "Name" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "The schema name (as defined in DSP0004). For example, CIM or PRS. NOTE: The schema name shall not include the underscore character."))
                :INITFORM NIL)
               (VERSION STRING :CIM-NAME "Version" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "The schema version in M.N.U (Major.Minor.Update) format. For example 2.36.0 or 1.0.0."))
                :INITFORM NIL)
               (DESCRIPTION STRING :CIM-NAME "Description" :QUALIFIERS
                ((:DESCRIPTION "The description for this schema.")) :INITFORM
                NIL)
               (URI STRING :CIM-NAME "URI" :QUALIFIERS
                ((:DESCRIPTION
                  "A URI (see RFC3986) that uniquely identifies this schema version. Note that this is a URI for iddentifying the schema version, not a URL for accessing it. For example, http://schemas.dmtf.org/wbem/cim-schema/2.35.0/."))
                :INITFORM NIL)
               (OWNINGORGANIZATION STRING :CIM-NAME "OwningOrganization"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The owning organization of the schema. For example, DMTF, SNIA or ACME"))
                :INITFORM NIL)
               (STATUS UINT32 :CIM-NAME "Status" :QUALIFIERS
                ((:DESCRIPTION "The status of the schema.")
                 (:VALUE-MAP ("0" "2" "3" ".."))
                 (:VALUES ("Unknown" "Final" "Experimental" "DMTF Reserved")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_SchemaInformationStructure")
              (:QUALIFIERS :INDICATION (:VERSION "2.38.0")
               (:UML-PACKAGE-PATH "CIM::Interop::Schema")
               (:DESCRIPTION
                "The CIM_SchemaInformation structure describes information for a specific version of a schema.")
               :STRUCTURE))