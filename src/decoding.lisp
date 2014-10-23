

(in-package :climbe)

(defun decode-xml (string)
  "Decode a CIMXML encoded string."
  (declare (type string string))
  (cxml:parse-octets 
   (babel:string-to-octets 
    (remove-if (lambda (char)
                 (member char '(#\newline #\return) 
                         :test #'char=))
               string))
   (cxml-xmls:make-xmls-builder)))
  
(defun decode-cim (string)
  (decode-cimxml-cim (decode-xml string)))

(defun decode-boolean (string)
  "Returns T is the string is the literal value \"true\" otherwise nil."
  (declare (type string string))
  (string-equal string "true"))





;;<!ELEMENT CIM (MESSAGE|DECLARATION)>
;;<!ATTLIST CIM
;;         CIMVERSION CDATA #REQUIRED 
;;         DTDVERSION CDATA #REQUIRED>
(deftag cim () (message declaration)
  (cond
    (message message)     
    (declaration (error "Declarations not supported"))))

;;<!ELEMENT DECLARATION  (DECLGROUP|DECLGROUP.WITHNAME|DECLGROUP.WITHPATH)+>
(deftag declaration () content
  (declare (ignore content))
  nil)

;;<!ELEMENT DECLGROUP  ((LOCALNAMESPACEPATH|NAMESPACEPATH)?,QUALIFIER.DECLARATION*,VALUE.OBJECT*)>

;;<!ELEMENT DECLGROUP.WITHNAME  ((LOCALNAMESPACEPATH|NAMESPACEPATH)?,QUALIFIER.DECLARATION*,VALUE.NAMEDOBJECT*)>

;;<!ELEMENT DECLGROUP.WITHPATH  (VALUE.OBJECTWITHPATH|VALUE.OBJECTWITHLOCALPATH)*>

;;<!ELEMENT QUALIFIER.DECLARATION (SCOPE?,(VALUE|VALUE.ARRAY)?)>
;;<!ATTLIST QUALIFIER.DECLARATION 
;;     %CIMName;
;;     %CIMType;                       #REQUIRED 
;;     ISARRAY        (true|false)     #IMPLIED
;;     %ArraySize;
;;     %QualifierFlavor;>
(deftag qualifier.declaration (name type qualifierflavor) (scope value value.array)
  (make-cim-qualifier 
   :name name
   :type type
   :scope scope
   :flavour (when qualifierflavor (intern qualifierflavor :keyword))
   :default (or value value.array)))
   
;;<!ELEMENT SCOPE EMPTY>
;;<!ATTLIST SCOPE 
;;         CLASS        (true|false)      "false"
;;         ASSOCIATION  (true|false)      "false"
;;         REFERENCE    (true|false)      "false"
;;         PROPERTY     (true|false)      "false"
;;         METHOD       (true|false)      "false"
;;         PARAMETER    (true|false)      "false"
;;         INDICATION   (true|false)      "false">
(deftag scope (class association reference property method parameter indication) empty
  (declare (ignore empty))
  (mapcan (lambda (string sym)
            (when (decode-boolean string)
              (list sym)))
          (list class association reference property method parameter indication)))
    
;;<!ELEMENT VALUE (#PCDATA)>
(deftag value () data
  (car data))

;;<!ELEMENT VALUE.ARRAY (VALUE*)>
(deftag value.array () (value*)
  value)

;;<!ELEMENT VALUE.REFERENCE (CLASSPATH|LOCALCLASSPATH|CLASSNAME|INSTANCEPATH|LOCALINSTANCEPATH|INSTANCENAME)>
(deftag value.reference () (classpath localclasspath classname instancepath localinstancepath instancename)
  (cond
    (classpath classpath)
    (localclasspath localclasspath)
    (classname classname)
    (instancepath instancepath)
    (localinstancepath localinstancepath)
    (instancename instancename)
    (t (error "No tag provided"))))

;;<!ELEMENT VALUE.REFARRAY (VALUE.REFERENCE*)>
(deftag value.refarray () (value.reference*)
  value.reference)

;;<!ELEMENT VALUE.OBJECT (CLASS|INSTANCE)>
(deftag value.object () (class instance)
  (cond
    (class class)
    (instance instance)
    (t (error "No tag"))))

;;<!ELEMENT VALUE.NAMEDINSTANCE (INSTANCENAME,INSTANCE)>
(deftag value.namedinstance () (instancename instance)
  (declare (ignore instancename))
  instance)

;;<!ELEMENT VALUE.NAMEDOBJECT (CLASS|(INSTANCENAME,INSTANCE))>
(deftag value.namedobject () (class instancename instance)
  (declare (ignore instancename))
  (cond
    (class class)
    (instance instance)
    (t (error "No tag"))))

;;<!ELEMENT VALUE.OBJECTWITHPATH ((CLASSPATH,CLASS)|(INSTANCEPATH,INSTANCE))>
(deftag value.objectwithpath () (classpath class instancepath instance)
  (declare (ignore classpath instancepath))
  (cond
    (class class)
    (instance instance)
    (t (error "No tag"))))

;;<!ELEMENT VALUE.OBJECTWITHLOCALPATH ((LOCALCLASSPATH,CLASS)|(LOCALINSTANCEPATH,INSTANCE))>
(deftag value.objectwithlocalpath () (localclasspath class localinstancepath instance)
  (declare (ignore localclasspath localinstancepath))
  (cond
    (class class)
    (instance instance)
    (t (error "No tag"))))

;;<!ELEMENT VALUE.NULL EMPTY>
(deftag value.null () empty
  (declare (ignore empty))
  nil)

;;<!ELEMENT NAMESPACEPATH (HOST,LOCALNAMESPACEPATH)> 
(deftag namespacepath () (host localnamespacepath)
  (make-namespace-path :host host 
                       :namespace-list localnamespacepath))

;;<!ELEMENT LOCALNAMESPACEPATH (NAMESPACE+)> 
(deftag localnamespacepath () (namespace*)
  namespace)

;;<!ELEMENT HOST (#PCDATA)> 
(deftag host () data
  data)

;;<!ELEMENT NAMESPACE EMPTY> 
;;<!ATTLIST NAMESPACE
;;    %CIMName;> 
(deftag namespace (name) empty
  (declare (ignore empty))
  (make-cim-namespace :name name))

;;<!ELEMENT CLASSPATH (NAMESPACEPATH,CLASSNAME)>
(deftag classpath () (namespacepath classname)
  (make-cim-reference :classname classname
                      :namespace namespacepath))

;;<!ELEMENT LOCALCLASSPATH (LOCALNAMESPACEPATH, CLASSNAME)>
(deftag localclasspath () (localnamespacepath classname)
  (make-cim-reference :classname classname
                      :namespace localnamespacepath))

;;<!ELEMENT CLASSNAME EMPTY>
;;<!ATTLIST CLASSNAME
;;    %CIMName;>
(deftag classname (name) empty
  (declare (ignore empty))
  name)

;;<!ELEMENT INSTANCEPATH (NAMESPACEPATH,INSTANCENAME)>
(deftag instancepath () (namespacepath instancename)
  (setf (cim-reference-namespace instancename)
        namespacepath)
  instancename)

;;<!ELEMENT LOCALINSTANCEPATH (LOCALNAMESPACEPATH,INSTANCENAME)>
(deftag localinstancepath () (localnamespacepath instancename)
  (setf (cim-reference-namespace instancename)
        localnamespacepath)
  instancename)

;;<!ELEMENT INSTANCENAME (KEYBINDING*|KEYVALUE?|VALUE.REFERENCE?)>
;;<!ATTLIST INSTANCENAME
;;    %ClassName;>
(deftag instancename (classname) (keybinding* keyvalue value.reference)
  (make-cim-reference
   :classname classname
   :keyslots 
   (cond
     (keybinding keybinding)
     (keyvalue (list keyvalue))
     (value.reference (list value.reference)))))

;;<!ELEMENT OBJECTPATH (INSTANCEPATH|CLASSPATH)>
(deftag objectpath () (instancepath classpath)
  (or instancepath classpath))

;;<!ELEMENT KEYBINDING (KEYVALUE|VALUE.REFERENCE)>
;;<!ATTLIST KEYBINDING
;;    %CIMName;>
(deftag keybinding (name) (keyvalue value.reference)
  (list name 
        (if value.reference 
            value.reference
            (first keyvalue))
        (if value.reference
            (cim-reference-classname value.reference)
            (second keyvalue))))
            
        
;;<!ELEMENT KEYVALUE (#PCDATA)>
;;<!ATTLIST KEYVALUE
;;     VALUETYPE    (string|boolean|numeric)  "string"
;;     %CIMType;    #IMPLIED>
(deftag keyvalue (valuetype) data
  (list data valuetype))

;;<!ELEMENT CLASS (QUALIFIER*,(PROPERTY|PROPERTY.ARRAY|PROPERTY.REFERENCE)*,METHOD*)>
;;<!ATTLIST CLASS 
;;    %CIMName;
;;    %SuperClass;>
(deftag class (name superclass) (qualifier* property* property.array* property.reference* method*)
  (declare (ignore superclass))
  (make-instance 'cim-class 
                 :qualifiers qualifier
                 :methods method
                 :slots (append property property.array property.reference)
                 :cim-name name))
                 

;;<!ELEMENT INSTANCE (QUALIFIER*,(PROPERTY|PROPERTY.ARRAY|PROPERTY.REFERENCE)*)>
;;<!ATTLIST INSTANCE
;;         %ClassName;
;;         xml:lang   NMTOKEN  #IMPLIED>
(deftag instance (classname) (property* property.array* property.reference*)
  (make-cim-instance 
   :classname classname
   :slots (append property property.array property.reference)))

;;<!ELEMENT QUALIFIER ((VALUE|VALUE.ARRAY)?)>
;;<!ATTLIST QUALIFIER 
;;     %CIMName;
;;     %CIMType;               #REQUIRED 
;;     %Propagated;
;;     %QualifierFlavor;
;;     xml:lang  NMTOKEN  #IMPLIED>
(deftag qualifier (name type) (value value.array)
  (cons
   (make-cim-qualifier :name name
                       :type type)
   (or value value.array)))
                      
;;<!ELEMENT PROPERTY (QUALIFIER*,VALUE?)>
;;<!ATTLIST PROPERTY 
;;     %CIMName;
;;     %CIMType;           #REQUIRED 
;;     %ClassOrigin;
;;     %Propagated;
;;     %EmbeddedObject;
;;     xml:lang   NMTOKEN  #IMPLIED>
(deftag property (name type) (value)
  (list name type value))
			 
;;<!ELEMENT PROPERTY.ARRAY (QUALIFIER*,VALUE.ARRAY?)>
;;<!ATTLIST PROPERTY.ARRAY 
;;    %CIMName;
;;    %CIMType;           #REQUIRED 
;;    %ArraySize;
;;    %ClassOrigin;
;;    %Propagated;
;;    %EmbeddedObject;
;;    xml:lang   NMTOKEN  #IMPLIED>
(deftag property.array (name type) (value.array)
  (list name type value.array))

;;<!ELEMENT PROPERTY.REFERENCE (QUALIFIER*,VALUE.REFERENCE?)>
;;<!ATTLIST PROPERTY.REFERENCE
;;     %CIMName;
;;     %ReferenceClass;
;;     %ClassOrigin;
;;     %Propagated;>
(deftag property.reference (name referenceclass) (value.reference)
  (list name referenceclass value.reference))

;;<!ELEMENT METHOD (QUALIFIER*,(PARAMETER|PARAMETER.REFERENCE|PARAMETER.ARRAY|PARAMETER.REFARRAY)*)>
;;<!ATTLIST METHOD 
;;     %CIMName;
;;     %CIMType;          #IMPLIED 
;;     %ClassOrigin;
;;     %Propagated;>
(deftag method (name type) (qualifier* parameter* parameter.reference* parameter.array* parameter.refarray*)  
  (make-cim-method 
   :name name
   :return-type type
   :in-params (append parameter parameter.reference parameter.array parameter.refarray)
   :qualifiers qualifier))

;;<!ELEMENT PARAMETER (QUALIFIER*)>
;;<!ATTLIST PARAMETER 
;;     %CIMName;
;;     %CIMType;      #REQUIRED>
(deftag parameter (name type) (qualifier*)
  (make-cim-parameter :name name
                      :type type
                      :qualifiers qualifier))

;;<!ELEMENT PARAMETER.REFERENCE (QUALIFIER*)>
;;<!ATTLIST PARAMETER.REFERENCE
;;     %CIMName;
;;     %ReferenceClass;>
(deftag parameter.reference (name referenceclass) (qualifier*)
  (make-cim-parameter :name name
                      :type referenceclass
                      :qualifiers qualifier))

;;<!ELEMENT PARAMETER.ARRAY (QUALIFIER*)>
;;<!ATTLIST PARAMETER.ARRAY
;;     %CIMName;
;;     %CIMType;           #REQUIRED
;;     %ArraySize;>
(deftag parameter.array (name type) (qualifier*)
  (make-cim-parameter :name name
                      :type type
                      :qualifiers qualifier))

;;<!ELEMENT PARAMETER.REFARRAY (QUALIFIER*)>
;;<!ATTLIST PARAMETER.REFARRAY
;;     %CIMName;
;;     %ReferenceClass;
;;     %ArraySize;>
(deftag parameter.refarray (name referenceclass) (qualifier*)
  (make-cim-parameter :name name
                      :type referenceclass
                      :qualifiers qualifier))

;;<!ELEMENT MESSAGE (SIMPLEREQ|MULTIREQ|SIMPLERSP|MULTIRSP|
;;          SIMPLEEXPREQ|MULTIEXPREQ|SIMPLEEXPRSP|MULTIEXPRSP)>
;;<!ATTLIST MESSAGE
;;         ID             CDATA     #REQUIRED
;;         PROTOCOLVERSION CDATA     #REQUIRED>
(deftag message (id) (simplereq multireq simplersp multirsp simpleexpreq multiexpreq simpleexprsp multiexprsp)
  (make-cim-message :id (parse-integer id)
                    :request (or simplereq multireq)
                    :response (or simplersp multirsp)
                    :exp-request (or simpleexpreq multiexpreq)
                    :exp-response (or simpleexprsp multiexprsp)))

;;<!ELEMENT MULTIREQ (SIMPLEREQ,SIMPLEREQ+)>
(deftag multireq () (simplereq*)
  simplereq)

;;<!ELEMENT SIMPLEREQ (METHODCALL|IMETHODCALL)>
(deftag simplereq () (methodcall imethodcall)
  (or methodcall imethodcall))
   
;;<!ELEMENT METHODCALL ((LOCALCLASSPATH|LOCALINSTANCEPATH),PARAMVALUE*)>
;;<!ATTLIST METHODCALL
;;     %CIMName;>
(deftag methodcall (name) (localclasspath localinstancepath paramvalue*)
  (make-cim-request 
   :method-name name
   :namespace-path (or localclasspath localinstancepath)
   :arguments paramvalue))

;;<!ELEMENT PARAMVALUE (VALUE|VALUE.REFERENCE|VALUE.ARRAY|VALUE.REFARRAY)?>
;;<!ATTLIST PARAMVALUE
;;     %CIMName;
;;     %ParamType;    #IMPLIED
;;     %EmbeddedObject;>
(deftag paramvalue (name paramtype) (value value.reference value.array value.refarray)
  (list name (or value value.reference value.array value.refarray) paramtype))

;;<!ELEMENT IMETHODCALL (LOCALNAMESPACEPATH,IPARAMVALUE*)>
;;<!ATTLIST IMETHODCALL
;;     %CIMName;>
(deftag imethodcall (name) (localnamespacepath iparamvalue*)
  (make-cim-request 
   :method-name name
   :intrinsic-p t
   :namespace-path localnamespacepath
   :arguments iparamvalue))

;;<!ELEMENT IPARAMVALUE (VALUE|VALUE.ARRAY|VALUE.REFERENCE|CLASSNAME|INSTANCENAME|QUALIFIER.DECLARATION|
;;              CLASS|INSTANCE|VALUE.NAMEDINSTANCE)?>
;;<!ATTLIST IPARAMVALUE
;;     %CIMName;>
(deftag iparamvalue (name) (value value.array value.reference classname instancename qualifier.declaration class instance value.namedinstance)
  (list name
        (or value value.array value.reference 
            classname class 
            qualifier.declaration 
            instance instancename value.namedinstance)))

;; <!ELEMENT MULTIRSP (SIMPLERSP,SIMPLERSP+)>
(deftag multirsp () (simplersp*)
  simplersp)

;;<!ELEMENT SIMPLERSP (METHODRESPONSE|IMETHODRESPONSE)>
(deftag simplersp () (methodresponse imethodresponse)
  (or methodresponse imethodresponse))

;;<!ELEMENT METHODRESPONSE (ERROR|(RETURNVALUE?,PARAMVALUE*))>
;;<!ATTLIST METHODRESPONSE
;;           %CIMName;>
(deftag methodresponse (name) (returnvalue paramvalue* error)
  (declare (ignore error))
  (make-cim-response 
   :method-name name
   :return-value returnvalue
   :out-parameters paramvalue))

;;<!ELEMENT IMETHODRESPONSE (ERROR|IRETURNVALUE?)>
;;<!ATTLIST IMETHODRESPONSE
;;           %CIMName;>
(deftag imethodresponse (name) (ireturnvalue error)
  (declare (ignore error))
  (make-cim-response 
   :method-name name
   :intrinsic-p t
   :return-value ireturnvalue))

;;<!ELEMENT ERROR (INSTANCE*)
;;<!ATTLIST ERROR
;;              CODE        CDATA   #REQUIRED
;;              DESCRIPTION CDATA   #IMPLIED>
(deftag error (code description) (instance*)
  (declare (ignore instance))
  (cim-error code description))

;;<!ELEMENT RETURNVALUE (VALUE|VALUE.REFERENCE)>
;;<!ATTLIST RETURNVALUE
;;         %EmbeddedObject;
;;     %ParamType;     #IMPLIED>
(deftag returnvalue () (value value.reference)
  (or value value.reference))

;;<!ELEMENT IRETURNVALUE (CLASSNAME*|INSTANCENAME*|VALUE*|VALUE.OBJECTWITHPATH*|VALUE.OBJECTWITHLOCALPATH*
;;              VALUE.OBJECT*|OBJECTPATH*|QUALIFIER.DECLARATION*|VALUE.ARRAY?|VALUE.REFERENCE?|
;;               CLASS*|INSTANCE*|VALUE.NAMEDINSTANCE*)>
(deftag ireturnvalue () (classname* instancename* value* value.objectwithpath* value.objectwithlocalpath* 
                                    value.object* objectpath* qualifier.declaration* value.array value.reference
                                    class* instance* value.namedinstance*)
  (cond
    (classname (list classname :classname))
    (instancename (list instancename :instancename))
    (value (list value :value))
    (value.objectwithpath (list value :value.objectwithpath))
    (value.objectwithlocalpath (list value.objectwithlocalpath :value.objectwithlocalpath))
    (value.object (list value.object :value.object))
    (objectpath (list objectpath :objectpath))
    (qualifier.declaration (list qualifier.declaration :qualifier.declaration))
    (value.array (list value.array :value.array))
    (value.reference (list value.reference :value.reference))
    (class (list class :class))
    (instance (list instance :instance))
    (value.namedinstance (list value.namedinstance :value.namedinstance))
    (t (error "No Tag?"))))
                  
;;<!ELEMENT MULTIEXPREQ (SIMPLEEXPREQ,SIMPLEEXPREQ+)>
(deftag multiexpreq () (simpleexpreq*)
  simpleexpreq)

;;<!ELEMENT SIMPLEEXPREQ (EXPMETHODCALL)>
(deftag simpleexpreq () (expmethodcall)
  expmethodcall)
   
;;<!ELEMENT EXPMETHODCALL (EXPPARAMVALUE*)>
;;<!ATTLIST EXPMETHODCALL 
;;    %CIMName;>
(deftag expmethodcall (name) (expparamvalue*)
  (make-cim-request 
   :method-name name
   :intrinsic-p t
   :arguments expparamvalue))

;;<!ELEMENT MULTIEXPRSP (SIMPLEEXPRSP,SIMPLEEXPRSP+)>
(deftag multiexprsp () (simpleexprsp*)
  simpleexprsp)

;;<!ELEMENT SIMPLEEXPRSP (EXPMETHODRESPONSE)>
(deftag simpleexprsp () (expmethodresponse)
  expmethodresponse)

;;<!ELEMENT EXPMETHODRESPONSE (ERROR|IRETURNVALUE?)>
;;<!ATTLIST EXPMETHODRESPONSE
;;      %CIMName;>
(deftag expmethodresponse (name) (ireturnvalue error)
  (declare (ignore error))
  (make-cim-response 
   :method-name name
   :intrinsic-p t
   :return-value ireturnvalue))

;;<!ELEMENT EXPPARAMVALUE (INSTANCE?)>
;;<!ATTLIST EXPPARAMVALUE 
;;    %CIMName;>
(deftag expparamvalue (name) (instance)
  (list name instance))
