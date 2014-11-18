
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_HomeForMedia.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_HOMEFORMEDIA (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION
                  "The Location that is 'home' to a piece of PhysicalMedia.")
                 :KEY)
                :INITFORM "CIM_StorageMediaLocation")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MAX "1")
                 (:DESCRIPTION
                  "The PhysicalMedia whose 'home' or default Location is defined.")
                 :KEY)
                :INITFORM "CIM_PhysicalMedia"))
              (:CIM-NAME "CIM_HomeForMedia")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Physical::PhysicalMedia")
               (:DESCRIPTION
                "In a StorageLibrary or repository for PhysicalMedia, it is reasonable that a specific Media always be placed in a specific Location (rather than anywhere in the repository/ Library). The default location for a PhysicalMedia is called its 'home'. This information is expressed by the HomeForMedia dependency association. (Note that a PhysicalMedia can have at most one 'home', and a StorageMediaLocation can be 'home' to at most one Media.)")))