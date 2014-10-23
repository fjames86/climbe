
(in-package :climbe)

;; http://www.dmtf.org/sites/default/files/standards/documents/DSP0200_1.4.0.pdf
;; http://www.dmtf.org/sites/default/files/standards/documents/DSP200.html

(defconstant* +cim-version+ "2.0")
(defconstant* +dtd-version+ "2.0")
(defconstant* +protocol-version+ "1.0")

(defun eformat (format-string &rest args)
  "Encoding format function."
  (declare (string format-string))
  (apply #'format t format-string args))

(defun encode-cimxml-boolean (boolean)
  "CIM string for a bool"
  (if boolean
      "true"
      "false"))

(defun encode-cimxml-type (type)
  "Returns the CIM string representation of the Lisp type."
  (string-downcase (string type)))

;;<!ELEMENT CIM (MESSAGE|DECLARATION)>
;;<!ATTLIST CIM
;;         CIMVERSION CDATA #REQUIRED 
;;         DTDVERSION CDATA #REQUIRED>
(defun encode-cimxml-cim (message)  
  (eformat "<?xml version=\"1.0\" encoding=\"utf-8\" ?>~%")
  (eformat "<CIM CIMVERSION=\"~A\" DTDVERSION=\"~A\">~%" +cim-version+ +dtd-version+)
  (encode-cimxml-message message)
  (eformat "</CIM>"))

;;<!ELEMENT DECLARATION  (DECLGROUP|DECLGROUP.WITHNAME|DECLGROUP.WITHPATH)+>

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
(defun encode-cimxml-qualifier.declaration (qualifier)
  (declare (type cim-qualifier qualifier))
  (let ((type (cim-qualifier-type qualifier)))
    (eformat "<QUALIFIER.DECLARATION NAME=\"~A\" Type=\"~A\"/>~%"
	     (cim-name qualifier)
	     type)
    (encode-cimxml-scope (cim-qualifier-scope qualifier))
    (let ((default (cim-qualifier-default qualifier)))
      (when default
	(cond
	  ((and (listp type) (eq (car type) 'array))
	   (encode-cimxml-value.array default))
	  ((eq type 'boolean)
	   (encode-cimxml-value (encode-cimxml-boolean default)))
	  (t
	   (encode-cimxml-value default)))))
    (eformat "</QUALIFIER.DECLARATION>~%")))
	
;;<!ELEMENT SCOPE EMPTY>
;;<!ATTLIST SCOPE 
;;         CLASS        (true|false)      "false"
;;         ASSOCIATION  (true|false)      "false"
;;         REFERENCE    (true|false)      "false"
;;         PROPERTY     (true|false)      "false"
;;         METHOD       (true|false)      "false"
;;         PARAMETER    (true|false)      "false"
;;         INDICATION   (true|false)      "false">
(defun encode-cimxml-scope (scope-list)
  (apply #'eformat "<SCOPE CLASS=\"~A\" ASSOCIATION=\"~A\" REFERENCE=\"~A\" PROPERTY=\"~A\" METHOD=\"~A\" PARAMETER=\"~A\" INDICATION=\"~A\" />~%"
	 (mapcar #'encode-cimxml-boolean
		 (mapcar (lambda (scope)
			   (member scope scope-list))
			 '(:class :association :reference :property :method :parameter :indication)))))

;;<!ELEMENT VALUE (#PCDATA)>
(defun encode-cimxml-value (value)
  (eformat "<VALUE>~A</VALUE>~%" value))

;;<!ELEMENT VALUE.ARRAY (VALUE*)>
(defun encode-cimxml-value.array (value-list)
  (eformat "<VALUE.ARRAY>~%")
  (dolist (value value-list)
    (encode-cimxml-value value))
  (eformat "</VALUE.ARRAY>~%"))

;;<!ELEMENT VALUE.REFERENCE (CLASSPATH|LOCALCLASSPATH|CLASSNAME|INSTANCEPATH|LOCALINSTANCEPATH|INSTANCENAME)>
(defun encode-cimxml-value.reference (reference)
  (let ((namespace (cim-reference-namespace reference))
		(classname (cim-reference-classname reference))
		(keyslots (cim-reference-keyslots reference)))
	(cond
	  ((and namespace classname (null keyslots))
	   ;; classpath/localclasspath
	   nil)
	  ((and (null namespace) classname (null keyslots))
	   ;; classname
	   nil)
	  ((and namespace classname keyslots)
	   ;; instancepath
	   nil)
	  ((and (null namespace) classname keyslots)
	   ;; instancename
	   nil)
	  (t ;; wtf to do here?
	   nil))))

;;<!ELEMENT VALUE.REFARRAY (VALUE.REFERENCE*)>
(defun encode-cimxml-value.refarray (value-list)
  (eformat "<VALUE.REFERENCE>~%")
  (dolist (value value-list)
	(encode-cimxml-value.reference value))
  (eformat "</VALUE.REFERENCE>~%"))

;;<!ELEMENT VALUE.OBJECT (CLASS|INSTANCE)>
(defun encode-cimxml-value.object (object)
  (eformat "<VALUE.OBJECT>~%")
  (if (typep object 'cim-class)
	  (encode-cimxml-class object)
	  (encode-cimxml-instance object))
  (eformat "</VALUE.OBJECT>~%"))

;;<!ELEMENT VALUE.NAMEDINSTANCE (INSTANCENAME,INSTANCE)>
(defun encode-cimxml-value.namedinstance (instance)
  (eformat "<VALUE.NAMEDINSTANCE>~%")
  (if (cim-instance-p instance)
	  (encode-cimxml-instancename (cim-instance-classname instance)
								  (cim-instance-slots instance))
	  (let ((class (class-of instance)))
		(encode-cimxml-instancename (cim-name class)
									(instance-key-slots instance))))
  (encode-cimxml-instance instance)
  (eformat "</VALUE.NAMEDINSTANCE>~%"))

;;<!ELEMENT VALUE.NAMEDOBJECT (CLASS|(INSTANCENAME,INSTANCE))>
(defun encode-cimxml-value.namedobject (object)
  (eformat "<VALUE.NAMEDOBJECT>~%")
  (cond
	((typep object 'cim-class)
	 (encode-cimxml-class object))
	(t
	 (let ((class (class-of object)))
	   (encode-cimxml-instancename (cim-name class) (instance-slots object))
	   (encode-cimxml-instance object))))
  (eformat "</VALUE.NAMEDOBJECT>~%"))

;;<!ELEMENT VALUE.OBJECTWITHPATH ((CLASSPATH,CLASS)|(INSTANCEPATH,INSTANCE))>
(defun encode-cimxml-value.objectwithpath (object namespace-path)
  (eformat "<VALUE.OBJECTWITHPATH>~%")
  (cond
	((typep object 'cim-class)
	 (encode-cimxml-classpath namespace-path (cim-name object))
	 (encode-cimxml-class object))
	(t
	 (let ((class (class-of object)))
	   (encode-cimxml-instancepath namespace-path (cim-name class) (instance-slots object))
	   (encode-cimxml-instance object))))
  (eformat "</VALUE.OBJECTWITHPATH>~%"))
  
;;<!ELEMENT VALUE.OBJECTWITHLOCALPATH ((LOCALCLASSPATH,CLASS)|(LOCALINSTANCEPATH,INSTANCE))>
(defun encode-cimxml-value.objectwithlocalpath (object namespace-list)
  (eformat "<VALUE.OBJECTWITHLOCALPATH>~%")
  (cond
	((typep object 'cim-class)
	 (encode-cimxml-localclasspath namespace-list (cim-name object))
	 (encode-cimxml-class object))
	(t
	 (let ((class (class-of object)))
	   (encode-cimxml-localinstancepath namespace-list (cim-name class) (instance-slots object))
	   (encode-cimxml-instance object))))
  (eformat "</VALUE.OBJECTWITHLOCALPATH>~%"))

;;<!ELEMENT VALUE.NULL EMPTY>
(defun encode-cimxml-null ()
  (eformat "<VALUE.NULL />~%"))

;;<!ELEMENT NAMESPACEPATH (HOST,LOCALNAMESPACEPATH)> 
(defun encode-cimxml-namespacepath (namespace-path)
  (declare (type namespace-path namespace-path))
  (eformat "<NAMESPACEPATH>~%")
  (encode-cimxml-host (namespace-path-host namespace-path))
  (encode-cimxml-localnamespacepath (namespace-path-namespace-list namespace-path))
  (eformat "</NAMESPACEPATH>~%"))

;;<!ELEMENT LOCALNAMESPACEPATH (NAMESPACE+)> 
(defun encode-cimxml-localnamespacepath (namespace-list)
  (eformat "<LOCALNAMESPACEPATH>~%")
  (dolist (namespace namespace-list)
    (encode-cimxml-namespace namespace))
  (eformat "</LOCALNAMESPACEPATH>~%"))

;;<!ELEMENT HOST (#PCDATA)> 
(defun encode-cimxml-host (host)
  (eformat "<HOST>~A</HOST>~%" host))

;;<!ELEMENT NAMESPACE EMPTY> 
;;<!ATTLIST NAMESPACE
;;    %CIMName;> 
(defun encode-cimxml-namespace (namespace)
  (declare (string namespace))
  (eformat "<NAMESPACE NAME=\"~A\" />~%" namespace))

;;<!ELEMENT CLASSPATH (NAMESPACEPATH,CLASSNAME)>
(defun encode-cimxml-classpath (namespace-path class-name)
  (eformat "<CLASSPATH>~%")
  (encode-cimxml-namespacepath namespace-path)
  (encode-cimxml-classname class-name)
  (eformat "</CLASSPATH>~%"))

;;<!ELEMENT LOCALCLASSPATH (LOCALNAMESPACEPATH, CLASSNAME)>
(defun encode-cimxml-localclasspath (namespace-list class-name)
  (eformat "<LOCALCLASSPATH>~%")
  (encode-cimxml-localnamespacepath namespace-list)
  (encode-cimxml-classname class-name)
  (eformat "</LOCALCLASSPATH>~%"))

;;<!ELEMENT CLASSNAME EMPTY>
;;<!ATTLIST CLASSNAME
;;    %CIMName;>
(defun encode-cimxml-classname (class-name)
  (eformat "<CLASSNAME NAME=\"~A\" />~%" class-name))

;;<!ELEMENT INSTANCEPATH (NAMESPACEPATH,INSTANCENAME)>
(defun encode-cimxml-instancepath (namespace-path class-name key-slots)
  (eformat "<INSTANCEPATH>~%")
  (encode-cimxml-namespacepath namespace-path)
  (encode-cimxml-instancename class-name key-slots)
  (eformat "</INSTANCEPATH>~%"))

;;<!ELEMENT LOCALINSTANCEPATH (LOCALNAMESPACEPATH,INSTANCENAME)>
(defun encode-cimxml-localinstancepath (namespace-list class-name key-slots)
  (eformat "<LOCALINSTANCEPATH>~%")
  (encode-cimxml-localnamespacepath namespace-list)
  (encode-cimxml-instancename class-name key-slots)
  (eformat "</LOCALINSTANCEPATH>~%"))

;;<!ELEMENT INSTANCENAME (KEYBINDING*|KEYVALUE?|VALUE.REFERENCE?)>
;;<!ATTLIST INSTANCENAME
;;    %ClassName;>
(defun encode-cimxml-instancename (class-name key-slots)
  (eformat "<INSTANCENAME CLASSNAME=\"~A\">~%" class-name)
  (cond
	((cim-reference-p key-slots)
	 (encode-cimxml-value.reference key-slots))
	((atom key-slots)
	 (encode-cimxml-keyvalue key-slots))
	(t
	 (dolist (key-slot key-slots)
	   (encode-cimxml-keybinding (car key-slot) (cdr key-slot)))))
  (eformat "</INSTANCENAME>~%"))

;;<!ELEMENT OBJECTPATH (INSTANCEPATH|CLASSPATH)>
(defun encode-cimxml-objectpath (namespace-path class-name &optional key-slots)
  (eformat "<OBJECTPATH>~%")
  (if key-slots
	  (encode-cimxml-instancepath namespace-path class-name key-slots)
	  (encode-cimxml-classpath namespace-path class-name))
  (eformat "</OBJECTPATH>~%"))

;;<!ELEMENT KEYBINDING (KEYVALUE|VALUE.REFERENCE)>
;;<!ATTLIST KEYBINDING
;;    %CIMName;>
(defun encode-cimxml-keybinding (name value)
  (eformat "<KEYBINDING NAME=\"~A\">~%" name)
  ;; FIXME: needs to handle value.reference values too!!!
  (encode-cimxml-keyvalue value)
  (eformat "</KEYBINDING>~%"))

;;<!ELEMENT KEYVALUE (#PCDATA)>
;;<!ATTLIST KEYVALUE
;;     VALUETYPE    (string|boolean|numeric)  "string"
;;     %CIMType;    #IMPLIED>
(defun encode-cimxml-keyvalue (value)
  (let ((tv (cond ((stringp value) (list "string" value))
				  ((numberp value) (list "numeric" value))
				  (t (list "boolean" (encode-cimxml-boolean value))))))
	(eformat "<KEYVALUE VALUETYPE=\"~A\">~A</KEYVALUE>~%"
			 (first tv) (second tv))))

;;<!ELEMENT CLASS (QUALIFIER*,(PROPERTY|PROPERTY.ARRAY|PROPERTY.REFERENCE)*,METHOD*)>
;;<!ATTLIST CLASS 
;;    %CIMName;
;;    %SuperClass;>
(defun encode-cimxml-class (class)
  (declare (type cim-class class))
  (let ((super-class (cim-class-superclasses class)))
	(if super-class
		(eformat "<CLASS NAME=\"~A\" SuperClass=\"~A\">~%"
				 (cim-name class)
				 (cim-name super-class))
		(eformat "<CLASS NAME=\"~A\">~%" (cim-name class))))
  (dolist (qualifier (cim-qualifiers class))
	(destructuring-bind (q . v) qualifier
	  (encode-cimxml-qualifier q v)))
  (dolist (slot (cim-class-slots class))
	(encode-cimxml-slot slot))
  (dolist (method (cim-class-methods class))
	(encode-cimxml-method method))
  (eformat "</CLASS>~%"))

;;<!ELEMENT INSTANCE (QUALIFIER*,(PROPERTY|PROPERTY.ARRAY|PROPERTY.REFERENCE)*)>
;;<!ATTLIST INSTANCE
;;         %ClassName;
;;         xml:lang   NMTOKEN  #IMPLIED>
(defun encode-cimxml-instance (instance)
  (cond
	((cim-instance-p instance)
	 (eformat "<INSTANCE CLASSNAME=\"~A\">~%" (cim-instance-classname instance))
	 (dolist (slot (cim-instance-slots instance))
	   (destructuring-bind (slot-name slot-value slot-type) slot
		 (encode-cimxml-slot* slot-name slot-value slot-type)))
	 (eformat "</INSTANCE>~%"))
	(t 
	 (let ((class (class-of instance)))
	   (eformat "<INSTANCE CLASSNAME=\"~A\">~%" (cim-name class))
	   (dolist (slot (cim-class-slots class))
		 (encode-cimxml-slot slot (slot-value instance (class-name slot))))
	   (eformat "</INSTANCE>~%")))))

;;<!ELEMENT QUALIFIER ((VALUE|VALUE.ARRAY)?)>
;;<!ATTLIST QUALIFIER 
;;     %CIMName;
;;     %CIMType;               #REQUIRED 
;;     %Propagated;
;;     %QualifierFlavor;
;;     xml:lang  NMTOKEN  #IMPLIED>
(defun encode-cimxml-qualifier (qualifier value)
  (declare (type cim-qualifier qualifier))
  (let ((type (cim-qualifier-type qualifier)))
    (eformat "<QUALIFIER NAME=\"~A\" Type=\"~A\"/>~%"
	     (cim-name qualifier)
	     type)
    (encode-cimxml-scope (cim-qualifier-scope qualifier))
    (cond
      ((and (listp type) (eq (car type) 'array))
       (encode-cimxml-value.array value))
      ((eq type 'boolean)
       (encode-cimxml-value (encode-cimxml-boolean value)))
      (t
       (encode-cimxml-value value))))
    (eformat "</QUALIFIER>~%"))

;;<!ELEMENT PROPERTY (QUALIFIER*,VALUE?)>
;;<!ATTLIST PROPERTY 
;;     %CIMName;
;;     %CIMType;           #REQUIRED 
;;     %ClassOrigin;
;;     %Propagated;
;;     %EmbeddedObject;
;;     xml:lang   NMTOKEN  #IMPLIED>
(defun encode-cimxml-property (slot &optional value)
  (eformat "<PROPERTY NAME=\"~A\" TYPE=\"~A\">~%"
		   (cim-name slot) (encode-cimxml-type (cim-slot-type slot)))
  (dolist (qualifier (cim-qualifiers slot))
	(destructuring-bind (q . v) qualifier
	  (encode-cimxml-qualifier q v)))
  (when (or value (eq (cim-slot-type slot) 'boolean))
	(encode-cimxml-value value))
  (eformat "</PROPERTY>~%"))

;;<!ELEMENT PROPERTY.ARRAY (QUALIFIER*,VALUE.ARRAY?)>
;;<!ATTLIST PROPERTY.ARRAY 
;;    %CIMName;
;;    %CIMType;           #REQUIRED 
;;    %ArraySize;
;;    %ClassOrigin;
;;    %Propagated;
;;    %EmbeddedObject;
;;    xml:lang   NMTOKEN  #IMPLIED>
(defun encode-cimxml-property.array (slot &optional value)
  (eformat "<PROPERTY.ARRAY NAME=\"~A\" TYPE=\"~A\">~%"
		   (cim-name slot)
		   (encode-cimxml-type (cim-slot-type slot)))
  (dolist (qualifier (cim-qualifiers slot))
	(destructuring-bind (q . v) qualifier
	  (encode-cimxml-qualifier q v)))
  (when value
	(encode-cimxml-value.array value))
  (eformat "</PROPERTY.ARRAY>~%"))

;;<!ELEMENT PROPERTY.REFERENCE (QUALIFIER*,VALUE.REFERENCE?)>
;;<!ATTLIST PROPERTY.REFERENCE
;;     %CIMName;
;;     %ReferenceClass;
;;     %ClassOrigin;
;;     %Propagated;>
(defun encode-cimxml-property.reference (slot &optional value)
  (eformat "<PROPERTY.REFERENCE NAME=\"~A\" REFERENCECLASS=\"~A\">~%"
		   (cim-name slot)
		   (cim-name (find-class (cim-slot-type slot))))
  (dolist (qualifier (cim-qualifiers slot))
	(destructuring-bind (q . v) qualifier
	  (encode-cimxml-qualifier q v)))
  (when value
	(encode-cimxml-value.reference value))
  (eformat "</PROPERTY.REFERENCE>~%"))
  

;; Lisp function to encode a Slot. It wraps the above 3 property calls
(defun encode-cimxml-slot (slot &optional value)
  (let ((type (cim-slot-type slot)))
	(cond
	  ((and (listp type) (eq (car type) 'array))
	   (encode-cimxml-property.array slot value))
	  ((subtypep type 'cim-primitive)
	   (encode-cimxml-property slot value))
	  (t
	   ;; another type, must be a reference
	   (encode-cimxml-property.reference slot value)))))

(defun encode-cimxml-slot* (slot-name slot-value slot-type)
  (encode-cimxml-slot (make-instance 'cim-standard-effective-slot-definition
									 :cim-type slot-type
									 :cim-name slot-name)
					  slot-value))

;;<!ELEMENT METHOD (QUALIFIER*,(PARAMETER|PARAMETER.REFERENCE|PARAMETER.ARRAY|PARAMETER.REFARRAY)*)>
;;<!ATTLIST METHOD 
;;     %CIMName;
;;     %CIMType;          #IMPLIED 
;;     %ClassOrigin;
;;     %Propagated;>
(defun encode-cimxml-method (method)
  (eformat "<METHOD NAME=\"~A\">~%" (cim-name method))
  (dolist (qualifier (cim-qualifiers method))
	(destructuring-bind (q . v) qualifier
	  (encode-cimxml-qualifier q v)))
  (dolist (parameter (cim-method-parameters method))
	(encode-cimxml-parameter parameter))
  (eformat "</METHOD>~%"))

;;<!ELEMENT PARAMETER (QUALIFIER*)>
;;<!ATTLIST PARAMETER 
;;     %CIMName;
;;     %CIMType;      #REQUIRED>
(defun %encode-cimxml-parameter (parameter)
  (eformat "<PARAMETER NAME=\"~A\" TYPE=\"~A\">~%"
	   (cim-name parameter)
	   (encode-cimxml-type (cim-parameter-type parameter)))
  (dolist (qualifier (cim-qualifiers parameter))
    (destructuring-bind (q . val) qualifier
      (encode-cimxml-qualifier q val)))
  (eformat "</PARAMETER>~%"))

;;<!ELEMENT PARAMETER.REFERENCE (QUALIFIER*)>
;;<!ATTLIST PARAMETER.REFERENCE
;;     %CIMName;
;;     %ReferenceClass;>
(defun encode-cimxml-parameter.reference (parameter)
  (eformat "<PARAMETER.REFERENCE NAME=\"~A\" REFERENCECLASS=\"~A\">~%"
	   (cim-name parameter)
	   (cim-name (find-class (cim-parameter-type parameter))))
  (dolist (qualifier (cim-qualifiers parameter))
    (destructuring-bind (q . val) qualifier
      (encode-cimxml-qualifier q val)))
  (eformat "</PARAMETER.REFERENCE>~%"))
  
;;<!ELEMENT PARAMETER.ARRAY (QUALIFIER*)>
;;<!ATTLIST PARAMETER.ARRAY
;;     %CIMName;
;;     %CIMType;           #REQUIRED
;;     %ArraySize;>
(defun encode-cimxml-parameter.array (parameter)
  (eformat "<PARAMETER.ARRAY NAME=\"~A\" TYPE=\"~A\">~%"
	   (cim-name parameter)
	   (encode-cimxml-type (cim-parameter-type parameter)))
  (dolist (qualifier (cim-qualifiers parameter))
    (destructuring-bind (q . val) qualifier
      (encode-cimxml-qualifier q val)))
  (eformat "</PARAMETER.ARRAY>~%"))

;;<!ELEMENT PARAMETER.REFARRAY (QUALIFIER*)>
;;<!ATTLIST PARAMETER.REFARRAY
;;     %CIMName;
;;     %ReferenceClass;
;;     %ArraySize;>
(defun encode-cimxml-parameter.refarray (parameter)
  (eformat "<PARAMETER.REFARRAY NAME=\"~A\" REFERENCECLASS=\"~A\">~%"
	   (cim-name parameter)
	   (cim-name (find-class (cim-parameter-type parameter))))
  (dolist (qualifier (cim-qualifiers parameter))
    (destructuring-bind (q . val) qualifier
      (encode-cimxml-qualifier q val)))
  (eformat "</PARAMETER.REFARRAY>~%"))


;; Lisp function to wrap the above calls to the various parameter encoders
(defun encode-cimxml-parameter (parameter)
  (let ((type (cim-parameter-type parameter)))
	(cond
	  ((and (listp type) (eq (car type) 'array))
	   (if (subtypep (cadr type) 'cim-primitive)
		   (encode-cimxml-parameter.array parameter)
		   (encode-cimxml-parameter.refarray parameter)))
	  ((subtypep type 'cim-primitive)
	   (%encode-cimxml-parameter parameter))
	  (t
	   (encode-cimxml-parameter.reference parameter)))))


;;<!ELEMENT MESSAGE (SIMPLEREQ|MULTIREQ|SIMPLERSP|MULTIRSP|
;;          SIMPLEEXPREQ|MULTIEXPREQ|SIMPLEEXPRSP|MULTIEXPRSP)>
;;<!ATTLIST MESSAGE
;;         ID             CDATA     #REQUIRED
;;         PROTOCOLVERSION CDATA     #REQUIRED>
(defun encode-cimxml-message (message)
  (let ((request (cim-message-request message))
		(response (cim-message-response message))
		(exp-request (cim-message-exp-request message))
		(exp-response (cim-message-exp-response message)))
    (eformat "<MESSAGE ID=\"~A\" PROTOCOLVERSION=\"~A\">~%"
	     (cim-message-id message)
	     +protocol-version+)
    (cond
      ((consp request)
       ;; list of requests, i.e. a multireq node
       (encode-cimxml-multireq request))
      (request
       (encode-cimxml-simplereq request))
      ((consp response)
       ;; list of responses, i.e. a multirsp node
       (encode-cimxml-multirsp response))
      (response
       (encode-cimxml-simplersp response))
	  ((and exp-request (listp (car exp-request)))
	   (encode-cimxml-multiexpreq exp-request))
	  (exp-request
	   (destructuring-bind (method-name params) exp-request
		 (encode-cimxml-simpleexpreq method-name params)))
	  ((and exp-response (listp (car exp-response)))
	   (encode-cimxml-multiexprsp exp-response))
	  (exp-response
	   (destructuring-bind (method-name return-type value) exp-response
		 (encode-cimxml-simpleexprsp method-name return-type value)))
      (t (error "Unable to handle message ~S" message)))
    (eformat "</MESSAGE>~%")))


;;<!ELEMENT MULTIREQ (SIMPLEREQ,SIMPLEREQ+)>
(defun encode-cimxml-multireq (request-list)
  (eformat "<MULTIREQ>~%")
  (dolist (req request-list)
    (encode-cimxml-simplereq req))
  (eformat "</MULTIREQ>~%"))

;;<!ELEMENT SIMPLEREQ (METHODCALL|IMETHODCALL)>
(defun encode-cimxml-simplereq (request)
  (declare (type cim-request request))
  (eformat "<SIMPLEREQ>~%")
  (if (cim-request-intrinsic-p request)
	  (encode-cimxml-imethodcall (cim-request-method-name request)
						  (namespace-path-namespace-list (cim-request-namespace-path request))
						  (cim-request-arguments request))
	  (encode-cimxml-methodcall (cim-request-method-name request)
						 (cim-request-reference request)
						 (cim-request-arguments request)))  
  (eformat "</SIMPLEREQ>~%"))

;;<!ELEMENT METHODCALL ((LOCALCLASSPATH|LOCALINSTANCEPATH),PARAMVALUE*)>
;;<!ATTLIST METHODCALL
;;     %CIMName;>
(defun encode-cimxml-methodcall (method-name reference param-values)
  "REFERENCE is a CIM-REFERNCE object.

PARAM-VALUES is a list of form (name value type)."
  (eformat "<METHODCALL NAME=\"~A\">~%" method-name)
  (let ((namespace (cim-reference-namespace reference))
		(class-name (cim-reference-classname reference)))
	(if (cim-reference-keyslots reference)
		(encode-cimxml-localinstancepath (parse-namespace namespace)
								  class-name
								  (cim-reference-keyslots reference))
		(encode-cimxml-localclasspath (parse-namespace namespace)
							   class-name)))
  (dolist (param-value param-values)
	(destructuring-bind (name value type) param-value
	  (encode-cimxml-paramvalue name value type)))								
  (eformat "</METHODCALL>~%"))

;;<!ELEMENT PARAMVALUE (VALUE|VALUE.REFERENCE|VALUE.ARRAY|VALUE.REFARRAY)?>
;;<!ATTLIST PARAMVALUE
;;     %CIMName;
;;     %ParamType;    #IMPLIED
;;     %EmbeddedObject;>
(defun encode-cimxml-paramvalue (name value type)
  (eformat "<PARAMVALUE NAME=\"~A\">~%" name)
  (cond
	((and (listp type) (eq (car type) 'array))
	 (if (subtypep (cadr type) 'cim-primitive)
		 (encode-cimxml-value.array value)
		 (encode-cimxml-value.refarray value)))
	((cim-reference-p value)
	 (encode-cimxml-value.reference value))
	(t (encode-cimxml-value value)))
  (eformat "</PARAMVALUE>~%"))

;;<!ELEMENT IMETHODCALL (LOCALNAMESPACEPATH,IPARAMVALUE*)>
;;<!ATTLIST IMETHODCALL
;;     %CIMName;>
(defun encode-cimxml-imethodcall (method-name namespace-list params)
  (declare (type string method-name)
		   (type list namespace-list params))
  (eformat "<IMETHODCALL NAME=\"~A\">~%" method-name)
  (encode-cimxml-localnamespacepath namespace-list)
  (dolist (param-value params)
	(destructuring-bind (name value param-type) param-value
	  (encode-cimxml-iparamvalue name param-type value)))
  (eformat "</IMETHODCALL>~%"))

;;<!ELEMENT IPARAMVALUE (VALUE|VALUE.ARRAY|VALUE.REFERENCE|CLASSNAME|INSTANCENAME|QUALIFIER.DECLARATION|
;;              CLASS|INSTANCE|VALUE.NAMEDINSTANCE)?>
;;<!ATTLIST IPARAMVALUE
;;     %CIMName;>
(defun encode-cimxml-iparamvalue (name param-type value)
  (eformat "<IPARAMVALUE NAME=\"~A\">~%" name)
  (ecase param-type
	(:value
	 (encode-cimxml-value value))
	(:value.array
	 (encode-cimxml-value.array value))
	(:value.reference
	 (encode-cimxml-value.reference value))
	(:classname
	 (encode-cimxml-classname value))
	(:instancename
	 (encode-cimxml-instancename (cim-instance-classname value)
								 (cim-instance-slots value)))	
	(:qualifier.declaration
	 (error "FIXME!!!"))
	(:class
	 (encode-cimxml-class value))
	(:instance
	 (encode-cimxml-instance value))
	(:value.namedinstance
	 (encode-cimxml-value.namedinstance value)))
  (eformat "</IPARAMVALUE>~%"))
  
;; <!ELEMENT MULTIRSP (SIMPLERSP,SIMPLERSP+)>
(defun encode-cimxml-multirsp (response-list)
  (eformat "<MULTIRSP>~%")
  (dolist (rsp response-list)
    (encode-cimxml-simplersp rsp))
  (eformat "</MULTIRSP>~%"))

;;<!ELEMENT SIMPLERSP (METHODRESPONSE|IMETHODRESPONSE)>
(defun encode-cimxml-simplersp (response)
  (eformat "<SIMPLERSP>~%")
  (if (cim-response-intrinsic-p response)
	  (encode-cimxml-imethodresponse
	   (cim-response-method-name response)
	   (cim-response-return-type response)
	   (cim-response-return-value response))
	  (encode-cimxml-methodresponse
	   (cim-response-method-name response)
	   (cim-response-return-value response)
	   (cim-response-out-parameters response)))
  (eformat "</SIMPLERSP>~%"))

;;<!ELEMENT METHODRESPONSE (ERROR|(RETURNVALUE?,PARAMVALUE*))>
;;<!ATTLIST METHODRESPONSE
;;           %CIMName;>
(defun encode-cimxml-methodresponse (method-name value out-params)
  (eformat "<METHODRESPONSE NAME=\"~A\">~%" method-name)
  (encode-cimxml-returnvalue value)
  (dolist (out-param out-params)
	(destructuring-bind (name val type) out-param
	  (encode-cimxml-paramvalue name val type)))
  (eformat "</METHODNAME>~%"))
  
;;<!ELEMENT IMETHODRESPONSE (ERROR|IRETURNVALUE?)>
;;<!ATTLIST IMETHODRESPONSE
;;           %CIMName;>
(defun encode-cimxml-imethodresponse (method-name return-type value)
  (eformat "<IMETHODRESPONSE NAME=\"~A\">~%" method-name)
  (encode-cimxml-ireturnvalue return-type value)
  (eformat "</IMETHODRESPONSE>~%"))

;;<!ELEMENT ERROR (INSTANCE*)
;;<!ATTLIST ERROR
;;              CODE        CDATA   #REQUIRED
;;              DESCRIPTION CDATA   #IMPLIED>
(defun encode-cimxml-error (condition &optional instances)
  (eformat "<ERROR CODE=\"~A\" DESCRIPTION=\"~A\">~%"
		   (cim-error-code condition)
		   (let ((desc (cim-error-description condition)))
			 (if desc desc "")))
  (when instances
	(dolist (instance instances)
	  (encode-cimxml-instance instance)))
  (eformat "</ERROR>~%"))


;;<!ELEMENT RETURNVALUE (VALUE|VALUE.REFERENCE)>
;;<!ATTLIST RETURNVALUE
;;         %EmbeddedObject;
;;     %ParamType;     #IMPLIED>
(defun encode-cimxml-returnvalue (value)
  (eformat "<RETURNVALUE>~%")
  (if (cim-reference-p value)
	  (encode-cimxml-value.reference value)
	  (encode-cimxml-value value))
  (eformat "</RETURNVALUE>~%"))
	  
;;<!ELEMENT IRETURNVALUE (CLASSNAME*|INSTANCENAME*|VALUE*|VALUE.OBJECTWITHPATH*|VALUE.OBJECTWITHLOCALPATH*
;;              VALUE.OBJECT*|OBJECTPATH*|QUALIFIER.DECLARATION*|VALUE.ARRAY?|VALUE.REFERENCE?|
;;               CLASS*|INSTANCE*|VALUE.NAMEDINSTANCE*)>
(defun encode-cimxml-ireturnvalue (return-type value)
  (eformat "<IRETURNVALUE>~%")
  (ecase return-type
	(:classname
	 (if (consp value)
		 (dolist (class-name value)
		   (encode-cimxml-classname class-name))
		 (encode-cimxml-classname value)))
	(:instancename
	 (if (consp value)
		 (dolist (instance value)
		   (encode-cimxml-instancename (cim-name (class-of instance))
									   (instance-key-slots instance)))
		 (encode-cimxml-instancename (cim-name (class-of value))
									 (instance-key-slots value))))
	(:value
	 (if (consp value)
		 (dolist (v value)
		   (encode-cimxml-value v))
		 (encode-cimxml-value value)))
	(:value.objectwithpath
	 (destructuring-bind (object path) value
	   (encode-cimxml-value.objectwithpath object path)))
	(:value.objectwithlocalpath
	 (destructuring-bind (object path) value
	   (encode-cimxml-value.objectwithlocalpath object path)))
	(:value.object
	 (if (consp value)
		 (dolist (object value)
		   (encode-cimxml-value.object object))
		 (encode-cimxml-value.object value)))
	((:objectpath)
	 (destructuring-bind (path class-name &optional key-slots) value
	   (encode-cimxml-objectpath path class-name key-slots)))
	(:value.array
	 (encode-cimxml-value.array value))
	(:value.reference
	 (encode-cimxml-value.reference value))
	(:class
	 (if (consp value)
		 (dolist (class value)
		   (encode-cimxml-class class))
		 (encode-cimxml-class value)))
	(:instance
	 (if (consp value)
		 (dolist (instance value)
		   (encode-cimxml-instance instance))
		 (encode-cimxml-instance value)))
	(:value.namedinstance
	 (encode-cimxml-value.namedinstance value)))
  (eformat "</IRETURNVALUE>~%"))

;;<!ELEMENT MULTIEXPREQ (SIMPLEEXPREQ,SIMPLEEXPREQ+)>
(defun encode-cimxml-multiexpreq (requests)
  (eformat "<MULTIEXPREQ>~%")
  (dolist (request requests)
	(destructuring-bind (method-name params) request
	  (encode-cimxml-simpleexpreq method-name params)))
  (eformat "</MULTIEXPREQ>~%"))

;;<!ELEMENT SIMPLEEXPREQ (EXPMETHODCALL)>
(defun encode-cimxml-simpleexpreq (method-name params)
  (eformat "<SIMPLEEXPREQ>~%")
  (encode-cimxml-expmethodcall method-name params)
  (eformat "</SIMPLEEXPREQ>~%"))

;;<!ELEMENT EXPMETHODCALL (EXPPARAMVALUE*)>
;;<!ATTLIST EXPMETHODCALL 
;;    %CIMName;>
(defun encode-cimxml-expmethodcall (method-name params)
  (eformat "<EXPMETHODCALL NAME=\"~A\">~%" method-name)
  (dolist (param params)
	(destructuring-bind (name value) param
	  (encode-cimxml-expparamvalue name value)))
  (eformat "</EXPMETHODCALL>~%"))

;;<!ELEMENT MULTIEXPRSP (SIMPLEEXPRSP,SIMPLEEXPRSP+)>
(defun encode-cimxml-multiexprsp (responses)
  (eformat "<MULTIEXPRSP>~%")
  (dolist (response responses)
	(destructuring-bind (method-name return-type value) response
	  (encode-cimxml-simpleexprsp method-name return-type value)))
  (eformat "</MULTIEXPRSP>~%"))

;;<!ELEMENT SIMPLEEXPRSP (EXPMETHODRESPONSE)>
(defun encode-cimxml-simpleexprsp (method-name return-type value)
  (eformat "<SIMPLEEXPRSP>~%")
  (encode-cimxml-expmethodresponse method-name return-type value)
  (eformat "</SIMPLEEXPRSP>~%"))

;;<!ELEMENT EXPMETHODRESPONSE (ERROR|IRETURNVALUE?)>
;;<!ATTLIST EXPMETHODRESPONSE
;;      %CIMName;>
(defun encode-cimxml-expmethodresponse (method-name return-type value)
  (eformat "<EXPMETHODRESPONSE NAME=\"~A\">~%" method-name)
  (encode-cimxml-ireturnvalue return-type value)
  (eformat "</EXPMETHODRESPONSE>~%"))

;;<!ELEMENT EXPPARAMVALUE (INSTANCE?)>
;;<!ATTLIST EXPPARAMVALUE 
;;    %CIMName;>
(defun encode-cimxml-expparamvalue (name value)
  (eformat "<EXPPARAMVALUE NAME=\"~A\">~%" name)
  (encode-cimxml-instance value)
  (eformat "</EXPPARAMVALUE>~%"))



;;; --------------

(defun encode-cimxml-request (method-name
					   &key (id 1) (namespace "root") intrinsic-p
					   arguments class-name key-slots)
  "Encode a CIM request message."
  (with-output-to-string (*standard-output*)    
    (encode-cimxml-cim
     (make-cim-message
      :id id
      :request
      (make-cim-request
       :method-name method-name
       :intrinsic-p intrinsic-p
       :namespace-path
       (make-namespace-path
        :namespace-list (parse-namespace namespace))
       :arguments arguments
       :reference
       (make-cim-reference
        :namespace namespace
        :classname class-name
        :keyslots key-slots))))))

;; <class>GetClass ( 
;;         [IN] <className> ClassName, 
;;         [IN,OPTIONAL] boolean LocalOnly = true,
;;         [IN,OPTIONAL] boolean IncludeQualifiers = true, 
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false, 
;;         [IN,OPTIONAL,NULL] string PropertyList [] = NULL 
;; )
(defun encode-get-class (class-name &key
						 (namespace "root")
						 (local-only t)
						 (include-qualifiers t)
						 include-class-origin
						 property-list)
  (encode-cimxml-request
   "GetClass"
   :namespace namespace
   :intrinsic-p t
   :arguments
   `(("ClassName" ,class-name :classname)
	 ("LocalOnly" ,(encode-cimxml-boolean local-only) :value)
	 ("IncludeQualifiers" ,(encode-cimxml-boolean include-qualifiers) :value)
	 ("IncludeClassOrigin" ,(encode-cimxml-boolean include-class-origin) :value)
	 ("PropertyList" ,property-list :value.array))))
	 
;; <instance>GetInstance ( 
;;         [IN] <instanceName> InstanceName, 
;;         [IN,OPTIONAL] boolean LocalOnly = true,  (DEPRECATED)
;;         [IN,OPTIONAL] boolean IncludeQualifiers = false,  (DEPRECATED)
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false, 
;;         [IN,OPTIONAL,NULL] string PropertyList [] = NULL 
;; )
(defun encode-get-instance (instance-name &key
							(namespace "root")
							include-class-origin
							property-list)
  (encode-cimxml-request
   "GetInstance"
   :namespace namespace
   :intrinsic-p t
   :arguments
   `(("InstanceName" ,instance-name :instancename)
	 ("IncludeClassOrigin" ,(encode-cimxml-boolean include-class-origin) :value)
	 ("PropertyList" ,property-list :value.array))))
  

;;void  DeleteClass (
;;        [IN] <className> ClassName 
;; )

;;void  DeleteInstance ( 
;;         [IN] <instanceName> InstanceName 
;; )
(defun encode-delete-instance (instance &key (namespace "root"))
  (encode-cimxml-request
   "DeleteInstance"
   :namespace namespace
   :intrinsic-p t
   :arguments
   `(("InstanceName" ,instance :instancename))))

;;void CreateClass ( 
;;        [IN] <class> NewClass 
;; )

;;CreateInstance
;; <instanceName>CreateInstance ( 
;;        [IN] <instance> NewInstance 
;; )
(defun encode-create-instance (instance &key (namespace "root"))
  (encode-cimxml-request
   "CreateInstance"
   :namespace namespace
   :intrinsic-p t
   :arguments
   `(("NewInstance" ,instance :instance))))
  
;;void ModifyClass ( 
;;        [IN] <class> ModifiedClass 
;; )

;;void ModifyInstance ( 
;;        [IN] <namedInstance> ModifiedInstance, 
;;        [IN, OPTIONAL] boolean IncludeQualifiers = true,  (DEPRECATED)
;;        [IN, OPTIONAL, NULL] string propertyList[] = NULL 
;; )
(defun encode-modify-instance (instance &key (namespace "root") property-list)
  (encode-cimxml-request
   "ModifyInstance"
   :namespace namespace
   :intrinsic-p t
   :arguments
   `(("ModifiedInstance" ,instance :value.namedinstance)
	 ("propertyList" ,property-list :value.array))))

;; <class>*EnumerateClasses ( 
;;         [IN,OPTIONAL,NULL] <className> ClassName=NULL, 
;;         [IN,OPTIONAL] boolean DeepInheritance = false,
;;         [IN,OPTIONAL] boolean LocalOnly = true, 
;;         [IN,OPTIONAL] boolean IncludeQualifiers = true, 
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false 
;; )
(defun encode-enumerate-classes (&key
								 (namespace "root") class-name deep-inheritance
								 (local-only t) (include-qualifiers t)
								 include-class-origin)
  (encode-cimxml-request
   "EnumerateClasses"
   :namespace namespace
   :intrinsic-p t
   :arguments
   `(,@(when class-name `(("ClassName" ,class-name :classname)))
	   ("DeepInheritance" ,(encode-cimxml-boolean deep-inheritance) :value)
	   ("LocalOnly" ,(encode-cimxml-boolean local-only) :value)
	   ("IncludeQualifiers" ,(encode-cimxml-boolean include-qualifiers) :value)
	   ("IncludeClassOrigin" ,(encode-cimxml-boolean include-class-origin) :value))))

;;<className>*EnumerateClassNames ( 
;;         [IN,OPTIONAL,NULL] <className> ClassName = NULL, 
;;         [IN,OPTIONAL] boolean DeepInheritance = false 
;; )
(defun encode-enumerate-class-names (&key
									 (namespace "root") class-name
									 deep-inheritance)
  (encode-cimxml-request
   "EnumerateClassNames"
   :namespace namespace
   :intrinsic-p t
   :arguments
   `(,@(when class-name `(("ClassName" ,class-name :classname)))
	   ("DeepInheritance" ,(encode-cimxml-boolean deep-inheritance) :value))))

;;<namedInstance>*EnumerateInstances ( 
;;         [IN] <className> ClassName, 
;;         [IN,OPTIONAL] boolean LocalOnly = true,  (DEPRECATED)
;;         [IN,OPTIONAL] boolean DeepInheritance = true, 
;;         [IN,OPTIONAL] boolean IncludeQualifiers = false,  (DEPRECATED)
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false, 
;;         [IN,OPTIONAL,NULL] string PropertyList [] = NULL 
;; )
(defun encode-enumerate-instances (class-name &key
								 (namespace "root") (deep-inheritance t)
								 include-class-origin property-list)
  (encode-cimxml-request
   "EnumerateInstances"
   :namespace namespace
   :intrinsic-p t
   :arguments
   `(("ClassName" ,class-name :classname)
	 ("DeepInheritance" ,(encode-cimxml-boolean deep-inheritance) :value)
	 ("IncludeClassOrigin" ,(encode-cimxml-boolean include-class-origin) :value)
	 ("PropertyList" ,property-list :value.array))))

;;<instanceName>*EnumerateInstanceNames ( 
;;         [IN] <className> ClassName 
;; )
(defun encode-enumerate-instance-names (class-name &key (namespace "root"))
  (encode-cimxml-request
   "EnumerateInstanceNames"
   :intrinsic-p t
   :namespace namespace
   :arguments
   `(("ClassName" ,class-name :classname))))
										
;; <object>*ExecQuery ( 
;;         [IN] string QueryLanguage, 
;;         [IN] string Query 
;; )

;; <objectWithPath>*Associators ( 
;;         [IN] <objectName> ObjectName, 
;;         [IN,OPTIONAL,NULL] <className> AssocClass = NULL,
;;         [IN,OPTIONAL,NULL] <className> ResultClass = NULL, 
;;         [IN,OPTIONAL,NULL] string Role = NULL, 
;;         [IN,OPTIONAL,NULL] string ResultRole = NULL, 
;;         [IN,OPTIONAL] boolean IncludeQualifiers = false, (DEPRECATED)
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false, 
;;         [IN,OPTIONAL,NULL] string PropertyList [] = NULL 
;; )
(defun encode-associators (object-name &key
						   (namespace "root")
						   assoc-class result-class role result-role
						   include-class-origin property-list)
  (encode-cimxml-request
   "Associators"
   :intrinsic-p t
   :namespace namespace
   :arguments
   `(("ObjectName" ,object-name ,(cond
								  ((cim-instance-p object-name)
								   :value.namedinstance)
								  ((typep object-name 'cim-class)
								   :class)
								  (t (error "OBJECT-NAME must be a CIM-INSTANCE or a CIM-CLASS"))))
	 ,@(when assoc-class `(("AssocClass" ,assoc-class :classname)))
	 ,@(when result-class `(("ResultClass" ,result-class :classname)))
	 ,@(when role `(("Role" ,role :value)))
	 ,@(when result-role `(("ResultRole" ,result-role :value)))
	 ("IncludeClassOrigin" ,(encode-cimxml-boolean include-class-origin) :value)
	 ("PropertyList" ,property-list :value.array))))
				   
;; <objectPath>*AssociatorNames ( 
;;         [IN] <objectName> ObjectName, 
;;         [IN,OPTIONAL,NULL] <className> AssocClass = NULL, 
;;         [IN,OPTIONAL,NULL] <className> ResultClass = NULL, 
;;         [IN,OPTIONAL,NULL] string Role = NULL, 
;;         [IN,OPTIONAL,NULL] string ResultRole = NULL 
;; )
(defun encode-associator-names (object-name &key
								(namespace "root")
								assoc-class result-class role result-role)
  (encode-cimxml-request
   "AssociatorNames"
   :intrinsic-p t
   :namespace namespace
   :arguments
   `(("ObjectName" ,object-name ,(cond
								  ((cim-instance-p object-name)
								   :value.namedinstance)
								  ((typep object-name 'cim-class)
								   :class)
								  (t (error "OBJECT-NAME must be a CIM-INSTANCE or a CIM-CLASS"))))
	 ,@(when assoc-class `(("AssocClass" ,assoc-class :classname)))
	 ,@(when result-class `(("ResultClass" ,result-class :classname)))
	 ,@(when role `(("Role" ,role :value)))
	 ,@(when result-role `(("ResultRole" ,result-role :value))))))

;; <objectWithPath>*References ( 
;;         [IN] <objectName> ObjectName, 
;;         [IN,OPTIONAL,NULL] <className> ResultClass = NULL,
;;         [IN,OPTIONAL,NULL] string Role = NULL, 
;;         [IN,OPTIONAL] boolean IncludeQualifiers = false,  (DEPRECATED)
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false, 
;;         [IN,OPTIONAL,NULL] string PropertyList [] = NULL 
;; )
(defun encode-references (object-name &key
						  (namespace "root")
						  result-class role result-role
						  include-class-origin property-list)
  (encode-cimxml-request
   "References"
   :intrinsic-p t
   :namespace namespace
   :arguments
   `(("ObjectName" ,object-name ,(cond
								  ((cim-instance-p object-name)
								   :value.namedinstance)
								  ((typep object-name 'cim-class)
								   :class)
								  (t (error "OBJECT-NAME must be a CIM-INSTANCE or a CIM-CLASS"))))
	 ,@(when result-class `(("ResultClass" ,result-class :classname)))
	 ,@(when role `(("Role" ,role :value)))
	 ,@(when result-role `(("ResultRole" ,result-role :value)))
	 ("IncludeClassOrigin" ,(encode-cimxml-boolean include-class-origin) :value)
	 ("PropertyList" ,property-list :value.array))))

				   
;;<objectPath>*ReferenceNames ( 
;;         [IN] <objectName> ObjectName, 
;;         [IN,OPTIONAL,NULL] <className> ResultClass = NULL, 
;;         [IN,OPTIONAL,NULL] string Role = NULL 
;; )
(defun encode-reference-names (object-name &key
						  (namespace "root")
						  result-class role)
  (encode-cimxml-request
   "ReferenceNames"
   :intrinsic-p t
   :namespace namespace
   :arguments
   `(("ObjectName" ,object-name ,(cond
								  ((cim-instance-p object-name)
								   :value.namedinstance)
								  ((typep object-name 'cim-class)
								   :class)
								  (t (error "OBJECT-NAME must be a CIM-INSTANCE or a CIM-CLASS"))))
	 ,@(when result-class `(("ResultClass" ,result-class :classname)))
	 ,@(when role `(("Role" ,role :value))))))

;; <propertyValue>GetProperty ( 
;;         [IN] <instanceName> InstanceName, 
;;         [IN] string PropertyName 
;; )

;; void SetProperty ( 
;;         [IN] <instanceName> InstanceName, 
;;         [IN] string PropertyName, 
;;         [IN,OPTIONAL,NULL] <propertyValue> NewValue = NULL 
;; )

;; <qualifierDecl>GetQualifier ( 
;;         [IN] string QualifierName 
;; )

;; void SetQualifier ( 
;;         [IN] <qualifierDecl> QualifierDeclaration 
;; )

;; void DeleteQualifier ( 
;;         [IN] string QualifierName 
;; )

;; <qualifierDecl>*EnumerateQualifiers ( 
;; )
(defun encode-enumerate-qualifiers (&key (namespace "root"))
  (encode-cimxml-request
   "EnumerateQualifiers"
   :intrinsic-p t
   :namespace namespace))


;; you can subscribe to an indicaiton by creating an instance of
;; CIM_IndicationSubscription class which is an association class
;; between CIM_IndicationFilter and CIM_IndicationHandler classes.
;; CIM_IndicationFilter defines the filter criteria and data
;; project list to describe the desired indication stream.
;; CIM_IndicationHandler defines the desired indication encoding,
;; destination location, and protocol for delivering the indication stream.
(defun encode-subscribe ()
  nil)

;; delete the instances created above?
(defun encode-unsubscribe ()
  nil)


;; --------------- export messsages ------

(defun encode-cimxml-exp-request (method-name &key (id 1) params)
  "Encode an export request."
  (encode-cimxml-cim
   (make-cim-message
	:id id
	:exp-request
	(list method-name params))))

;; ExportIndication
;;  void ExportIndication ( 
;;         [IN] <instance> NewIndication 
;;  )
(defun encode-export-indication (instance)
  (encode-cimxml-exp-request
   "ExportIndication"
   :params
   `(("NewIndication" ,instance))))



;; ------------------

(defun encode-cimxml-response (method-name return-value &key
							   (id 1) intrinsic-p return-type
							   out-parameters) 
  (encode-cimxml-cim
   (make-cim-message
	:response
	(make-cim-response
	 :method-name method-name
	 :intrinsic-p intrinsic-p
	 :return-value return-value
	 :return-type return-type
	 :out-parameters out-parameters)
	:id id)))
