
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_LocalizationCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_LOCALIZATIONCAPABILITIES (CIM_CAPABILITIES)
              ((INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. In order to ensure uniqueness within the NameSpace, the value of InstanceID SHOULD be constructed using the following 'preferred' algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon ':', and where <OrgID> MUST include a copyrighted, trademarked or otherwise unique name that is owned by the business entity creating/defining the InstanceID, or is a registered ID that is assigned to the business entity by a recognized global authority (This is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness <OrgID> MUST NOT contain a colon (':'). When using this algorithm, the first colon to appear in InstanceID MUST appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and SHOULD not be re-used to identify different underlying (real-world) elements. If the above 'preferred' algorithm is not used, the defining entity MUST assure that the resultant InstanceID is not re-used across any InstanceIDs produced by this or other providers for this instance's NameSpace. 
For DMTF defined instances, the 'preferred' algorithm MUST be used with the <OrgID> set to 'CIM'."))
                :INITFORM NIL)
               (ELEMENTNAME STRING :CIM-NAME "ElementName" :QUALIFIERS
                (:REQUIRED (:OVERRIDE "ElementName")
                 (:DESCRIPTION
                  "The user friendly name for this instance of Capabilities. In addition, the user friendly name can be used as a index property for a search of query. (Note: Name does not have to be unique within a namespace.)"))
                :INITFORM NIL)
               (CAPTION STRING :CIM-NAME "Caption" :QUALIFIERS
                ((:DESCRIPTION
                  "The Caption property is a short textual description (one- line string) of the object.")
                 (:MAX-LEN "64"))
                :INITFORM NIL)
               (DESCRIPTION STRING :CIM-NAME "Description" :QUALIFIERS
                ((:DESCRIPTION
                  "The Description property provides a textual description of the object."))
                :INITFORM NIL)
               (SUPPORTEDINPUTLOCALES (ARRAY STRING) :CIM-NAME
                "SupportedInputLocales" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "This property, along with locale properties in (for example) a SettingData class, specifies the locale for data consumed by a ManagedElement. 
A locale indicates a particular geographical, political, or cultural region. The SupportedInputLocales property is an array of strings whose entries specify one or more languages that can be used in the formulation of information input by a client. It may be defined by the ManagedElement or client as an input parameter to a method, as a Setting or SettingData property, or via other mechanisms. 

The SupportedInputLocales property publishes an element's support of various locales for input data. The first array entry MUST define the default locale (the natural language associated with the ManagedElement). If the SupportedInputLocales property is empty, it is assumed that the default locale is en_US (English). 
Each array entry consists of three sub-strings, separated by underscores: 
- The first sub-string is the language code, as specified in ISO639. 
- The second sub-string is the country code, as specified in ISO3166. 
- The third sub-string is a variant, which is vendor specific. 
For example, US English appears as: \"en_US_WIN\", where the \"WIN\" variant would specify a Windows browser-specific collation (if one exists). Since the variant is not standardized, it is not commonly used and is generally limited to easily recognizable values (\"WIN\", \"UNIX\", \"EURO\", etc.) used in standard environments. 
The language and country codes are required; the variant may be empty."))
                :INITFORM NIL)
               (SUPPORTEDOUTPUTLOCALES (ARRAY STRING) :CIM-NAME
                "SupportedOutputLocales" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "This property, along with locale properties in (for example) a SettingData class, specifies the locale for data produced by a ManagedElement. 
A locale indicates a particular geographical, political, or cultural region. The SupportedOutputLocales property is an array of strings whose entries specify one or more languages that can be used in the formulation of information requested by and delivered to a client. It may be defined by the ManagedElement or client as an input parameter to a method, as a Setting or SettingData property, or via other mechanisms. Note that more than one locale may be specified in this array and later selected for output. If multiple locales are selected, information MUST be returned in each language specified, and indicated as supported by this Capabilities instance. 

The SupportedOutputLocales property publishes an element's support of various locales for output data. The first array entry MUST define the default locale (the natural language associated with the ManagedElement). If the SupportedOutput Locales property is empty, it is assumed that the default locale is en_US (English). 
Each array entry consists of three sub-strings, separated by underscores: 
- The first sub-string is the language code, as specified in ISO639. 
- The second sub-string is the country code, as specified in ISO3166. 
- The third sub-string is a variant, which is vendor specific. 
For example, US English appears as: \"en_US_WIN\", where the \"WIN\" variant would specify a Windows browser-specific collation (if one exists). Since the variant is not standardized, it is not commonly used and is generally limited to easily recognizable values (\"WIN\", \"UNIX\", \"EURO\", etc.) used in standard environments. 
The language and country codes are required; the variant may be empty."))
                :INITFORM NIL))
              (:CIM-NAME "CIM_LocalizationCapabilities")
              (:QUALIFIERS (:DEPRECATED ("No value")) (:VERSION "2.11.0")
               (:UML-PACKAGE-PATH "CIM::Core::Capabilities")
               (:DESCRIPTION
                "This class is being deprecated to avoid conflicts with localization implementations using CIM/XML over HTTP protocol, the preferred mechanism. 
Describes the input and output localization capabilities of the entity associated via ElementCapabilities.")))