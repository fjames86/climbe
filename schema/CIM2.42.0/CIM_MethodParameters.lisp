
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_MethodParameters.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_METHODPARAMETERS (CIM_MANAGEDELEMENT)
              ((METHODPARAMETERSID STRING :CIM-NAME "MethodParametersId"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The identifier by which the MethodParameters object is known.")
                 (:MAX-LEN "256"))
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
               (ELEMENTNAME STRING :CIM-NAME "ElementName" :QUALIFIERS
                ((:DESCRIPTION
                  "A user-friendly name for the object. This property allows each instance to define a user-friendly name in addition to its key properties, identity data, and description information. 
Note that the Name property of ManagedSystemElement is also defined as a user-friendly name. But, it is often subclassed to be a Key. It is not reasonable that the same property can convey both identity and a user-friendly name, without inconsistencies. Where Name exists and is not a Key (such as for instances of LogicalDevice), the same information can be present in both the Name and ElementName properties. Note that if there is an associated instance of CIM_EnabledLogicalElementCapabilities, restrictions on this properties may exist as defined in ElementNameMask and MaxElementNameLen properties defined in that class."))
                :INITFORM NIL))
              (:CIM-NAME "CIM_MethodParameters")
              (:QUALIFIERS :ABSTRACT (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::MethodParms")
               (:DESCRIPTION
                "CIM_MethodParameters represents a set of values to be used as the parameters of a method. These parameters can be passed to the method, directly used by the method in its invocation, or accessed by the method when it is called. The properties of a concrete subclass of MethodParameters are mapped to the parameters of a method by the method itself or by the method caller. This mapping is an implementation detail that is independent of the definition of the class. For ease of use, property names should match parameter names. 
Property values should be set before the method is invoked. The ModelCorrespondence qualifier can be used to indicate if the property value should come from the property of another class. The instances that the property values should be gleaned from should be associated with MethodParameters using the Parameter ValueSources association. 
If the property is declared as an array, then the same property value (identified by the Model Correspondence) will be retrieved from all appropriate ParameterValueSources instances and stored in the array. 
If the property is declared as an array and the Model Correspondence is to an array property, then only one instance of the array will be copied from one ParameterValueSource. 
If the property is not declared as an array and there are multiple instances of the class and property associated with it through ModelCorrespondence where the values are not all the same, then an error will occur and the value of the property will not be set. 
Several MethodParameters instances can be associated with any of the ManagedElement methods. This association allows the maintenance of 'canned' method invocation and reduces the overhead of re-creating all method parameters for every method invocation.")))
(DEFCIM-METHOD RESETVALUES
    ((INSTANCE CIM_METHODPARAMETERS)
     (SOURCEME "CIM_ManagedElement" "SourceME" :IN
      (:DESCRIPTION "The source ManagedElement.")))
    ((:CIM-NAME "ResetValues")
     (:QUALIFIERS
      (:DESCRIPTION
       "The resetValues method updates the values of the properties of MethodParameters, which have ModelCorrespondence to the SourceME ManagedElement. This update allows several source candidates to be associated with the MethodParameters and one candidate to be selected as the source for this set of values. If resetValues is invoked and sourceME is null, then all associated ManagedElements in ParameterValueSources will be used to set the values of the MethodParameters properties."))))