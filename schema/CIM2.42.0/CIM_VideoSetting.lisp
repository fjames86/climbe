
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_VideoSetting.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_VIDEOSETTING (CIM_ELEMENTSETTING)
              ((ELEMENT NIL :CIM-NAME "Element" :QUALIFIERS
                ((:DEPRECATED ("CIM_ElementSetting.Element"))
                 (:OVERRIDE "Element") (:DESCRIPTION "The VideoController.")
                 :KEY)
                :INITFORM "CIM_VideoController")
               (SETTING NIL :CIM-NAME "Setting" :QUALIFIERS
                ((:DEPRECATED ("CIM_ElementSetting.Setting"))
                 (:OVERRIDE "Setting")
                 (:DESCRIPTION
                  "The resolutions, refresh rates, scan mode, and number of colors that can be set for the Controller.")
                 :KEY)
                :INITFORM "CIM_VideoControllerResolution"))
              (:CIM-NAME "CIM_VideoSetting")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("CIM_ElementSetting"))
               (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::Controller")
               (:DESCRIPTION
                "Note: The use of the CIM_VideoSetting class has been deprecated in lieu of CIM_ElementSetting. 
Deprecated description: 
VideoSetting associates the VideoControllerResolution Setting with the Controllers to which it applies.")))