
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SettingsDefineCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SETTINGSDEFINECAPABILITIES (CIM_COMPONENT)
              ((PROPERTYPOLICY UINT16 :CIM-NAME "PropertyPolicy" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "PropertyPolicy defines whether or not the non-null, non-key properties of the associated SettingData instance are treated independently or as a correlated set. For instance, an independent set of maximum properties might be defined, when there is no relationship between each property. On the other hand, several correlated sets of maximum properties might need to be defined when the maximum values of each are dependent on some of the others.")
                 (:VALUE-MAP ("0" "1" ".."))
                 (:VALUES ("Independent" "Correlated" "DMTF Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SettingsDefineCapabilities.ValueRole"
                   "CIM_SettingsDefineCapabilities.ValueRange")))
                :INITFORM "0")
               (VALUEROLE UINT16 :CIM-NAME "ValueRole" :QUALIFIERS
                ((:DESCRIPTION
                  "The ValueRole property indicates further semantics on the interpretation of the non-null, non-key properties of the Component SettingData.
\"Default\" indicates that property values of the component SettingData instance will be used as default values, when a new SettingData instance is created for elements whose capabilities are defined by the associated Capabilities instance.
Across instances of settingdata, for particular properties having the same semantic purpose, at most one such settingdata instance shall be specified as a default.
\"Optimal\" indicates that the SettingData instance represents optimal setting values for elements associated with the associated capabilities instance. Multiple component SettingData instances may be declared as optimal.\"Mean\" indicates that the non-null, non-key, non-enumerated, non-boolean, numeric properties of the associated SettingData instance represents an average point along some dimension. For different combinations of SettingData properties, multiple component SettingData instances may be declared as \"Mean\". \"Supported\" indicates that the non-null, non-key properties of the Component SettingData instance represents a set of supported property values that are not otherwise qualified.")
                 (:VALUE-MAP ("0" "1" "2" "3" ".."))
                 (:VALUES
                  ("Default" "Optimal" "Mean" "Supported" "DMTF Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SettingsDefineCapabilities.PropertyPolicy"
                   "CIM_SettingsDefineCapabilities.ValueRange")))
                :INITFORM "3")
               (VALUERANGE UINT16 :CIM-NAME "ValueRange" :QUALIFIERS
                ((:DESCRIPTION
                  "The ValueRange property indicates further semantics on the interpretation of all non-null, non-key properties of the Component SettingData.
\"Point\" indicates that this SettingData instance provides a single set of values.
\"Minimums\", \"Maximums\", and \"Increments\", are only evaluated against non-null, non-key, non-enumerated, non-boolean, numeric properties of the SettingData instance. Each property of that set shall be mathematically comparable to other instances of that property.
\"Minimums\" indicates that this SettingData instance provides minimum values for evaluated properties. When used with PropertyPolicy = \"Independent\", only one such setting per particular SettingData instance shall be specified for any Capabilities. Unless restricted by a Maximums on the same set of properties, all values that compare higher than the specified values are also considered to be supported by the associated capabilities instance. 
\"Maximums\" indicates that this SettingData instance provides maximum values for evaluated properties. When used with PropertyPolicy = \"Independent\", only one such setting per particular SettingData instance shall be specified for any Capabilities. Unless restricted by a Minimums on the same set of properties, all values that compare lower than the specified values are also considered to be supported by the associated capabilities instance.
\"Increments\" indicates that this SettingData instance provides increment values for evaluated properties. For the associated Capabilities, if an evaluated property currently has no corresponding minimums or maximums, then the property has no affect. Otherwise, for each evaluated property: its value x shall be between the minimum and maximum, inclusively, and shall have the property that both the result of maximum minus x and the result of x minus minimum are each an integer multiple of the increment. If either minimum or maximum is not specified and the other is, then the missing value shall be respectively assumed to be the lowest or highest supported value for the property's data-type. Additionally, if both a minimum and a maximum are specified for an evaluated property, then the result of maximum minus minimum shall be an integer multiple of the increment.")
                 (:VALUE-MAP ("0" "1" "2" "3" ".."))
                 (:VALUES
                  ("Point" "Minimums" "Maximums" "Increments" "DMTF Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SettingsDefineCapabilities.PropertyPolicy"
                   "CIM_SettingsDefineCapabilities.ValueRole")))
                :INITFORM "0")
               (GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MAX "1")
                 (:DESCRIPTION "The Capabilities instance.") :KEY)
                :INITFORM "CIM_Capabilities")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "A Setting used to define the associated Capabilities instance.")
                 :KEY)
                :INITFORM "CIM_SettingData"))
              (:CIM-NAME "CIM_SettingsDefineCapabilities")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.22.1")
               (:UML-PACKAGE-PATH "CIM::Core::Settings")
               (:DESCRIPTION
                "This association indicates that the non-null, non-key set of properties of the component SettingData instance specifies some capabilities of the associated Capabilities instance. The interpretation of the set of properties in the associated SettingData is governed by the properties: PropertyPolicy and ValueRole.
For a particular Capabilities instance, the complete set of Component SettingData instances, together with properties of the Capabilities instance itself, defines the overall range of supported capabilities.
PropertyPolicy determines whether the properties of the set are interpreted independently or as a whole (i.e. correlated.)
ValueRole further qualifies the members of the set.
This association eliminates the need to define and maintain corresponding property definitions and values in both a Capabilities subclass and a SettingData subclass.
Typically these setting instances will be published along with the associated Capabilities instance and will not be modifiable by the client.")))