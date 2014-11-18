
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_Printer.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PRINTER (CIM_LOGICALDEVICE)
              ((ELEMENTNAME STRING :CIM-NAME "ElementName" :QUALIFIERS
                (:REQUIRED (:OVERRIDE "ElementName")
                 (:DESCRIPTION
                  "The user-friendly name for this instance of Printer. In addition, the user-friendly name can be used as an index property for a search or query. (Note: The name does not have to be unique within a namespace.) This name shall be generated as a factory default by the manufacturer and may be changed out-of-band to a site-specific name by the system administrator.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Printer-MIB.prtGeneralPrinterName"))
                 (:MODEL-CORRESPONDENCE ("CIM_ManagedElement.ElementName")))
                :INITFORM NIL)
               (PRINTERSTATUS UINT16 :CIM-NAME "PrinterStatus" :QUALIFIERS
                ((:DESCRIPTION
                  "Status information for a Printer, beyond that specified in the LogicalDevice.Availability property. 
Values mapped directly from hrPrinterStatus in Host Resources MIB (RFC 2790) are: 
1 (Other) means the printer is in some non-standard state 
- see Printer.ErrorInformation for more information 
2 (Unknown) means the printer state is unknown 
3 (Idle) means the printer is ready but idle 
4 (Printing) means the printer is processing job(s) 
5 (Warmup) means the printer is warming up - not ready 
Note: The values 6 (Stopped Printing) and 7 (Offline) are redundant with DetectedErrorState (below) and not mapped from hrPrinterStatus in Host Resources MIB (RFC 2790).")
                 (:VALUE-MAP ("1" "2" "3" "4" "5" "6" "7" ".."))
                 (:VALUES
                  ("Other" "Unknown" "Idle" "Printing" "Warmup"
                   "Stopped Printing" "Offline" "DMTF Reserved"))
                 (:MAPPING-STRINGS
                  ("MIB.IETF|HOST-RESOURCES-MIB.hrPrinterStatus"
                   "MIB.IETF|HOST-RESOURCES-MIB.hrPrinterDetectedErrorState"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_LogicalDevice.Availability"
                   "CIM_Printer.DetectedErrorState"
                   "CIM_Printer.ErrorInformation")))
                :INITFORM NIL)
               (DETECTEDERRORSTATE UINT16 :CIM-NAME "DetectedErrorState"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Printer error info mapped from hrPrinterDetectedErrorState in Host Resources MIB (RFC 2790), as follows: 
0 (Unknown) means no error information is available 
1 (Other) means some non-standard error has occurred 
- see Printer.ErrorInformation for more information 
2 (No Error) means there are no error conditions 
3 (Low Paper) means PrintInputTray is low on paper 
4 (No Paper) means all PrintInputTray(s) are empty 
5 (Low Toner) means PrintMarker is low on toner 
6 (No Toner) means PrintMarker is out of toner 
7 (Door Open) means PrintInterlock is open 
8 (Jammed) means PrintMarker or PrintMediaPath is jammed 
9 (Offline) means Printer is offline (see PrinterStatus) 
10 (Service Requested) means intervention is required 
11 (Output Bin Full) means PrintOutputTray is full 
12 (Input Tray Missing) means PrintInputTray is missing 
13 (Output Tray Missing) means PrintOutputTray is missing 
14 (Marker Supply Missing) means PrintSupply is missing 
15 (Output Near Full) means PrintOutputTray is nearly full 
16 (Input Tray Empty) means PrintInputTray is empty 
17 (Overdue Prevent Maint) means Printer needs service.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" "17" ".."))
                 (:VALUES
                  ("Unknown" "Other" "No Error" "Low Paper" "No Paper"
                   "Low Toner" "No Toner" "Door Open" "Jammed" "Offline"
                   "Service Requested" "Output Bin Full" "Input Tray Missing"
                   "Output Tray Missing" "Marker Supply Missing"
                   "Output Near Full" "Input Tray Empty"
                   "Overdue Prevent Maint" "DMTF Reserved"))
                 (:MAPPING-STRINGS
                  ("MIB.IETF|HOST-RESOURCES-MIB.hrPrinterDetectedErrorState"))
                 (:MODEL-CORRESPONDENCE ("CIM_Printer.ErrorInformation")))
                :INITFORM NIL)
               (DEFAULTPAPERTYPE STRING :CIM-NAME "DefaultPaperType"
                :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "Note: The use of this property has been deprecated, due to ambiguity. Instead use the MediaType, MediaName, and MediaSizeName and IsDefault properties in PrintInputTray. 
Deprecated description: 
Specifies the paper type that the Printer will use if a PrintJob does not specify a particular type. The string should be a value of PaperTypesAvailable. The values of the property SHOULD conform to the requirements of the PWG Media Standardized Names specification [PWG5101.1], which defines the normative values for this property. See older Appendix B 'Media Size Names' and Appendix C 'Media Names' of IETF Printer MIB v2 [RFC3805] which list the values of standardized media names defined in ISO DPA [ISO10175].")
                 (:MAPPING-STRINGS
                  ("PWG5101-1.PWG|Media Standardized Names"
                   "MIB.IETF|Printer-MIB.prtInputDefaultIndex"
                   "MIB.IETF|Printer-MIB.prtInputMediaName"
                   "RFC2911.IETF|Printer.media-default"
                   "RFC2911.IETF|Section 4.2 Job Template Attributes"
                   "RFC2911.IETF|Section 4.2.11 media"
                   "RFC2911.IETF|APPENDIX C 'media' keyword values"))
                 (:MODEL-CORRESPONDENCE ("CIM_Printer.PaperTypesAvailable")))
                :INITFORM NIL)
               (CURRENTPAPERTYPE STRING :CIM-NAME "CurrentPaperType"
                :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "Note: The use of this property has been deprecated, due to ambiguity. Instead use the MediaType, MediaName, and MediaSizeName and IsDefault properties in PrintInputTray. 
Deprecated description: 
Specifies the paper type that the Printer is currently using. The string should be a value of PaperTypesAvailable. The values of the property SHOULD conform to the requirements of the PWG Media Standardized Names specification [PWG5101.1], which defines the normative values for this property. See older Appendix B 'Media Size Names' and Appendix C 'Media Names' of IETF Printer MIB v2 [RFC3805] which list the values of standardized media names defined in ISO DPA [ISO10175].")
                 (:MAPPING-STRINGS
                  ("PWG5101-1.PWG|Media Standardized Names"
                   "MIB.IETF|Printer-MIB.prtInputDefaultIndex"
                   "MIB.IETF|Printer-MIB.prtInputMediaName"
                   "RFC2911.IETF|Printer.media-default"
                   "RFC2911.IETF|Section 4.2 Job Template Attributes"
                   "RFC2911.IETF|Section 4.2.11 media"
                   "RFC2911.IETF|APPENDIX C 'media' keyword values"))
                 (:MODEL-CORRESPONDENCE ("CIM_Printer.PaperTypesAvailable")))
                :INITFORM NIL)
               (CURRENTLANGUAGE UINT16 :CIM-NAME "CurrentLanguage" :QUALIFIERS
                ((:DEPRECATED ("CIM_PrintInterpreter.LangType"))
                 (:DESCRIPTION
                  "Note: The use of this property has been deprecated, due to ambiguity. Instead use the Printer component classes PrintInterpreter and PrintChannel and the association class AssociatedPrintInterpreter value of DefaultType (JCL or PDL) to the PrintInterpreter.LangType property for default language(s) for each PrintChannel instance. 
Deprecated description: 
Indicates the current printer language being used. A language that is being used by the Printer should also be listed in LanguagesSupported. 
Note: For legacy compatiblity reasons, this property is NOT exactly aligned (in order of values) with the authoritative PrtInterpreterLangFamilyTC in the IANA Printer MIB, unlike the newer property PrintInterpreter.LangType (which is exactly aligned with the IANA Printer MIB).")
                 (:VALUE-MAP
                  ("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14"
                   "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25" "26"
                   "27" "28" "29" "30" "31" "32" "33" "34" "35" "36" "37" "38"
                   "39" "40" "41" "42" "43" "44" "45" "46" "47" "48" "50" "51"
                   "52" "53" "54" "55" "56" "57" "58" "59" "60" "61" "62" "63"
                   "64" "65" "66" "67" "68" "69" ".."))
                 (:VALUES
                  ("Other" "Unknown" "PCL" "HPGL" "PJL" "PS" "PSPrinter" "IPDS"
                   "PPDS" "EscapeP" "Epson" "DDIF" "Interpress" "ISO6429"
                   "Line Data" "MODCA" "REGIS" "SCS" "SPDL" "TEK4014" "PDS"
                   "IGP" "CodeV" "DSCDSE" "WPS" "LN03" "CCITT" "QUIC" "CPAP"
                   "DecPPL" "Simple Text" "NPAP" "DOC" "imPress" "Pinwriter"
                   "NPDL" "NEC201PL" "Automatic" "Pages" "LIPS" "TIFF"
                   "Diagnostic" "CaPSL" "EXCL" "LCDS" "XES" "MIME" "TIPSI"
                   "Prescribe" "LinePrinter" "IDP" "XJCL" "PDF" "RPDL"
                   "IntermecIPL" "UBIFingerprint" "UBIDirectProtocol" "Fujitsu"
                   "PCLXL" "ART" "CGM" "JPEG" "CALS1" "CALS2" "NIRS" "C4" "XPS"
                   "OpenXPS" "DMTF Reserved"))
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Printer-MIB.prtChannelDefaultPageDescLangIndex"
                   "MIB.IETF|Printer-MIB.prtInterpreterLangFamily"
                   "MIB.IETF|IANA-PRINTER-MIB.PrtInterpreterLangFamilyTC"
                   "RFC2911.IETF|Section 4.4.21 document-format-default"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Printer.LanguagesSupported"
                   "CIM_Printer.CurrentMimeType")))
                :INITFORM NIL)
               (CURRENTMIMETYPE STRING :CIM-NAME "CurrentMimeType" :QUALIFIERS
                ((:DEPRECATED ("CIM_PrintInterpreter.LangType"))
                 (:DESCRIPTION
                  "Note: The use of this property has been deprecated, due to ambiguity. Instead use the Printer component classes PrintInterpreter and PrintChannel and the association class AssociatedPrintInterpreter value of DefaultType (JCL or PDL) to the PrintInterpreter.LangType property for default language(s) for each PrintChannel instance. 
Deprecated description: 
Specifies the MIME type that is currently in use by the Printer if the CurrentLanguage is set to indicate that a MIME type is in use (value=47).")
                 (:MAPPING-STRINGS
                  ("RFC2911.IETF|Section 4.4.21 document-format-default"))
                 (:MODEL-CORRESPONDENCE ("CIM_Printer.CurrentLanguage")))
                :INITFORM NIL)
               (DEFAULTLANGUAGE UINT16 :CIM-NAME "DefaultLanguage" :QUALIFIERS
                ((:DEPRECATED ("CIM_PrintInterpreter.LangType"))
                 (:DESCRIPTION
                  "Note: The use of this property has been deprecated, due to ambiguity. Instead use the Printer component classes PrintInterpreter and PrintChannel and the association class AssociatedPrintInterpreter value of DefaultType (JCL or PDL) to the PrintInterpreter.LangType property for default language(s) for each PrintChannel instance. 
Deprecated description: 
Indicates the default printer language. A language that is used as a default by the Printer should also be listed in LanguagesSupported. 
Note: For legacy compatiblity reasons, this property is NOT exactly aligned (in order of values) with the authoritative PrtInterpreterLangFamilyTC in the IANA Printer MIB, unlike the newer property PrintInterpreter.LangType (which is exactly aligned with the IANA Printer MIB).")
                 (:VALUE-MAP
                  ("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14"
                   "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25" "26"
                   "27" "28" "29" "30" "31" "32" "33" "34" "35" "36" "37" "38"
                   "39" "40" "41" "42" "43" "44" "45" "46" "47" "48" "50" "51"
                   "52" "53" "54" "55" "56" "57" "58" "59" "60" "61" "62" "63"
                   "64" "65" "66" "67" "68" "69" ".."))
                 (:VALUES
                  ("Other" "Unknown" "PCL" "HPGL" "PJL" "PS" "PSPrinter" "IPDS"
                   "PPDS" "EscapeP" "Epson" "DDIF" "Interpress" "ISO6429"
                   "Line Data" "MODCA" "REGIS" "SCS" "SPDL" "TEK4014" "PDS"
                   "IGP" "CodeV" "DSCDSE" "WPS" "LN03" "CCITT" "QUIC" "CPAP"
                   "DecPPL" "Simple Text" "NPAP" "DOC" "imPress" "Pinwriter"
                   "NPDL" "NEC201PL" "Automatic" "Pages" "LIPS" "TIFF"
                   "Diagnostic" "CaPSL" "EXCL" "LCDS" "XES" "MIME" "TIPSI"
                   "Prescribe" "LinePrinter" "IDP" "XJCL" "PDF" "RPDL"
                   "IntermecIPL" "UBIFingerprint" "UBIDirectProtocol" "Fujitsu"
                   "PCLXL" "ART" "CGM" "JPEG" "CALS1" "CALS2" "NIRS" "C4" "XPS"
                   "OpenXPS" "DMTF Reserved"))
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Printer-MIB.prtChannelDefaultPageDescLangIndex"
                   "MIB.IETF|Printer-MIB.prtInterpreterLangFamily"
                   "MIB.IETF|IANA-PRINTER-MIB.PrtInterpreterLangFamilyTC"
                   "RFC2911.IETF|Section 4.4.21 document-format-default"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Printer.LanguagesSupported"
                   "CIM_Printer.DefaultMimeType")))
                :INITFORM NIL)
               (DEFAULTMIMETYPE STRING :CIM-NAME "DefaultMimeType" :QUALIFIERS
                ((:DEPRECATED ("CIM_PrintInterpreter.LangType"))
                 (:DESCRIPTION
                  "Note: The use of this property has been deprecated, due to ambiguity. Instead use the Printer component classes PrintInterpreter and PrintChannel and the association class AssociatedPrintInterpreter value of DefaultType (JCL or PDL) to the PrintInterpreter.LangType property for default language(s) for each PrintChannel instance. 
Deprecated description: 
Specifies the default MIME type that is used by the Printer if the DefaultLanguage is set to indicate that a MIME type is in use (value=47).")
                 (:MAPPING-STRINGS
                  ("RFC2911.IETF|Section 4.4.21 document-format-default"))
                 (:MODEL-CORRESPONDENCE ("CIM_Printer.DefaultLanguage")))
                :INITFORM NIL)
               (JOBCOUNTSINCELASTRESET UINT32 :CIM-NAME
                "JobCountSinceLastReset" :QUALIFIERS
                ((:DESCRIPTION
                  "Printer jobs that are processed since last reset. These jobs can be processed from one or more PrintQueues.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.PWG|PWG-IMAGING-COUNTER-MIB.icMonitorCompletedJobs")))
                :INITFORM NIL)
               (TIMEOFLASTRESET DATETIME :CIM-NAME "TimeOfLastReset"
                :QUALIFIERS
                ((:DESCRIPTION "Time of the last reset of the Printer Device.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|SNMPv2-MIB.sysUpTime"
                   "MIB.IETF|HOST-RESOURCES-MIB.hrSystemUptime"
                   "MIB.IETF|HOST-RESOURCES-MIB.hrSystemDate"
                   "RFC2911.IETF|Section 4.4.29 printer-up-time"
                   "RFC2911.IETF|Section 4.4.30 printer-current-time")))
                :INITFORM NIL)
               (MAXCOPIES UINT32 :CIM-NAME "MaxCopies" :QUALIFIERS
                ((:DESCRIPTION
                  "Note: The use of this property will be deprecated in favor of new PrintServiceCapabilities.Copies in the future. 
The maximum number of copies that can be produced by the Printer from a single Job.")
                 (:MAPPING-STRINGS
                  ("RFC2911.IETF|Printer.copies-supported"
                   "RFC2911.IETF|Section 4.2 Job Template Attributes"
                   "RFC2911.IETF|Section 4.2.5 copies"))
                 (:MODEL-CORRESPONDENCE ("CIM_PrintJob.Copies")))
                :INITFORM NIL)
               (DEFAULTCOPIES UINT32 :CIM-NAME "DefaultCopies" :QUALIFIERS
                ((:DESCRIPTION
                  "Note: The use of this property will be deprecated in favor of new PrintServiceSettings.Copies in the future. 
The number of copies that will be produced for a single Job unless otherwise specified.")
                 (:MAPPING-STRINGS
                  ("RFC2911.IETF|Printer.copies-default"
                   "RFC2911.IETF|Section 4.2 Job Template Attributes"
                   "RFC2911.IETF|Section 4.2.5 copies")))
                :INITFORM NIL)
               (MAXNUMBERUP UINT32 :CIM-NAME "MaxNumberUp" :QUALIFIERS
                ((:DESCRIPTION
                  "Note: The use of this property will be deprecated in favor of new PrintServiceCapabilities.NumberUp in the future. 
The maximum number of print-stream pages that the Printer can render onto a single media sheet.")
                 (:MAPPING-STRINGS
                  ("RFC2911.IETF|Printer.number-up-supported"
                   "RFC2911.IETF|Section 4.2 Job Template Attributes"
                   "RFC2911.IETF|Section 4.2.9 number-up"))
                 (:MODEL-CORRESPONDENCE ("CIM_PrintJob.NumberUp")))
                :INITFORM NIL)
               (DEFAULTNUMBERUP UINT32 :CIM-NAME "DefaultNumberUp" :QUALIFIERS
                ((:DESCRIPTION
                  "Note: The use of this property will be deprecated in favor of new PrintServiceSettings.NumberUp in the future. 
The number of print-stream pages that the Printer will render onto a single media sheet unless a Job specifies otherwise.")
                 (:MAPPING-STRINGS
                  ("RFC2911.IETF|Printer.number-up-default"
                   "RFC2911.IETF|Section 4.2 Job Template Attributes"
                   "RFC2911.IETF|Section 4.2.9 number-up")))
                :INITFORM NIL)
               (HORIZONTALRESOLUTION UINT32 :CIM-NAME "HorizontalResolution"
                :QUALIFIERS
                ((:DEPRECATED ("CIM_PrintMarker.XFeedAddressability"))
                 (:DESCRIPTION
                  "Note: The use of this property has been deprecated, due to ambiguity. Instead use the XFeedAddressability property in the Printer component classes PrintMarker and PrintInterpreter. 
Deprecated description: 
The resolution of the Printer in Pixels per Inch in the cross-feed direction, i.e., short-edge in portrait feed mode.")
                 (NIL "Pixels per Inch")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Printer-MIB.prtMarkerAddressabilityXFeedDir"
                   "RFC2911.IETF|Section 4.2.12 printer-resolution"))
                 (:MODEL-CORRESPONDENCE ("CIM_PrintJob.HorizontalResolution"))
                 (:P-UNIT "pixel / inch"))
                :INITFORM NIL)
               (VERTICALRESOLUTION UINT32 :CIM-NAME "VerticalResolution"
                :QUALIFIERS
                ((:DEPRECATED ("CIM_PrintMarker.FeedAddressability"))
                 (:DESCRIPTION
                  "Note: The use of this property has been deprecated, due to ambiguity. Instead use the FeedAddressability property in the Printer component classes PrintMarker and PrintInterpreter. 
Deprecated description: 
The resolution of the Printer in Pixels per Inch in the feed direction, i.e., long-edge in portrait feed mode.")
                 (NIL "Pixels per Inch")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Printer-MIB.prtMarkerAddressabilityFeedDir"
                   "RFC2911.IETF|Section 4.2.12 printer-resolution"))
                 (:MODEL-CORRESPONDENCE ("CIM_PrintJob.VerticalResolution"))
                 (:P-UNIT "pixel / inch"))
                :INITFORM NIL)
               (CURRENTCHARSET STRING :CIM-NAME "CurrentCharSet" :QUALIFIERS
                ((:DESCRIPTION
                  "Specifies the current character set that is being used for the output of text that relates to the management of the Printer. The character set that is described by this property should also be listed in CharsetsSupported. The string that is specified by this property should conform to the semantics and syntax that are specified by section 4.1.2 (\"Charset parameter\") in RFC 2046 (MIME Part 2) and contained in the IANA character-set registry. Examples include \"utf-8\", \"us-ascii\" and \"iso-8859-1\". 
Note: For compatiblity with the IETF Printer MIB (RFC 3805) and IETF IPP/1.1 (RFC 2911), values in this array property shall be parallel to values in CharSetsSupported.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Printer-MIB.prtGeneralCurrentLocalization"
                   "MIB.IETF|Printer-MIB.prtLocalizationCharacterSet"
                   "MIB.IETF|IANA-CHARSET-MIB.IANACharset"
                   "RFC2911.IETF|Section 4.4.19 charset-configured"))
                 (:MODEL-CORRESPONDENCE ("CIM_Printer.CharSetsSupported")))
                :INITFORM NIL)
               (CURRENTNATURALLANGUAGE STRING :CIM-NAME
                "CurrentNaturalLanguage" :QUALIFIERS
                ((:DESCRIPTION
                  "Identifies the current language that is being used by the Printer for management. The language listed in the CurrentNaturalLanguage property should also be listed in NaturalLanguagesSupported.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Printer-MIB.prtGeneralCurrentLocalization"
                   "MIB.IETF|Printer-MIB.prtLocalizationLanguage"
                   "MIB.IETF|Printer-MIB.prtLocalizationCountry"
                   "RFC2911.IETF|Section 4.4.19 natural-language-configured"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Printer.NaturalLanguagesSupported")))
                :INITFORM NIL)
               (MAXSIZESUPPORTED UINT32 :CIM-NAME "MaxSizeSupported"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Note: The use of this property will be deprecated in favor of new PrintServiceCapabilities.MaxJobSize in the future. 
Specifies the largest Job (as a byte stream) that the Printer will accept in units of Kbytes. A value of 0 indicates that no limit has been set.")
                 (NIL "KiloBytes")
                 (:MAPPING-STRINGS
                  ("RFC2911.IETF|Section 4.4.33 job-k-octets-supported"))
                 (:MODEL-CORRESPONDENCE ("CIM_PrintJob.JobSize"))
                 (:P-UNIT "byte * 10^3"))
                :INITFORM NIL)
               (MARKINGTECHNOLOGY UINT16 :CIM-NAME "MarkingTechnology"
                :QUALIFIERS
                ((:DEPRECATED ("CIM_PrintMarker.MarkTech"))
                 (:DESCRIPTION
                  "Note: The use of this property has been deprecated, due to ambiguity. Instead use PrintMarker.MarkTech. 
Deprecated description: 
Specifies the marking technology that is used by the Printer.")
                 (:VALUE-MAP
                  ("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14"
                   "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25" "26"
                   "27" ".."))
                 (:VALUES
                  ("Other" "Unknown" "Electrophotographic LED"
                   "Electrophotographic Laser" "Electrophotographic Other"
                   "Impact Moving Head Dot Matrix 9pin"
                   "Impact Moving Head Dot Matrix 24pin"
                   "Impact Moving Head Dot Matrix Other"
                   "Impact Moving Head Fully Formed" "Impact Band"
                   "Impact Other" "Inkjet Aqueous" "Inkjet Solid"
                   "Inkjet Other" "Pen" "Thermal Transfer" "Thermal Sensitive"
                   "Thermal Diffusion" "Thermal Other" "Electroerosion"
                   "Electrostatic" "Photographic Microfiche"
                   "Photographic Imagesetter" "Photographic Other"
                   "Ion Deposition" "eBeam" "Typesetter" "DMTF Reserved"))
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Printer-MIB.prtMarkerMarkTech"
                   "MIB.IETF|IANA-PRINTER-MIB.PrtMarkerMarkTechTC")))
                :INITFORM NIL)
               (CONSOLENATURALLANGUAGE STRING :CIM-NAME
                "ConsoleNaturalLanguage" :QUALIFIERS
                ((:DESCRIPTION
                  "Identifies the current language that is being used by the Printer for the local console. The language listed in the ConsoleNaturalLanguage property should also be listed in NaturalLanguagesSupported. ConsoleDisplayBufferText values shall be in this natural language.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Printer-MIB.prtConsoleLocalization"
                   "MIB.IETF|Printer-MIB.prtLocalizationLanguage"
                   "MIB.IETF|Printer-MIB.prtLocalizationCountry"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Printer.NaturalLanguagesSupported"
                   "CIM_Printer.ConsoleDisplayBufferText")))
                :INITFORM NIL)
               (SYSTEMCREATIONCLASSNAME STRING :CIM-NAME
                "SystemCreationClassName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping System's CreationClassName.")
                 (:MAX-LEN "256") (:PROPOGATED "CIM_System.CreationClassName"))
                :INITFORM NIL)
               (SYSTEMNAME STRING :CIM-NAME "SystemName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping System's Name.")
                 (:MAX-LEN "256") (:PROPOGATED "CIM_System.Name"))
                :INITFORM NIL)
               (CREATIONCLASSNAME STRING :CIM-NAME "CreationClassName"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "CreationClassName indicates the name of the class or the subclass used in the creation of an instance. When used with the other key properties of this class, this property allows all instances of this class and its subclasses to be uniquely identified.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (DEVICEID STRING :CIM-NAME "DeviceID" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "An address or other identifying information to uniquely name the LogicalDevice.")
                 (:MAX-LEN "64"))
                :INITFORM NIL)
               (POWERMANAGEMENTSUPPORTED BOOLEAN :CIM-NAME
                "PowerManagementSupported" :QUALIFIERS
                ((:DEPRECATED ("CIM_PowerManagementCapabilities"))
                 (:DESCRIPTION
                  "Boolean indicating that the Device can be power managed. The use of this property has been deprecated. Instead, the existence of an associated PowerManagementCapabilities class (associated using the ElementCapabilities relationhip) indicates that power management is supported."))
                :INITFORM NIL)
               (AVAILABILITY UINT16 :CIM-NAME "Availability" :QUALIFIERS
                ((:DESCRIPTION
                  "The primary availability and status of the Device. (Additional status information can be specified using the Additional Availability array property.) For example, the Availability property indicates that the Device is running and has full power (value=3), or is in a warning (4), test (5), degraded (10) or power save state (values 13-15 and 17). Regarding the Power Save states, these are defined as follows: Value 13 (\"Power Save - Unknown\") indicates that the Device is known to be in a power save mode, but its exact status in this mode is unknown; 14 (\"Power Save - Low Power Mode\") indicates that the Device is in a power save state but still functioning, and may exhibit degraded performance; 15 (\"Power Save - Standby\") describes that the Device is not functioning but could be brought to full power 'quickly'; and value 17 (\"Power Save - Warning\") indicates that the Device is in a warning state, though also in a power save mode.")
                 (:VALUE-MAP
                  ("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14"
                   "15" "16" "17" "18" "19" "20" "21"))
                 (:VALUES
                  ("Other" "Unknown" "Running/Full Power" "Warning" "In Test"
                   "Not Applicable" "Power Off" "Off Line" "Off Duty"
                   "Degraded" "Not Installed" "Install Error"
                   "Power Save - Unknown" "Power Save - Low Power Mode"
                   "Power Save - Standby" "Power Cycle" "Power Save - Warning"
                   "Paused" "Not Ready" "Not Configured" "Quiesced"))
                 (:MAPPING-STRINGS
                  ("MIF.DMTF|Operational State|006.5"
                   "MIB.IETF|HOST-RESOURCES-MIB.hrDeviceStatus"
                   "MIF.DMTF|Host Device|001.5"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_LogicalDevice.AdditionalAvailability")))
                :INITFORM NIL)
               (STATUSINFO UINT16 :CIM-NAME "StatusInfo" :QUALIFIERS
                ((:DEPRECATED ("CIM_EnabledLogicalElement.EnabledState"))
                 (:DESCRIPTION
                  "The StatusInfo property indicates whether the Logical Device is in an enabled (value = 3), disabled (value = 4) or some other (1) or unknown (2) state. If this property does not apply to the LogicalDevice, the value, 5 (\"Not Applicable\"), should be used. StatusInfo has been deprecated in lieu of a more clearly named property with additional enumerated values (EnabledState), that is inherited from ManagedSystemElement. 
If a Device is (\"Enabled\")(value=3), it has been powered up, and is configured and operational. The Device may or may not be functionally active, depending on whether its Availability (or AdditionalAvailability) indicate that it is (\"Running/Full Power\")(value=3) or (\"Off line\") (value=8). In an enabled but offline mode, a Device may be performing out-of-band requests, such as running Diagnostics. If (\"Disabled\") StatusInfo value=4), a Device can only be \"enabled\" or powered off. In a personal computer environment, (\"Disabled\") means that the Device's driver is not available in the stack. In other environments, a Device can be disabled by removing its configuration file. A disabled device is physically present in a System and consuming resources, but can not be communicated with until a load of a driver, a load of a configuration file or some other \"enabling\" activity has occurred.")
                 (:VALUE-MAP ("1" "2" "3" "4" "5"))
                 (:VALUES
                  ("Other" "Unknown" "Enabled" "Disabled" "Not Applicable"))
                 (:MAPPING-STRINGS ("MIF.DMTF|Operational State|006.4")))
                :INITFORM NIL)
               (LASTERRORCODE UINT32 :CIM-NAME "LastErrorCode" :QUALIFIERS
                ((:DEPRECATED ("CIM_DeviceErrorData.LastErrorCode"))
                 (:DESCRIPTION
                  "LastErrorCode captures the last error code reported by the LogicalDevice."))
                :INITFORM NIL)
               (ERRORDESCRIPTION STRING :CIM-NAME "ErrorDescription"
                :QUALIFIERS
                ((:DEPRECATED ("CIM_DeviceErrorData.ErrorDescription"))
                 (:DESCRIPTION
                  "ErrorDescription is a free-form string supplying more information about the error recorded in LastErrorCode, and information on any corrective actions that may be taken."))
                :INITFORM NIL)
               (ERRORCLEARED BOOLEAN :CIM-NAME "ErrorCleared" :QUALIFIERS
                ((:DEPRECATED ("CIM_ManagedSystemElement.OperationalStatus"))
                 (:DESCRIPTION
                  "ErrorCleared is a boolean property indicating that the error reported in LastErrorCode is now cleared."))
                :INITFORM NIL)
               (POWERONHOURS UINT64 :CIM-NAME "PowerOnHours" :QUALIFIERS
                ((:DESCRIPTION
                  "The number of consecutive hours that this Device has been powered, since its last power cycle.")
                 (NIL "Hours") :COUNTER)
                :INITFORM NIL)
               (TOTALPOWERONHOURS UINT64 :CIM-NAME "TotalPowerOnHours"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The total number of hours that this Device has been powered.")
                 (NIL "Hours") :COUNTER)
                :INITFORM NIL)
               (MAXQUIESCETIME UINT64 :CIM-NAME "MaxQuiesceTime" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "The MaxQuiesceTime property has been deprecated. When evaluating the use of Quiesce, it was determine that this single property is not adequate for describing when a device will automatically exit a quiescent state. In fact, the most likely scenario for a device to exit a quiescent state was determined to be based on the number of outstanding requests queued rather than on a maximum time. This will be re-evaluated and repositioned later. 
Maximum time in milliseconds, that a Device can run in a \"Quiesced\" state. A Device's state is defined in its Availability and AdditionalAvailability properties, where \"Quiesced\" is conveyed by the value 21. What occurs at the end of the time limit is device-specific. The Device may unquiesce, may offline or take other action. A value of 0 indicates that a Device can remain quiesced indefinitely.")
                 (NIL "MilliSeconds"))
                :INITFORM NIL)
               (ENABLEDSTATE UINT16 :CIM-NAME "EnabledState" :QUALIFIERS
                ((:DESCRIPTION
                  "EnabledState is an integer enumeration that indicates the enabled and disabled states of an element. It can also indicate the transitions between these requested states. For example, shutting down (value=4) and starting (value=10) are transient states between enabled and disabled. The following text briefly summarizes the various enabled and disabled states: 
Enabled (2) indicates that the element is or could be executing commands, will process any queued commands, and queues new requests. 
Disabled (3) indicates that the element will not execute commands and will drop any new requests. 
Shutting Down (4) indicates that the element is in the process of going to a Disabled state. 
Not Applicable (5) indicates the element does not support being enabled or disabled. 
Enabled but Offline (6) indicates that the element might be completing commands, and will drop any new requests. 
Test (7) indicates that the element is in a test state. 
Deferred (8) indicates that the element might be completing commands, but will queue any new requests. 
Quiesce (9) indicates that the element is enabled but in a restricted mode.
Starting (10) indicates that the element is in the process of going to an Enabled state. New requests are queued.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11..32767"
                   "32768..65535"))
                 (:VALUES
                  ("Unknown" "Other" "Enabled" "Disabled" "Shutting Down"
                   "Not Applicable" "Enabled but Offline" "In Test" "Deferred"
                   "Quiesce" "Starting" "DMTF Reserved" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.OtherEnabledState")))
                :INITFORM "5")
               (OTHERENABLEDSTATE STRING :CIM-NAME "OtherEnabledState"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A string that describes the enabled or disabled state of the element when the EnabledState property is set to 1 (\"Other\"). This property must be set to null when EnabledState is any value other than 1.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.EnabledState")))
                :INITFORM NIL)
               (REQUESTEDSTATE UINT16 :CIM-NAME "RequestedState" :QUALIFIERS
                ((:DESCRIPTION
                  "RequestedState is an integer enumeration that indicates the last requested or desired state for the element, irrespective of the mechanism through which it was requested. The actual state of the element is represented by EnabledState. This property is provided to compare the last requested and current enabled or disabled states. Note that when EnabledState is set to 5 (\"Not Applicable\"), then this property has no meaning. Refer to the EnabledState property description for explanations of the values in the RequestedState enumeration. 
\"Unknown\" (0) indicates the last requested state for the element is unknown.
Note that the value \"No Change\" (5) has been deprecated in lieu of indicating the last requested state is \"Unknown\" (0). If the last requested or desired state is unknown, RequestedState should have the value \"Unknown\" (0), but may have the value \"No Change\" (5).Offline (6) indicates that the element has been requested to transition to the Enabled but Offline EnabledState. 
It should be noted that there are two new values in RequestedState that build on the statuses of EnabledState. These are \"Reboot\" (10) and \"Reset\" (11). Reboot refers to doing a \"Shut Down\" and then moving to an \"Enabled\" state. Reset indicates that the element is first \"Disabled\" and then \"Enabled\". The distinction between requesting \"Shut Down\" and \"Disabled\" should also be noted. Shut Down requests an orderly transition to the Disabled state, and might involve removing power, to completely erase any existing state. The Disabled state requests an immediate disabling of the element, such that it will not execute or accept any commands or processing requests. 

This property is set as the result of a method invocation (such as Start or StopService on CIM_Service), or can be overridden and defined as WRITEable in a subclass. The method approach is considered superior to a WRITEable property, because it allows an explicit invocation of the operation and the return of a result code. 

If knowledge of the last RequestedState is not supported for the EnabledLogicalElement, the property shall be NULL or have the value 12 \"Not Applicable\".")
                 (:VALUE-MAP
                  ("0" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" ".."
                   "32768..65535"))
                 (:VALUES
                  ("Unknown" "Enabled" "Disabled" "Shut Down" "No Change"
                   "Offline" "Test" "Deferred" "Quiesce" "Reboot" "Reset"
                   "Not Applicable" "DMTF Reserved" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.EnabledState")))
                :INITFORM "12")
               (ENABLEDDEFAULT UINT16 :CIM-NAME "EnabledDefault" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "An enumerated value indicating an administrator's default or startup configuration for the Enabled State of an element. By default, the element is \"Enabled\" (value=2).")
                 (:VALUE-MAP ("2" "3" "5" "6" "7" "9" ".." "32768..65535"))
                 (:VALUES
                  ("Enabled" "Disabled" "Not Applicable" "Enabled but Offline"
                   "No Default" "Quiesce" "DMTF Reserved" "Vendor Reserved")))
                :INITFORM "2")
               (TIMEOFLASTSTATECHANGE DATETIME :CIM-NAME
                "TimeOfLastStateChange" :QUALIFIERS
                ((:DESCRIPTION
                  "The date or time when the EnabledState of the element last changed. If the state of the element has not changed and this property is populated, then it must be set to a 0 interval value. If a state change was requested, but rejected or not yet processed, the property must not be updated."))
                :INITFORM NIL)
               (TRANSITIONINGTOSTATE UINT16 :CIM-NAME "TransitioningToState"
                :QUALIFIERS
                ((:DESCRIPTION
                  "TransitioningToState indicates the target state to which the instance is transitioning. 
A value of 5 \"No Change\" shall indicate that no transition is in progress.A value of 12 \"Not Applicable\" shall indicate the implementation does not support representing ongoing transitions. 
A value other than 5 or 12 shall identify the state to which the element is in the process of transitioning.")
                 (:VALUE-MAP
                  ("0" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" ".."))
                 (:VALUES
                  ("Unknown" "Enabled" "Disabled" "Shut Down" "No Change"
                   "Offline" "Test" "Defer" "Quiesce" "Reboot" "Reset"
                   "Not Applicable" "DMTF Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.RequestStateChange"
                   "CIM_EnabledLogicalElement.RequestedState"
                   "CIM_EnabledLogicalElement.EnabledState")))
                :INITFORM "12")
               (INSTALLDATE DATETIME :CIM-NAME "InstallDate" :QUALIFIERS
                ((:DESCRIPTION
                  "A datetime value that indicates when the object was installed. Lack of a value does not indicate that the object is not installed.")
                 (:MAPPING-STRINGS ("MIF.DMTF|ComponentID|001.5")))
                :INITFORM NIL)
               (NAME STRING :CIM-NAME "Name" :QUALIFIERS
                ((:DESCRIPTION
                  "The Name property defines the label by which the object is known. When subclassed, the Name property can be overridden to be a Key property.")
                 (:MAX-LEN "1024"))
                :INITFORM NIL)
               (STATUS STRING :CIM-NAME "Status" :QUALIFIERS
                ((:DEPRECATED ("CIM_ManagedSystemElement.OperationalStatus"))
                 (:DESCRIPTION
                  "A string indicating the current status of the object. Various operational and non-operational statuses are defined. This property is deprecated in lieu of OperationalStatus, which includes the same semantics in its enumeration. This change is made for 3 reasons: 
1) Status is more correctly defined as an array. This definition overcomes the limitation of describing status using a single value, when it is really a multi-valued property (for example, an element might be OK AND Stopped. 
2) A MaxLen of 10 is too restrictive and leads to unclear enumerated values. 
3) The change to a uint16 data type was discussed when CIM V2.0 was defined. However, existing V1.0 implementations used the string property and did not want to modify their code. Therefore, Status was grandfathered into the Schema. Use of the deprecated qualifier allows the maintenance of the existing property, but also permits an improved definition using OperationalStatus.")
                 (:VALUE-MAP
                  ("OK" "Error" "Degraded" "Unknown" "Pred Fail" "Starting"
                   "Stopping" "Service" "Stressed" "NonRecover" "No Contact"
                   "Lost Comm" "Stopped"))
                 (:MAX-LEN "10"))
                :INITFORM NIL)
               (HEALTHSTATE UINT16 :CIM-NAME "HealthState" :QUALIFIERS
                ((:DESCRIPTION
                  "Indicates the current health of the element. This attribute expresses the health of this element but not necessarily that of its subcomponents. The possible values are 0 to 30, where 5 means the element is entirely healthy and 30 means the element is completely non-functional. The following continuum is defined: 
\"Non-recoverable Error\" (30) - The element has completely failed, and recovery is not possible. All functionality provided by this element has been lost. 
\"Critical Failure\" (25) - The element is non-functional and recovery might not be possible. 
\"Major Failure\" (20) - The element is failing. It is possible that some or all of the functionality of this component is degraded or not working. 
\"Minor Failure\" (15) - All functionality is available but some might be degraded. 
\"Degraded/Warning\" (10) - The element is in working order and all functionality is provided. However, the element is not working to the best of its abilities. For example, the element might not be operating at optimal performance or it might be reporting recoverable errors. 
\"OK\" (5) - The element is fully functional and is operating within normal operational parameters and without error. 
\"Unknown\" (0) - The implementation cannot report on HealthState at this time. 
DMTF has reserved the unused portion of the continuum for additional HealthStates in the future.")
                 (:VALUE-MAP
                  ("0" "5" "10" "15" "20" "25" "30" ".." "32768..65535"))
                 (:VALUES
                  ("Unknown" "OK" "Degraded/Warning" "Minor failure"
                   "Major failure" "Critical failure" "Non-recoverable error"
                   "DMTF Reserved" "Vendor Specific")))
                :INITFORM NIL)
               (COMMUNICATIONSTATUS UINT16 :CIM-NAME "CommunicationStatus"
                :QUALIFIERS
                ((:DESCRIPTION
                  "CommunicationStatus indicates the ability of the instrumentation to communicate with the underlying ManagedElement. CommunicationStatus consists of one of the following values: Unknown, None, Communication OK, Lost Communication, or No Contact. 
A Null return indicates the implementation (provider) does not implement this property. 
\"Unknown\" indicates the implementation is in general capable of returning this property, but is unable to do so at this time. 
\"Not Available\" indicates that the implementation (provider) is capable of returning a value for this property, but not ever for this particular piece of hardware/software or the property is intentionally not used because it adds no meaningful information (as in the case of a property that is intended to add additional info to another property). 
\"Communication OK \" indicates communication is established with the element, but does not convey any quality of service. 
\"No Contact\" indicates that the monitoring system has knowledge of this element, but has never been able to establish communications with it. 
\"Lost Communication\" indicates that the Managed Element is known to exist and has been contacted successfully in the past, but is currently unreachable.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" ".." "0x8000.."))
                 (:VALUES
                  ("Unknown" "Not Available" "Communication OK"
                   "Lost Communication" "No Contact" "DMTF Reserved"
                   "Vendor Reserved")))
                :INITFORM NIL)
               (DETAILEDSTATUS UINT16 :CIM-NAME "DetailedStatus" :QUALIFIERS
                ((:DESCRIPTION
                  "DetailedStatus compliments PrimaryStatus with additional status detail. It consists of one of the following values: Not Available, No Additional Information, Stressed, Predictive Failure, Error, Non-Recoverable Error, SupportingEntityInError. Detailed status is used to expand upon the PrimaryStatus of the element. 
A Null return indicates the implementation (provider) does not implement this property. 
\"Not Available\" indicates that the implementation (provider) is capable of returning a value for this property, but not ever for this particular piece of hardware/software or the property is intentionally not used because it adds no meaningful information (as in the case of a property that is intended to add additional info to another property). 
\"No Additional Information\" indicates that the element is functioning normally as indicated by PrimaryStatus = \"OK\". 
\"Stressed\" indicates that the element is functioning, but needs attention. Examples of \"Stressed\" states are overload, overheated, and so on. 
\"Predictive Failure\" indicates that an element is functioning normally but a failure is predicted in the near future. 
\"Non-Recoverable Error \" indicates that this element is in an error condition that requires human intervention. 
\"Supporting Entity in Error\" indicates that this element might be \"OK\" but that another element, on which it is dependent, is in error. An example is a network service or endpoint that cannot function due to lower-layer networking problems.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" ".." "0x8000.."))
                 (:VALUES
                  ("Not Available" "No Additional Information" "Stressed"
                   "Predictive Failure" "Non-Recoverable Error"
                   "Supporting Entity in Error" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.PrimaryStatus"
                   "CIM_ManagedSystemElement.HealthState")))
                :INITFORM NIL)
               (OPERATINGSTATUS UINT16 :CIM-NAME "OperatingStatus" :QUALIFIERS
                ((:DESCRIPTION
                  "OperatingStatus provides a current status value for the operational condition of the element and can be used for providing more detail with respect to the value of EnabledState. It can also provide the transitional states when an element is transitioning from one state to another, such as when an element is transitioning between EnabledState and RequestedState, as well as other transitional conditions.
OperatingStatus consists of one of the following values: Unknown, Not Available, In Service, Starting, Stopping, Stopped, Aborted, Dormant, Completed, Migrating, Emmigrating, Immigrating, Snapshotting. Shutting Down, In Test 
A Null return indicates the implementation (provider) does not implement this property. 
\"Unknown\" indicates the implementation is in general capable of returning this property, but is unable to do so at this time. 
\"None\" indicates that the implementation (provider) is capable of returning a value for this property, but not ever for this particular piece of hardware/software or the property is intentionally not used because it adds no meaningful information (as in the case of a property that is intended to add additional info to another property). 
\"Servicing\" describes an element being configured, maintained, cleaned, or otherwise administered. 
\"Starting\" describes an element being initialized. 
\"Stopping\" describes an element being brought to an orderly stop. 
\"Stopped\" and \"Aborted\" are similar, although the former implies a clean and orderly stop, while the latter implies an abrupt stop where the state and configuration of the element might need to be updated. 
\"Dormant\" indicates that the element is inactive or quiesced. 
\"Completed\" indicates that the element has completed its operation. This value should be combined with either OK, Error, or Degraded in the PrimaryStatus so that a client can tell if the complete operation Completed with OK (passed), Completed with Error (failed), or Completed with Degraded (the operation finished, but it did not complete OK or did not report an error). 
\"Migrating\" element is being moved between host elements. 
\"Immigrating\" element is being moved to new host element. 
\"Emigrating\" element is being moved away from host element. 
\"Shutting Down\" describes an element being brought to an abrupt stop. 
\"In Test\" element is performing test functions. 
\"Transitioning\" describes an element that is between states, that is, it is not fully available in either its previous state or its next state. This value should be used if other values indicating a transition to a specific state are not applicable.
\"In Service\" describes an element that is in service and operational.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" ".." "0x8000.."))
                 (:VALUES
                  ("Unknown" "Not Available" "Servicing" "Starting" "Stopping"
                   "Stopped" "Aborted" "Dormant" "Completed" "Migrating"
                   "Emigrating" "Immigrating" "Snapshotting" "Shutting Down"
                   "In Test" "Transitioning" "In Service" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.EnabledState")))
                :INITFORM NIL)
               (PRIMARYSTATUS UINT16 :CIM-NAME "PrimaryStatus" :QUALIFIERS
                ((:DESCRIPTION
                  "PrimaryStatus provides a high level status value, intended to align with Red-Yellow-Green type representation of status. It should be used in conjunction with DetailedStatus to provide high level and detailed health status of the ManagedElement and its subcomponents. 
PrimaryStatus consists of one of the following values: Unknown, OK, Degraded or Error. \"Unknown\" indicates the implementation is in general capable of returning this property, but is unable to do so at this time. 
\"OK\" indicates the ManagedElement is functioning normally. 
\"Degraded\" indicates the ManagedElement is functioning below normal. 
\"Error\" indicates the ManagedElement is in an Error condition.")
                 (:VALUE-MAP ("0" "1" "2" "3" ".." "0x8000.."))
                 (:VALUES
                  ("Unknown" "OK" "Degraded" "Error" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ManagedSystemElement.DetailedStatus"
                   "CIM_ManagedSystemElement.HealthState")))
                :INITFORM NIL)
               (INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                ((:DESCRIPTION
                  "InstanceID is an optional property that may be used to opaquely and uniquely identify an instance of this class within the scope of the instantiating Namespace. Various subclasses of this class may override this property to make it required, or a key. Such subclasses may also modify the preferred algorithms for ensuring uniqueness that are defined below.
To ensure uniqueness within the NameSpace, the value of InstanceID should be constructed using the following \"preferred\" algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon (:), and where <OrgID> must include a copyrighted, trademarked, or otherwise unique name that is owned by the business entity that is creating or defining the InstanceID or that is a registered ID assigned to the business entity by a recognized global authority. (This requirement is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness, <OrgID> must not contain a colon (:). When using this algorithm, the first colon to appear in InstanceID must appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and should not be reused to identify different underlying (real-world) elements. If not null and the above \"preferred\" algorithm is not used, the defining entity must assure that the resulting InstanceID is not reused across any InstanceIDs produced by this or other providers for the NameSpace of this instance. 
If not set to null for DMTF-defined instances, the \"preferred\" algorithm must be used with the <OrgID> set to CIM."))
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
               (ERRORINFORMATION (ARRAY STRING) :CIM-NAME "ErrorInformation"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An array that provides supplemental information for the current error state, that is indicated in DetectedErrorState.")
                 (:MAPPING-STRINGS
                  ("RFC2911.IETF|Section 4.4.13 printer-state-message"))
                 (:MODEL-CORRESPONDENCE ("CIM_Printer.DetectedErrorState")))
                :INITFORM NIL)
               (PAPERSIZESSUPPORTED (ARRAY UINT16) :CIM-NAME
                "PaperSizesSupported" :QUALIFIERS
                ((:DEPRECATED ("CIM_PrintInputTray.MediaSizeName"))
                 (:DESCRIPTION
                  "Note: The use of this property has been deprecated, due to ambiguity. Instead use PrintInputTray.MediaSizeName. 
Deprecated description: 
An integer array that indicates the sizes of paper supported.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25"
                   "26" "27" "28" "29" "30" "31" "32" "33" "34" "35" "36" "37"
                   "38" "39" "40" "41" "42" "43" "44" "45" "46" "47" "48" "49"
                   "50" "51" "52" "53" "54" "55" "56" "57" "58" "59" "60" "61"
                   "62" "63" "64" "65" "66" "67" "68" "69" "70" "71" "72" "73"
                   "74" "75" ".."))
                 (:VALUES
                  ("Unknown" "Other" "A" "B" "C" "D" "E" "Letter" "Legal"
                   "NA-10x13-Envelope" "NA-9x12-Envelope"
                   "NA-Number-10-Envelope" "NA-7x9-Envelope" "NA-9x11-Envelope"
                   "NA-10x14-Envelope" "NA-Number-9-Envelope" "NA-6x9-Envelope"
                   "NA-10x15-Envelope" "A0" "A1" "A2" "A3" "A4" "A5" "A6" "A7"
                   "A8" "A9" "A10" "B0" "B1" "B2" "B3" "B4" "B5" "B6" "B7" "B8"
                   "B9" "B10" "C0" "C1" "C2" "C3" "C4" "C5" "C6" "C7" "C8"
                   "ISO-Designated" "JIS B0" "JIS B1" "JIS B2" "JIS B3"
                   "JIS B4" "JIS B5" "JIS B6" "JIS B7" "JIS B8" "JIS B9"
                   "JIS B10" "NA-Letter" "NA-Legal" "B4-Envelope" "B5-Envelope"
                   "C3-Envelope" "C4-Envelope" "C5-Envelope" "C6-Envelope"
                   "Designated-Long-Envelope" "Monarch-Envelope" "Executive"
                   "Folio" "Invoice" "Ledger" "Quarto" "DMTF Reserved"))
                 (:MAPPING-STRINGS
                  ("PWG5101-1.PWG|Media Standardized Names"
                   "MIB.IETF|Printer-MIB.prtInputMediaName"
                   "MIB.IETF|Printer-MIB.prtInputMediaDimFeedDirChosen"
                   "MIB.IETF|Printer-MIB.prtInputMediaDimXFeedDirChosen"
                   "RFC2911.IETF|Printer.media-supported"
                   "RFC2911.IETF|Section 4.2 Job Template Attributes"
                   "RFC2911.IETF|Section 4.2.11 media"
                   "RFC2911.IETF|APPENDIX C 'media' keyword values")))
                :INITFORM NIL)
               (PAPERTYPESAVAILABLE (ARRAY STRING) :CIM-NAME
                "PaperTypesAvailable" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "Note: The use of this property has been deprecated, due to ambiguity. Instead use the MediaType, MediaName, and MediaSizeName and IsDefault properties in PrintInputTray. 
Deprecated description: 
An array of free-form strings specifying the types and sizes of paper that are currently available on the Printer. The values of the property SHOULD conform to the requirements of the PWG Media Standardized Names specification [PWG5101.1], which defines the normative values for this property. See older Appendix B 'Media Size Names' and Appendix C 'Media Names' of IETF Printer MIB v2 [RFC3805] which list the values of standardized media names defined in ISO DPA [ISO10175].")
                 (:ARRAYTYPE "Indexed")
                 (:MAPPING-STRINGS
                  ("PWG5101-1.PWG|Media Standardized Names"
                   "MIB.IETF|Printer-MIB.prtInputMediaName"
                   "RFC2911.IETF|Printer.media-ready"
                   "RFC2911.IETF|Section 4.2 Job Template Attributes"
                   "RFC2911.IETF|Section 4.2.11 media"
                   "RFC2911.IETF|APPENDIX C 'media' keyword values"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PrintJob.RequiredPaperType"
                   "CIM_PrintService.PaperTypesAvailable")))
                :INITFORM NIL)
               (LANGUAGESSUPPORTED (ARRAY UINT16) :CIM-NAME
                "LanguagesSupported" :QUALIFIERS
                ((:DEPRECATED ("CIM_PrintInterpreter.LangType"))
                 (:DESCRIPTION
                  "Note: The use of this property has been deprecated, due to ambiguity. Instead use PrintInterpreter.LangType. 
Deprecated description: 
An array that indicates the print languages that are natively supported 
Note: For legacy compatiblity reasons, this property is NOT exactly aligned (in order of values) with the authoritative PrtInterpreterLangFamilyTC in the IANA Printer MIB, unlike the newer property PrintInterpreter.LangType (which is exactly aligned with the IANA Printer MIB).")
                 (:VALUE-MAP
                  ("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14"
                   "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25" "26"
                   "27" "28" "29" "30" "31" "32" "33" "34" "35" "36" "37" "38"
                   "39" "40" "41" "42" "43" "44" "45" "46" "47" "48" "50" "51"
                   "52" "53" "54" "55" "56" "57" "58" "59" "60" "61" "62" "63"
                   "64" "65" "66" "67" "68" "69" ".."))
                 (:VALUES
                  ("Other" "Unknown" "PCL" "HPGL" "PJL" "PS" "PSPrinter" "IPDS"
                   "PPDS" "EscapeP" "Epson" "DDIF" "Interpress" "ISO6429"
                   "Line Data" "MODCA" "REGIS" "SCS" "SPDL" "TEK4014" "PDS"
                   "IGP" "CodeV" "DSCDSE" "WPS" "LN03" "CCITT" "QUIC" "CPAP"
                   "DecPPL" "Simple Text" "NPAP" "DOC" "imPress" "Pinwriter"
                   "NPDL" "NEC201PL" "Automatic" "Pages" "LIPS" "TIFF"
                   "Diagnostic" "CaPSL" "EXCL" "LCDS" "XES" "MIME" "TIPSI"
                   "Prescribe" "LinePrinter" "IDP" "XJCL" "PDF" "RPDL"
                   "IntermecIPL" "UBIFingerprint" "UBIDirectProtocol" "Fujitsu"
                   "PCLXL" "ART" "CGM" "JPEG" "CALS1" "CALS2" "NIRS" "C4" "XPS"
                   "OpenXPS" "DMTF Reserved"))
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Printer-MIB.prtInterpreterLangFamily"
                   "MIB.IETF|IANA-PRINTER-MIB.PrtInterpreterLangFamilyTC"
                   "RFC2911.IETF|Section 4.4.22 document-format-supported"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Printer.MimeTypesSupported" "CIM_PrintJob.Language"
                   "CIM_PrintService.LanguagesSupported"
                   "CIM_PrintInterpreter.LangType")))
                :INITFORM NIL)
               (MIMETYPESSUPPORTED (ARRAY STRING) :CIM-NAME
                "MimeTypesSupported" :QUALIFIERS
                ((:DEPRECATED ("CIM_PrintInterpreter.LangType"))
                 (:DESCRIPTION
                  "Note: The use of this property has been deprecated, due to ambiguity. Instead use PrintInterpreter.LangType. 
Deprecated description: 
An array of free-form strings that provides more detailed explanations of any MIME types that are supported by the Printer. If data is provided for this property, then the (value=47), \"Mime\", should be included in the Languages Supported property.")
                 (:MAPPING-STRINGS
                  ("RFC2911.IETF|Section 4.4.22 document-format-supported"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Printer.LanguagesSupported" "CIM_PrintJob.MimeTypes"
                   "CIM_PrintService.MimeTypesSupported"
                   "CIM_PrintInterpreter.LangType")))
                :INITFORM NIL)
               (CAPABILITIES (ARRAY UINT16) :CIM-NAME "Capabilities"
                :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "Note: The use of this property has been deprecated, due to ambiguity. Instead use the Printer component classes, e.g., PrintInputTray, PrintMarker, PrintFinisher, etc. For example, 3 (Duplex Printing) support can be found in the PrintMediaPath.Type property. 
Deprecated description: 
An array of integers that indicates Printer capabilities. Information such as \"Duplex Printing\" (value=3) or \"Transparency Printing\" (value=7) is specified in this property.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" "17" "18" "19" "20" "21" ".."))
                 (:VALUES
                  ("Unknown" "Other" "Color Printing" "Duplex Printing"
                   "Copies" "Collation" "Stapling" "Transparency Printing"
                   "Punch" "Cover" "Bind" "Black and White Printing"
                   "One Sided" "Two Sided Long Edge" "Two Sided Short Edge"
                   "Portrait" "Landscape" "Reverse Portrait"
                   "Reverse Landscape" "Quality High" "Quality Normal"
                   "Quality Low" "DMTF Reserved"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Printer.CapabilityDescriptions"
                   "CIM_PrintJob.Finishing" "CIM_PrintService.Capabilities")))
                :INITFORM NIL)
               (CAPABILITYDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "CapabilityDescriptions" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "Note: The use of this property has been deprecated, due to ambiguity. Instead use the Printer component classes, e.g., PrintInputTray, PrintMarker, PrintFinisher, etc. 
Deprecated description: 
An array of free-form strings that provides more detailed explanations for any of the Printer features that are indicated in the Capabilities array. Note, each entry of this array is related to the entry in the Capabilities array that is located at the same index.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE ("CIM_Printer.Capabilities")))
                :INITFORM NIL)
               (DEFAULTCAPABILITIES (ARRAY UINT16) :CIM-NAME
                "DefaultCapabilities" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "Note: The use of this property has been deprecated, due to ambiguity. Instead use the Printer component classes, e.g., PrintInputTray, PrintMarker, PrintFinisher, etc. 
Deprecated description: 
Specifies which finishings and other capabilities of the Printer will be used by default. An entry in Default Capabilities should also be listed in the Capabilities array.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" "17" "18" "19" "20" "21" ".."))
                 (:VALUES
                  ("Unknown" "Other" "Color Printing" "Duplex Printing"
                   "Copies" "Collation" "Stapling" "Transparency Printing"
                   "Punch" "Cover" "Bind" "Black and White Printing"
                   "One Sided" "Two Sided Long Edge" "Two Sided Short Edge"
                   "Portrait" "Landscape" "Reverse Portrait"
                   "Reverse Landscape" "Quality High" "Quality Normal"
                   "Quality Low" "DMTF Reserved"))
                 (:MODEL-CORRESPONDENCE ("CIM_Printer.Capabilities")))
                :INITFORM NIL)
               (CURRENTCAPABILITIES (ARRAY UINT16) :CIM-NAME
                "CurrentCapabilities" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "Note: The use of this property has been deprecated, due to ambiguity. Instead use the Printer component classes, e.g., PrintInputTray, PrintMarker, PrintFinisher, etc. 
Deprecated description: 
Specifies which finishings and other capabilities of the Printer are currently being used. An entry in this property should also be listed in the Capabilities array.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" "17" "18" "19" "20" "21" ".."))
                 (:VALUES
                  ("Unknown" "Other" "Color Printing" "Duplex Printing"
                   "Copies" "Collation" "Stapling" "Transparency Printing"
                   "Punch" "Cover" "Bind" "Black and White Printing"
                   "One Sided" "Two Sided Long Edge" "Two Sided Short Edge"
                   "Portrait" "Landscape" "Reverse Portrait"
                   "Reverse Landscape" "Quality High" "Quality Normal"
                   "Quality Low" "DMTF Reserved"))
                 (:MODEL-CORRESPONDENCE ("CIM_Printer.Capabilities")))
                :INITFORM NIL)
               (CHARSETSSUPPORTED (ARRAY STRING) :CIM-NAME "CharSetsSupported"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Identifies the available character sets for the output of text that is related to managing the Printer. Strings provided in this property should conform to the semantics and syntax specified by section 4.1.2 (\"Charset parameter\") in RFC 2046 (MIME Part 2) and contained in the IANA character-set registry. Examples include \"utf-8\", \"us-ascii\" and \"iso-8859-1\". 
Note: For compatiblity with the IETF Printer MIB (RFC 3805) and IETF IPP/1.1 (RFC 2911), values in this array property shall be parallel to values in NaturalLanguagesSupported.")
                 (:ARRAYTYPE "Indexed")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Printer-MIB.prtLocalizationCharacterSet"
                   "MIB.IETF|IANA-CHARSET-MIB.IANACharset"
                   "RFC2911.IETF|Section 4.4.18 charset-supported"))
                 (:MODEL-CORRESPONDENCE ("CIM_PrintJob.CharSet")))
                :INITFORM NIL)
               (NATURALLANGUAGESSUPPORTED (ARRAY STRING) :CIM-NAME
                "NaturalLanguagesSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "Identifies the available languages for strings that are used by the Printer for the output of management information. The strings should conform to RFC 1766, for example, \"en\" is used for English.")
                 (:ARRAYTYPE "Indexed")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Printer-MIB.prtLocalizationLanguage"
                   "MIB.IETF|Printer-MIB.prtLocalizationCountry"
                   "RFC2911.IETF|Printer.generated-natural-language-supported"
                   "RFC2911.IETF|Section 4.4.20"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Printer.CurrentNaturalLanguage"
                   "CIM_Printer.ConsoleNaturalLanguage"
                   "CIM_PrintJob.NaturalLanguage")))
                :INITFORM NIL)
               (AVAILABLEJOBSHEETS (ARRAY STRING) :CIM-NAME
                "AvailableJobSheets" :QUALIFIERS
                ((:DESCRIPTION
                  "Describes all of the job sheets that are available on the Printer. This method can also be used to describe the banner that a Printer might provide at the beginning of each Job or that can describe other user specified options.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Printer-MIB.prtAuxiliarySheetStartupPage"
                   "MIB.IETF|Printer-MIB.prtAuxiliarySheetBannerPage"
                   "RFC2911.IETF|Printer.job-sheets-supported"
                   "RFC2911.IETF|Section 4.2 Job Template Attributes"
                   "RFC2911.IETF|Section 4.2.3 job-sheets"))
                 (:MODEL-CORRESPONDENCE ("CIM_PrintJob.RequiredJobSheets")))
                :INITFORM NIL)
               (CONSOLEDISPLAYBUFFERTEXT (ARRAY STRING) :CIM-NAME
                "ConsoleDisplayBufferText" :QUALIFIERS
                ((:DESCRIPTION
                  "A sequence of strings, each a line of human-readable text from the local console of the Printer, in the language specified by ConsoleNaturalLanguage.")
                 (:ARRAYTYPE "Indexed")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Printer-MIB.prtConsoleDisplayBufferText"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Printer.NaturalLanguagesSupported"
                   "CIM_Printer.ConsoleNaturalLanguage")))
                :INITFORM NIL)
               (POWERMANAGEMENTCAPABILITIES (ARRAY UINT16) :CIM-NAME
                "PowerManagementCapabilities" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_PowerManagementCapabilities.PowerCapabilities"))
                 (:DESCRIPTION
                  "An enumerated array describing the power management capabilities of the Device. The use of this property has been deprecated. Instead, the PowerCapabilites property in an associated PowerManagementCapabilities class should be used.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6" "7"))
                 (:VALUES
                  ("Unknown" "Not Supported" "Disabled" "Enabled"
                   "Power Saving Modes Entered Automatically"
                   "Power State Settable" "Power Cycling Supported"
                   "Timed Power On Supported")))
                :INITFORM NIL)
               (OTHERIDENTIFYINGINFO (ARRAY STRING) :CIM-NAME
                "OtherIdentifyingInfo" :QUALIFIERS
                ((:DESCRIPTION
                  "OtherIdentifyingInfo captures additional data, beyond DeviceID information, that could be used to identify a LogicalDevice. One example would be to hold the Operating System's user friendly name for the Device in this property.")
                 (:ARRAYTYPE "Indexed") (:MAX-LEN "256")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_LogicalDevice.IdentifyingDescriptions")))
                :INITFORM NIL)
               (IDENTIFYINGDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "IdentifyingDescriptions" :QUALIFIERS
                ((:DESCRIPTION
                  "An array of free-form strings providing explanations and details behind the entries in the OtherIdentifyingInfo array. Note, each entry of this array is related to the entry in OtherIdentifyingInfo that is located at the same index.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_LogicalDevice.OtherIdentifyingInfo")))
                :INITFORM NIL)
               (ADDITIONALAVAILABILITY (ARRAY UINT16) :CIM-NAME
                "AdditionalAvailability" :QUALIFIERS
                ((:DESCRIPTION
                  "Additional availability and status of the Device, beyond that specified in the Availability property. The Availability property denotes the primary status and availability of the Device. In some cases, this will not be sufficient to denote the complete status of the Device. In those cases, the AdditionalAvailability property can be used to provide further information. For example, a Device's primary Availability may be \"Off line\" (value=8), but it may also be in a low power state (AdditonalAvailability value=14), or the Device could be running Diagnostics (AdditionalAvailability value=5, \"In Test\").")
                 (:VALUE-MAP
                  ("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14"
                   "15" "16" "17" "18" "19" "20" "21"))
                 (:VALUES
                  ("Other" "Unknown" "Running/Full Power" "Warning" "In Test"
                   "Not Applicable" "Power Off" "Off Line" "Off Duty"
                   "Degraded" "Not Installed" "Install Error"
                   "Power Save - Unknown" "Power Save - Low Power Mode"
                   "Power Save - Standby" "Power Cycle" "Power Save - Warning"
                   "Paused" "Not Ready" "Not Configured" "Quiesced"))
                 (:MODEL-CORRESPONDENCE ("CIM_LogicalDevice.Availability")))
                :INITFORM NIL)
               (AVAILABLEREQUESTEDSTATES (ARRAY UINT16) :CIM-NAME
                "AvailableRequestedStates" :QUALIFIERS
                ((:DESCRIPTION
                  "AvailableRequestedStates indicates the possible values for the RequestedState parameter of the method RequestStateChange, used to initiate a state change. The values listed shall be a subset of the values contained in the RequestedStatesSupported property of the associated instance of CIM_EnabledLogicalElementCapabilities where the values selected are a function of the current state of the CIM_EnabledLogicalElement. This property may be non-null if an implementation is able to advertise the set of possible values as a function of the current state. This property shall be null if an implementation is unable to determine the set of possible values as a function of the current state.")
                 (:VALUE-MAP ("2" "3" "4" "6" "7" "8" "9" "10" "11" ".."))
                 (:VALUES
                  ("Enabled" "Disabled" "Shut Down" "Offline" "Test" "Defer"
                   "Quiesce" "Reboot" "Reset" "DMTF Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.RequestStateChange"
                   "CIM_EnabledLogicalElementCapabilities.RequestedStatesSupported")))
                :INITFORM NIL)
               (OPERATIONALSTATUS (ARRAY UINT16) :CIM-NAME "OperationalStatus"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Indicates the current statuses of the element. Various operational statuses are defined. Many of the enumeration's values are self-explanatory. However, a few are not and are described here in more detail. 
\"Stressed\" indicates that the element is functioning, but needs attention. Examples of \"Stressed\" states are overload, overheated, and so on. 
\"Predictive Failure\" indicates that an element is functioning nominally but predicting a failure in the near future. 
\"In Service\" describes an element being configured, maintained, cleaned, or otherwise administered. 
\"No Contact\" indicates that the monitoring system has knowledge of this element, but has never been able to establish communications with it. 
\"Lost Communication\" indicates that the ManagedSystem Element is known to exist and has been contacted successfully in the past, but is currently unreachable. 
\"Stopped\" and \"Aborted\" are similar, although the former implies a clean and orderly stop, while the latter implies an abrupt stop where the state and configuration of the element might need to be updated. 
\"Dormant\" indicates that the element is inactive or quiesced. 
\"Supporting Entity in Error\" indicates that this element might be \"OK\" but that another element, on which it is dependent, is in error. An example is a network service or endpoint that cannot function due to lower-layer networking problems. 
\"Completed\" indicates that the element has completed its operation. This value should be combined with either OK, Error, or Degraded so that a client can tell if the complete operation Completed with OK (passed), Completed with Error (failed), or Completed with Degraded (the operation finished, but it did not complete OK or did not report an error). 
\"Power Mode\" indicates that the element has additional power model information contained in the Associated PowerManagementService association. 
\"Relocating\" indicates the element is being relocated.
OperationalStatus replaces the Status property on ManagedSystemElement to provide a consistent approach to enumerations, to address implementation needs for an array property, and to provide a migration path from today's environment to the future. This change was not made earlier because it required the deprecated qualifier. Due to the widespread use of the existing Status property in management applications, it is strongly recommended that providers or instrumentation provide both the Status and OperationalStatus properties. Further, the first value of OperationalStatus should contain the primary status for the element. When instrumented, Status (because it is single-valued) should also provide the primary status of the element.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" "17" "18" "19" ".." "0x8000.."))
                 (:VALUES
                  ("Unknown" "Other" "OK" "Degraded" "Stressed"
                   "Predictive Failure" "Error" "Non-Recoverable Error"
                   "Starting" "Stopping" "Stopped" "In Service" "No Contact"
                   "Lost Communication" "Aborted" "Dormant"
                   "Supporting Entity in Error" "Completed" "Power Mode"
                   "Relocating" "DMTF Reserved" "Vendor Reserved"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ManagedSystemElement.StatusDescriptions")))
                :INITFORM NIL)
               (STATUSDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "StatusDescriptions" :QUALIFIERS
                ((:DESCRIPTION
                  "Strings describing the various OperationalStatus array values. For example, if \"Stopping\" is the value assigned to OperationalStatus, then this property may contain an explanation as to why an object is being stopped. Note that entries in this array are correlated with those at the same array index in OperationalStatus.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ManagedSystemElement.OperationalStatus")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_Printer")
              (:QUALIFIERS (:VERSION "2.25.0")
               (:UML-PACKAGE-PATH "CIM::Device::Printing")
               (:DESCRIPTION
                "Capabilities and management of the Printer LogicalDevice. The ABNF for CIM references to PWG Standards and MIBs is in the directory 'ftp://ftp.pwg.org/pub/pwg/general/process' in the file 'pwg-cim-references-format-20060309.txt'. Examples 
include: (a) a MappingStrings reference to a PWG Standard is 'PWG5101-1.PWG|Section 4 Media Color Names'; 
(b) a MappingStrings reference to a PWG MIB is 'MIB.PWG|PWG-IMAGING-COUNTER-MIB.icMonitorCompletedJobs'. 
Note: A Printer shall be associated with at least one of every required component (e.g., PrintMarker) via an instance of the PrinterComponent class. A Printer may be associated with zero or more optional components (e.g., PrintSupply) via an instance of the ConcreteComponent class. See: Model in section 2 of Printer MIB (RFC 3805).")
               (:MAPPING-STRINGS ("MIB.IETF|Printer-MIB.prtGeneralEntry"))))
(DEFCIM-METHOD SETPOWERSTATE
    ((INSTANCE CIM_PRINTER)
     (POWERSTATE UINT16 "PowerState" :IN
      (:DESCRIPTION "The power state to set.")
      (:VALUE-MAP ("1" "2" "3" "4" "5" "6"))
      (:VALUES
       ("Full Power" "Power Save - Low Power Mode" "Power Save - Standby"
        "Power Save - Other" "Power Cycle" "Power Off")))
     (TIME
      DATETIME
      "Time"
      :IN
      (:DESCRIPTION
       "Time indicates when the power state should be set, either as a regular date-time value or as an interval value (where the interval begins when the method invocation is received.")))
    ((:CIM-NAME "SetPowerState")
     (:QUALIFIERS (:DEPRECATED ("CIM_PowerManagementService.SetPowerState"))
      (:DESCRIPTION
       "Sets the power state of the Device. The use of this method has been deprecated. Instead, use the SetPowerState method in the associated PowerManagementService class."))))
(DEFCIM-METHOD RESET
    ((INSTANCE CIM_PRINTER))
    ((:CIM-NAME "Reset")
     (:QUALIFIERS
      (:DESCRIPTION
       "Requests a reset of the LogicalDevice. The return value should be 0 if the request was successfully executed, 1 if the request is not supported and some other value if an error occurred. In a subclass, the set of possible return codes could be specified, using a ValueMap qualifier on the method. The strings to which the ValueMap contents are 'translated' may also be specified in the subclass as a Values array qualifier."))))
(DEFCIM-METHOD ENABLEDEVICE
    ((INSTANCE CIM_PRINTER)
     (ENABLED BOOLEAN "Enabled" :IN
      (:DESCRIPTION "If TRUE enable the device, if FALSE disable the device.")))
    ((:CIM-NAME "EnableDevice")
     (:QUALIFIERS
      (:DEPRECATED ("CIM_EnabledLogicalElement.RequestStateChange"))
      (:DESCRIPTION
       "The EnableDevice method has been deprecated in lieu of the more general RequestStateChange method that directly overlaps with the functionality provided by this method. 
Requests that the LogicalDevice be enabled (\"Enabled\" input parameter = TRUE) or disabled (= FALSE). If successful, the Device's StatusInfo/EnabledState properties should reflect the desired state (enabled/disabled). Note that this method's function overlaps with the RequestedState property. RequestedState was added to the model to maintain a record (i.e., a persisted value) of the last state request. Invoking the EnableDevice method should set the RequestedState property appropriately. 
The return code should be 0 if the request was successfully executed, 1 if the request is not supported and some other value if an error occurred. In a subclass, the set of possible return codes could be specified, using a ValueMap qualifier on the method. The strings to which the ValueMap contents are 'translated' may also be specified in the subclass as a Values array qualifier."))))
(DEFCIM-METHOD ONLINEDEVICE
    ((INSTANCE CIM_PRINTER)
     (ONLINE BOOLEAN "Online" :IN
      (:DESCRIPTION
       "If TRUE, take the device online, if FALSE, take the device OFFLINE.")))
    ((:CIM-NAME "OnlineDevice")
     (:QUALIFIERS
      (:DEPRECATED ("CIM_EnabledLogicalElement.RequestStateChange"))
      (:DESCRIPTION
       "The OnlineDevice method has been deprecated in lieu of the more general RequestStateChange method that directly overlaps with the functionality provided by this method. 
Requests that the LogicalDevice be brought online (\"Online\" input parameter = TRUE) or taken offline (= FALSE). \"Online\" indicates that the Device is ready to accept requests, and is operational and fully functioning. In this case, the Device's Availability property would be set to a value of 3 (\"Running/Full Power\"). \"Offline\" indicates that a Device is powered up and operational, but not processing functional requests. In an offline state, a Device may be capable of running diagnostics or generating operational alerts. For example, when the \"Offline\" button is pushed on a Printer, the Device is no longer available to process print jobs, but could be available for diagnostics or maintenance. 
If this method is successful, the Device's Availability and AdditionalAvailability properties should reflect the updated status. If a failure occurs trying to bring the Device online or offline, it should remain in its current state. IE, the request, if unsuccessful, should not leave the Device in an indeterminate state. When bringing a Device back \"Online\", from an \"Offline\" mode, the Device should be restored to its last \"Online\" state, if at all possible. Only a Device that has an EnabledState/StatusInfo of \"Enabled\" and has been configured can be brought online or taken offline. 
OnlineDevice should return 0 if successful, 1 if the request is not supported at all, 2 if the request is not supported due to the current state of the Device, and some other value if any other error occurred. In a subclass, the set of possible return codes could be specified, using a ValueMap qualifier on the method. The strings to which the ValueMap contents are 'translated' may also be specified in the subclass as a Values array qualifier. 
Note that this method's function overlaps with the RequestedState property. RequestedState was added to the model to maintain a record (i.e., a persisted value) of the last state request. Invoking the OnlineDevice method should set the RequestedState property appropriately."))))
(DEFCIM-METHOD QUIESCEDEVICE
    ((INSTANCE CIM_PRINTER)
     (QUIESCE BOOLEAN "Quiesce" :IN
      (:DESCRIPTION
       "If set to TRUE then cleanly cease all activity, if FALSE resume activity.")))
    ((:CIM-NAME "QuiesceDevice")
     (:QUALIFIERS
      (:DEPRECATED ("CIM_EnabledLogicalElement.RequestStateChange"))
      (:DESCRIPTION
       "The QuiesceDevice method has been deprecated in lieu of the more general RequestStateChange method that directly overlaps with the functionality provided by this method. 
Requests that the LogicalDevice cleanly cease all current activity (\"Quiesce\" input parameter = TRUE) or resume activity (= FALSE). For this method to quiesce a Device, that Device should have an Availability (or Additional Availability) of \"Running/Full Power\" (value=3) and an EnabledStatus/StatusInfo of \"Enabled\". For example, if quiesced, a Device may then be offlined for diagnostics, or disabled for power off and hot swap. For the method to \"unquiesce\" a Device, that Device should have an Availability (or AdditionalAvailability) of \"Quiesced\" (value=21) and an EnabledStatus/StatusInfo of \"Enabled\". In this case, the Device would be returned to an \"Enabled\" and \"Running/Full Power\" status. 
The method's return code should indicate the success or failure of the quiesce. It should return 0 if successful, 1 if the request is not supported at all, 2 if the request is not supported due to the current state of the Device, and some other value if any other error occurred. In a subclass, the set of possible return codes could be specified, using a ValueMap qualifier on the method. The strings to which the ValueMap contents are 'translated' may also be specified in the subclass as a Values array qualifier."))))
(DEFCIM-METHOD SAVEPROPERTIES
    ((INSTANCE CIM_PRINTER))
    ((:CIM-NAME "SaveProperties")
     (:QUALIFIERS
      (:DESCRIPTION
       "Requests that the Device capture its current configuration, setup and/or state information in a backing store. The goal would be to use this information at a later time (via the RestoreProperties method), to return a Device to its present \"condition\". This method may not be supported by all Devices. The method should return 0 if successful, 1 if the request is not supported, and some other value if any other error occurred. In a subclass, the set of possible return codes could be specified, using a ValueMap qualifier on the method. The strings to which the ValueMap contents are 'translated' may also be specified in the subclass as a Values array qualifier."))))
(DEFCIM-METHOD RESTOREPROPERTIES
    ((INSTANCE CIM_PRINTER))
    ((:CIM-NAME "RestoreProperties")
     (:QUALIFIERS
      (:DESCRIPTION
       "Requests that the Device re-establish its configuration, setup and/or state information from a backing store. The intent is to capture this information at an earlier time (via the SaveProperties method), and use it to return a Device to this earlier \"condition\". This method may not be supported by all Devices. The method should return 0 if successful, 1 if the request is not supported, and some other value if any other error occurred. In a subclass, the set of possible return codes could be specified, using a ValueMap qualifier on the method. The strings to which the ValueMap contents are 'translated' may also be specified in the subclass as a Values array qualifier."))))
(DEFCIM-METHOD REQUESTSTATECHANGE
    ((INSTANCE CIM_PRINTER)
     (REQUESTEDSTATE UINT16 "RequestedState" :IN
      (:DESCRIPTION
       "The state requested for the element. This information will be placed into the RequestedState property of the instance if the return code of the RequestStateChange method is 0 ('Completed with No Error'), or 4096 (0x1000) ('Job Started'). Refer to the description of the EnabledState and RequestedState properties for the detailed explanations of the RequestedState values.")
      (:VALUE-MAP ("2" "3" "4" "6" "7" "8" "9" "10" "11" ".." "32768..65535"))
      (:VALUES
       ("Enabled" "Disabled" "Shut Down" "Offline" "Test" "Defer" "Quiesce"
        "Reboot" "Reset" "DMTF Reserved" "Vendor Reserved"))
      (:MODEL-CORRESPONDENCE ("CIM_EnabledLogicalElement.RequestedState")))
     (TIMEOUTPERIOD DATETIME "TimeoutPeriod" :IN
      (:DESCRIPTION
       "A timeout period that specifies the maximum amount of time that the client expects the transition to the new state to take. The interval format must be used to specify the TimeoutPeriod. A value of 0 or a null parameter indicates that the client has no time requirements for the transition. 
If this property does not contain 0 or null and the implementation does not support this parameter, a return code of 'Use Of Timeout Parameter Not Supported' shall be returned."))
     (JOB "CIM_ConcreteJob" "Job" :IN :OUT
      (:DESCRIPTION
       "May contain a reference to the ConcreteJob created to track the state transition initiated by the method invocation.")))
    ((:CIM-NAME "RequestStateChange")
     (:QUALIFIERS
      (:DESCRIPTION
       "Requests that the state of the element be changed to the value specified in the RequestedState parameter. When the requested state change takes place, the EnabledState and RequestedState of the element will be the same. Invoking the RequestStateChange method multiple times could result in earlier requests being overwritten or lost. 
A return code of 0 shall indicate the state change was successfully initiated. 
A return code of 3 shall indicate that the state transition cannot complete within the interval specified by the TimeoutPeriod parameter. 
A return code of 4096 (0x1000) shall indicate the state change was successfully initiated, a ConcreteJob has been created, and its reference returned in the output parameter Job. Any other return code indicates an error condition.")
      (:VALUE-MAP
       ("0" "1" "2" "3" "4" "5" "6" ".." "4096" "4097" "4098" "4099"
        "4100..32767" "32768..65535"))
      (:VALUES
       ("Completed with No Error" "Not Supported"
        "Unknown or Unspecified Error" "Cannot complete within Timeout Period"
        "Failed" "Invalid Parameter" "In Use" "DMTF Reserved"
        "Method Parameters Checked - Job Started" "Invalid State Transition"
        "Use of Timeout Parameter Not Supported" "Busy" "Method Reserved"
        "Vendor Specific"))
      (:MODEL-CORRESPONDENCE ("CIM_EnabledLogicalElement.RequestedState")))))