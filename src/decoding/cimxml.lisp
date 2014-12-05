

(in-package #:climbe.decoding)

(defun decode-xml-octets (octets)
  (cxml:parse-octets octets
		     (cxml-xmls:make-xmls-builder)))

(defun decode-xml (string)
  "Decode a CIMXML encoded string into nested lists. Note that because we need to already have the entire xml in the string this doesn't scale well to large content. "
  (declare (type string string))
  (decode-xml-octets
   (babel:string-to-octets 
    (remove-if (lambda (char)
                 (member char '(#\newline #\return) 
                         :test #'char=))
               string))))

(defun decode-xml-stream (stream)
  (cxml:parse-stream stream (cxml-xmls:make-xmls-builder)))

(defun decode-xml-file (path)
  "Parse an entire xml file. Because it has to load the whole file first this does not scale well - do not use it to load large schema definitions. "
  (with-open-file (f path :direction :input :element-type '(unsigned-byte 8))
    (cxml:parse-stream f (cxml-xmls:make-xmls-builder))))



(defun decode-cimxml (input)
  "Decode some INPUT. It can be either a string or a stream."
  (if (stringp input)
      (decode-cimxml-cim (decode-xml input))
      (decode-cimxml-cim (decode-xml-stream input))))



(defun decode-boolean (string)
  "Returns T is the string is the literal value \"true\" otherwise nil."
  (declare (type string string))
  (string-equal string "true"))

(defconstant* +cim-type-strings+ 
    '(("boolean" boolean)
      ("sint8" sint8)
      ("sint16" sint16)
      ("sint32" sint32)
      ("sint64" sint64)
      ("uint8" uint8)
      ("uint16" uint16)
      ("uint32" uint32)
      ("uint64" uint64)
      ("char16" character)
      ("string" string)
      ("datetime" datetime)
      ("real32" real32)
      ("real64" real64)))

(defun decode-cim-type (string)
  (let ((type (second (find string +cim-type-strings+ 
			    :test #'string-equal
			    :key #'first))))
    (if type
	type
	(error "Type ~S not found" string))))


;; ensure the prefix is set
(eval-when (:compile-toplevel :load-toplevel :execute)
  (setf *tag-prefix* "CIMXML"))



;;<!ELEMENT CIM (MESSAGE|DECLARATION)>
;;<!ATTLIST CIM
;;         CIMVERSION CDATA #REQUIRED 
;;         DTDVERSION CDATA #REQUIRED>
(deftag cim () (message declaration)
  (cond
    (message message)     
    (declaration declaration)
    (t (error "No content"))))

;;<!ELEMENT DECLARATION  (DECLGROUP|DECLGROUP.WITHNAME|DECLGROUP.WITHPATH)+>
(deftag declaration () (declgroup* declgroup.withname* declgroup.withpath*)
  (append declgroup
	  declgroup.withname
	  declgroup.withpath))

;;<!ELEMENT DECLGROUP  ((LOCALNAMESPACEPATH|NAMESPACEPATH)?,QUALIFIER.DECLARATION*,VALUE.OBJECT*)>
(deftag declgroup () (localnamespacepath namespacepath qualifier.declaration* value.object*)
  (make-cim-declaration :namespace (or localnamespacepath namespacepath)
			:qualifiers qualifier.declaration
			:classes value.object))

;;<!ELEMENT DECLGROUP.WITHNAME  ((LOCALNAMESPACEPATH|NAMESPACEPATH)?,QUALIFIER.DECLARATION*,VALUE.NAMEDOBJECT*)>
(deftag declgroup.withname () (localnamespacepath namespacepath qualifier.declaration* value.namedobject*)
  (let ((namespace (or localnamespacepath namespacepath)))
    (make-cim-declaration :namespace namespace
			  :qualifiers qualifier.declaration
			  :classes value.namedobject)))

;;<!ELEMENT DECLGROUP.WITHPATH  (VALUE.OBJECTWITHPATH|VALUE.OBJECTWITHLOCALPATH)*>
(deftag declgroup.withpath () (value.objectwithpath* value.objectwithlocalpath*)
  (make-cim-declaration :classes (append value.objectwithpath value.objectwithlocalpath)))

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
          (list class association reference property method parameter indication)
	  (list :class :association :reference :property :method :parameter :indication)))
    
;;<!ELEMENT VALUE (#PCDATA)>
(deftag value () data
  (first data))

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
(deftag localnamespacepath () (namespace+)
  (make-namespace-path :namespace-list namespace))

;;<!ELEMENT HOST (#PCDATA)> 
(deftag host () data
  (first data))

;;<!ELEMENT NAMESPACE EMPTY> 
;;<!ATTLIST NAMESPACE
;;    %CIMName;> 
(deftag namespace (name) empty
  (declare (ignore empty))
  (make-cim-namespace :name name))

;;<!ELEMENT CLASSPATH (NAMESPACEPATH,CLASSNAME)>
(deftag classpath () (namespacepath classname)
  (make-cim-reference :classname classname
                      :namespace (namespace-path-string namespacepath)))

;;<!ELEMENT LOCALCLASSPATH (LOCALNAMESPACEPATH, CLASSNAME)>
(deftag localclasspath () (localnamespacepath classname)
  (make-cim-reference :classname classname
                      :namespace (namespace-path-string localnamespacepath)))

;;<!ELEMENT CLASSNAME EMPTY>
;;<!ATTLIST CLASSNAME
;;    %CIMName;>
(deftag classname (name) empty
  (declare (ignore empty))
  name)

;;<!ELEMENT INSTANCEPATH (NAMESPACEPATH,INSTANCENAME)>
(deftag instancepath () (namespacepath instancename)
  (setf (cim-reference-namespace instancename)
        (namespace-path-string namespacepath))
  instancename)

;;<!ELEMENT LOCALINSTANCEPATH (LOCALNAMESPACEPATH,INSTANCENAME)>
(deftag localinstancepath () (localnamespacepath instancename)
  (setf (cim-reference-namespace instancename)
        (namespace-path-string localnamespacepath))
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
  (let ((str (first data))
        (type
         (cond 
           ((string-equal valuetype "boolean") 'boolean)
           ((string-equal valuetype "numeric") 'number)
           ((string-equal valuetype "string") 'string)
           (t (error "Invalid VALUETYPE ~S" valuetype)))))            
    (list (ecase type
            (boolean (decode-boolean str))
            (number 
             ;; we cannot use read-from-string here for security reasons i.e. a #. code injection
             (parse-number:parse-number str))
            (string str))
          type)))

;;<!ELEMENT CLASS (QUALIFIER*,(PROPERTY|PROPERTY.ARRAY|PROPERTY.REFERENCE)*,METHOD*)>
;;<!ATTLIST CLASS 
;;    %CIMName;
;;    %SuperClass;>
(deftag class (name superclass) (qualifier* property* property.array* property.reference* method*)
  (make-cim-class
   :name name
   :superclass (when (and superclass (not (string= superclass "")))
                 superclass)
   :qualifiers qualifier
   :methods method
   :slots 
   (mapcar (lambda (slot)
	     (destructuring-bind (name value type qualifiers &key origin &allow-other-keys) slot
	       (make-cim-slot :name name
			      :type type
			      :default value
			      :qualifiers qualifiers
			      :origin origin)))
	   (append property property.array property.reference))))
                 

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
   (or (find-qualifier name)
	   (make-cim-qualifier :name name
						   :type type))
   (or value value.array)))
                      
;;<!ELEMENT PROPERTY (QUALIFIER*,VALUE?)>
;;<!ATTLIST PROPERTY 
;;     %CIMName;
;;     %CIMType;           #REQUIRED 
;;     %ClassOrigin;
;;     %Propagated;
;;     %EmbeddedObject;
;;     xml:lang   NMTOKEN  #IMPLIED>
(deftag property (name type classorigin) (qualifier* value)
  (list name value (decode-cim-type type) qualifier :origin classorigin))
			 
;;<!ELEMENT PROPERTY.ARRAY (QUALIFIER*,VALUE.ARRAY?)>
;;<!ATTLIST PROPERTY.ARRAY 
;;    %CIMName;
;;    %CIMType;           #REQUIRED 
;;    %ArraySize;
;;    %ClassOrigin;
;;    %Propagated;
;;    %EmbeddedObject;
;;    xml:lang   NMTOKEN  #IMPLIED>
(deftag property.array (name type classorigin) (qualifier* value.array)
  (list name 
	value.array 
	(list 'array (decode-cim-type type))
    qualifier
    :origin classorigin))

;;<!ELEMENT PROPERTY.REFERENCE (QUALIFIER*,VALUE.REFERENCE?)>
;;<!ATTLIST PROPERTY.REFERENCE
;;     %CIMName;
;;     %ReferenceClass;
;;     %ClassOrigin;
;;     %Propagated;>
(deftag property.reference (name referenceclass classorigin) (qualifier* value.reference)
  (list name referenceclass value.reference qualifier :origin classorigin))

;;<!ELEMENT METHOD (QUALIFIER*,(PARAMETER|PARAMETER.REFERENCE|PARAMETER.ARRAY|PARAMETER.REFARRAY)*)>
;;<!ATTLIST METHOD 
;;     %CIMName;
;;     %CIMType;          #IMPLIED 
;;     %ClassOrigin;
;;     %Propagated;>
(deftag method (name type classorigin) (qualifier* parameter* parameter.reference* parameter.array* parameter.refarray*)  
  (make-cim-method 
   :name name
   :return-type (if type (decode-cim-type type) (error "no return type specified"))
   :in-params (append parameter parameter.reference parameter.array parameter.refarray)
   :qualifiers qualifier
   :origin classorigin))

;;<!ELEMENT PARAMETER (QUALIFIER*)>
;;<!ATTLIST PARAMETER 
;;     %CIMName;
;;     %CIMType;      #REQUIRED>
(deftag parameter (name type) (qualifier*)
  (make-cim-parameter :name name
		      :type (decode-cim-type type)
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
		      :type (list 'array (decode-cim-type type))
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
  (make-cim-message :id id ;; message ID is not necessarily an integer
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
(deftag paramvalue (name paramtype) (value value.reference value.array value.refarray?)
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
(deftag iparamvalue (name) (value value.array value.reference
				   classname class
				   qualifier.declaration
				   instance instancename value.namedinstance)
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
  (if error
      error
      (make-cim-response 
       :method-name name
       :return-value returnvalue
       :out-parameters paramvalue)))
  
;;<!ELEMENT IMETHODRESPONSE (ERROR|IRETURNVALUE?)>
;;<!ATTLIST IMETHODRESPONSE
;;           %CIMName;>
(deftag imethodresponse (name) (ireturnvalue error)
  (if error
      error
      (make-cim-response 
       :method-name name
       :intrinsic-p t
       :return-value ireturnvalue)))

;;<!ELEMENT ERROR (INSTANCE*)
;;<!ATTLIST ERROR
;;              CODE        CDATA   #REQUIRED
;;              DESCRIPTION CDATA   #IMPLIED>
(deftag error (code description) (instance*)
  (declare (ignore instance))
  ;; we only want to make an error condition object,
  ;; not actually signal the error. That should be done higher up?
  (make-cim-error (parse-integer code) description))

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
    (t (list nil :value))))
                  
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
