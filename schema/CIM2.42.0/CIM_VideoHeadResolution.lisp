
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_VideoHeadResolution.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_VIDEOHEADRESOLUTION (CIM_SETTINGDATA)
              ((HORIZONTALRESOLUTION UINT32 :CIM-NAME "HorizontalResolution"
                :QUALIFIERS
                ((:DESCRIPTION "Monitor's horizontal resolution in Pixels.")
                 (NIL "Pixels")
                 (:MAPPING-STRINGS ("MIF.DMTF|Monitor Resolutions|002.2"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_VideoHead.CurrentHorizontalResolution"))
                 (:P-UNIT "pixel"))
                :INITFORM NIL)
               (VERTICALRESOLUTION UINT32 :CIM-NAME "VerticalResolution"
                :QUALIFIERS
                ((:DESCRIPTION "Monitor's vertical resolution in Pixels.")
                 (NIL "Pixels")
                 (:MAPPING-STRINGS ("MIF.DMTF|Monitor Resolutions|002.3"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_VideoHead.CurrentVerticalResolution"))
                 (:P-UNIT "pixel"))
                :INITFORM NIL)
               (REFRESHRATE UINT32 :CIM-NAME "RefreshRate" :QUALIFIERS
                ((:DESCRIPTION
                  "Monitor's refresh rate in Hertz. If a range of rates is supported, use the MinRefreshRate and MaxRefreshRate properties, and set RefreshRate (this property) to 0.")
                 (NIL "Hertz")
                 (:MAPPING-STRINGS ("MIF.DMTF|Monitor Resolutions|002.4"))
                 (:MODEL-CORRESPONDENCE ("CIM_VideoHead.CurrentRefreshRate"))
                 (:P-UNIT "hertz"))
                :INITFORM NIL)
               (MINREFRESHRATE UINT32 :CIM-NAME "MinRefreshRate" :QUALIFIERS
                ((:DESCRIPTION
                  "Monitor's minimum refresh rate in Hertz, when a range of rates is supported at the specified resolutions.")
                 (NIL "Hertz")
                 (:MAPPING-STRINGS ("MIF.DMTF|Monitor Resolutions|002.6"))
                 (:MODEL-CORRESPONDENCE ("CIM_VideoHead.MinRefreshRate"))
                 (:P-UNIT "hertz"))
                :INITFORM NIL)
               (MAXREFRESHRATE UINT32 :CIM-NAME "MaxRefreshRate" :QUALIFIERS
                ((:DESCRIPTION
                  "Monitor's maximum refresh rate in Hertz, when a range of rates is supported at the specified resolutions.")
                 (NIL "Hertz")
                 (:MAPPING-STRINGS ("MIF.DMTF|Monitor Resolutions|002.7"))
                 (:MODEL-CORRESPONDENCE ("CIM_VideoHead.MaxRefreshRate"))
                 (:P-UNIT "hertz"))
                :INITFORM NIL)
               (SCANMODE UINT16 :CIM-NAME "ScanMode" :QUALIFIERS
                ((:DESCRIPTION
                  "Integer indicating whether the monitor operates in interlaced (value=5) or non-interlaced (4) mode.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4"))
                 (:VALUES
                  ("Unknown" "Other" "Not Supported" "Non-Interlaced Operation"
                   "Interlaced Operation"))
                 (:MAPPING-STRINGS ("MIF.DMTF|Monitor Resolutions|002.5"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_VideoHead.CurrentScanMode"
                   "CIM_VideoHeadResolution.OtherScanMode")))
                :INITFORM NIL)
               (OTHERSCANMODE STRING :CIM-NAME "OtherScanMode" :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing the scan mode when the instance's ScanMode property is 1 (\"Other\").")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_VideoHead.OtherCurrentScanMode"
                   "CIM_VideoHeadResolution.ScanMode")))
                :INITFORM NIL)
               (NUMBEROFCOLORS UINT64 :CIM-NAME "NumberOfColors" :QUALIFIERS
                ((:DESCRIPTION
                  "Number of colors supported at the current resolutions.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_VideoHead.CurrentNumberOfColors")))
                :INITFORM NIL)
               (INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. To ensure uniqueness within the NameSpace, the value of InstanceID should be constructed using the following \"preferred\" algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon (:), and where <OrgID> must include a copyrighted, trademarked, or otherwise unique name that is owned by the business entity that is creating or defining the InstanceID or that is a registered ID assigned to the business entity by a recognized global authority. (This requirement is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness, <OrgID> must not contain a colon (:). When using this algorithm, the first colon to appear in InstanceID must appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and should not be reused to identify different underlying (real-world) elements. If the above \"preferred\" algorithm is not used, the defining entity must assure that the resulting InstanceID is not reused across any InstanceIDs produced by this or other providers for the NameSpace of this instance. 
For DMTF-defined instances, the \"preferred\" algorithm must be used with the <OrgID> set to CIM."))
                :INITFORM NIL)
               (ELEMENTNAME STRING :CIM-NAME "ElementName" :QUALIFIERS
                (:REQUIRED (:OVERRIDE "ElementName")
                 (:DESCRIPTION
                  "The user-friendly name for this instance of SettingData. In addition, the user-friendly name can be used as an index property for a search or query. (Note: The name does not have to be unique within a namespace.)"))
                :INITFORM NIL)
               (CHANGEABLETYPE UINT16 :CIM-NAME "ChangeableType" :QUALIFIERS
                ((:DESCRIPTION
                  "Enumeration indicating the type of setting. 0 \"Not Changeable - Persistent\" indicates the instance of SettingData represents primordial settings and shall not be modifiable. 1 \"Changeable - Transient\" indicates the SettingData represents modifiable settings that are not persisted. Establishing persistent settings from transient settings may be supported. 2 \"Changeable - Persistent\" indicates the SettingData represents a persistent configuration that may be modified. 3 \"Not Changeable - Transient\" indicates the SettingData represents a snapshot of the settings of the associated ManagedElement and is not persistent.")
                 (:VALUE-MAP ("0" "1" "2" "3"))
                 (:VALUES
                  ("Not Changeable - Persistent" "Changeable - Transient"
                   "Changeable - Persistent" "Not Changeable - Transient")))
                :INITFORM NIL)
               (CONFIGURATIONNAME STRING :CIM-NAME "ConfigurationName"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An instance of CIM_SettingData may correspond to a well-known configuration that exists for an associated CIM_ManagedElement. If the ConfigurationName property is non-NULL, the instance of CIM_SettingData shall correspond to a well-known configuration for a Managed Element, the value of the ConfigurationName property shall be the name of the configuration, and the ChangeableType property shall have the value 0 or 2. A value of NULL for the ConfigurationName property shall mean that the instance of CIM_SettingData does not correspond to a well-known configuration for a Managed Element or that this information is unknown."))
                :INITFORM NIL)
               (CAPTION STRING :CIM-NAME "Caption" :QUALIFIERS
                ((:DESCRIPTION
                  "The Caption property is a short textual description (one- line string) of the object.")
                 (:MAX-LEN "64"))
                :INITFORM NIL)
               (DESCRIPTION STRING :CIM-NAME "Description" :QUALIFIERS
                ((:DESCRIPTION
                  "The Description property provides a textual description of the object."))
                :INITFORM NIL))
              (:CIM-NAME "CIM_VideoHeadResolution")
              (:QUALIFIERS (:VERSION "2.31.1")
               (:UML-PACKAGE-PATH "CIM::Device::Controller")
               (:DESCRIPTION
                "VideoHeadResolution describes the various video modes that a VideoHead can support. Video modes are defined by the possible horizontal and vertical resolutions, refresh rate, scan mode and number of colors settings supported by a Controller. The actual resolutions, etc. that are in use, are the values specified in the VideoHead object.")))