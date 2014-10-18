

(defpackage :climbe.encoding.cimxml
  (:use :cl :climbe))

(in-package :climbe.encoding.cimxml)

(defconstant* +cim-version+ "2.0")
(defconstant* +dtd-version+ "2.1")
(defconstant* +protocol-version+ +cim-version+)

(defun eformat (format-string &rest args)
  "Encoding format function."
  (declare (string format-string))
  (apply #'format t format-string args))

(defun encode-boolean (boolean)
  "CIM string for a bool"
  (if boolean
      "true"
      "false"))

(defun encode-type (type)
  "Returns the CIM string representation of the Lisp type."
  (string type))

;;<!ELEMENT CIM (MESSAGE|DECLARATION)>
;;<!ATTLIST CIM
;;         CIMVERSION CDATA #REQUIRED 
;;         DTDVERSION CDATA #REQUIRED>
(defun encode-cim (message)  
  (eformat "<CIM CIMVERSION=\"~A\" DTDVERSION=\"~A\">~%" +cim-version+ +dtd-version+)
  (encode-message message)
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
(defun encode-qualifier.declaration (qualifier)
  (declare (type cim-qualifier qualifier))
  (let ((type (cim-qualifier-type qualifier)))
    (eformat "<QUALIFIER.DECLARATION NAME=\"~A\" Type=\"~A\"/>~%"
	     (cim-name qualifier)
	     type)
    (encode-scope (cim-qualifier-scope qualifier))
    (let ((default (cim-qualifier-default qualifier)))
      (when default
	(cond
	  ((and (listp type) (eq (car type) 'array))
	   (encode-value.array default))
	  ((eq type 'boolean)
	   (encode-value (encode-boolean default)))
	  (t
	   (encode-value default)))))
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
(defun encode-scope (scope-list)
  (apply #'eformat "<SCOPE CLASS=\"~A\" ASSOCIATION=\"~A\" REFERENCE=\"~A\" PROPERTY=\"~A\" METHOD=\"~A\" PARAMETER=\"~A\" INDICATION=\"~A\" />~%"
	 (mapcar #'encode-boolean
		 (mapcar (lambda (scope)
			   (member scope scope-list))
			 '(:class :association :reference :property :method :parameter :indication)))))

;;<!ELEMENT VALUE (#PCDATA)>
(defun encode-value (value)
  (eformat "<VALUE>~A</VALUE>~%" value))

;;<!ELEMENT VALUE.ARRAY (VALUE*)>
(defun encode-value.array (value-list)
  (eformat "<VALUE.ARRAY>~%")
  (dolist (value value-list)
    (encode-value value))
  (eformat "</VALUE.ARRAY>~%"))

;;<!ELEMENT VALUE.REFERENCE (CLASSPATH|LOCALCLASSPATH|CLASSNAME|INSTANCEPATH|LOCALINSTANCEPATH|INSTANCENAME)>
(defun encode-value.reference (reference)
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
(defun encode-value.refarray (value-list)
  (eformat "<VALUE.REFERENCE>~%")
  (dolist (value value-list)
	(encode-value.reference value))
  (eformat "</VALUE.REFERENCE>~%"))

;;<!ELEMENT VALUE.OBJECT (CLASS|INSTANCE)>
(defun encode-value.object (object)
  (eformat "<VALUE.OBJECT>~%")
  (if (typep object 'cim-class)
	  (encode-class object)
	  (encode-instance object))
  (eformat "</VALUE.OBJECT>~%"))

;;<!ELEMENT VALUE.NAMEDINSTANCE (INSTANCENAME,INSTANCE)>

;;<!ELEMENT VALUE.NAMEDOBJECT (CLASS|(INSTANCENAME,INSTANCE))>

;;<!ELEMENT VALUE.OBJECTWITHPATH ((CLASSPATH,CLASS)|(INSTANCEPATH,INSTANCE))>

;;<!ELEMENT VALUE.OBJECTWITHLOCALPATH ((LOCALCLASSPATH,CLASS)|(LOCALINSTANCEPATH,INSTANCE))>

;;<!ELEMENT VALUE.NULL EMPTY>
(defun encode-null ()
  (eformat "<VALUE.NULL />~%"))

;;<!ELEMENT NAMESPACEPATH (HOST,LOCALNAMESPACEPATH)> 
(defun encode-namespacepath (namespace-path)
  (declare (type namespace-path namespace-path))
  (eformat "<NAMESPACEPATH>~%")
  (encode-host (namespace-path-host namespace-path))
  (encode-localnamespacepath (namespace-path-namespace-list namespace-path))
  (eformat "</NAMESPACEPATH>~%"))

;;<!ELEMENT LOCALNAMESPACEPATH (NAMESPACE+)> 
(defun encode-localnamespacepath (namespace-list)
  (eformat "<LOCALNAMESPACEPATH>~%")
  (dolist (namespace namespace-list)
    (encode-namespace namespace))
  (eformat "</LOCALNAMESPACEPATH>~%"))

;;<!ELEMENT HOST (#PCDATA)> 
(defun encode-host (host)
  (eformat "<HOST>~A</HOST>~%" host))

;;<!ELEMENT NAMESPACE EMPTY> 
;;<!ATTLIST NAMESPACE
;;    %CIMName;> 
(defun encode-namespace (namespace)
  (declare (type cim-namespace namespace))
  (eformat "<NAMESPACE NAME=\"~A\" />~%" (cim-name namespace)))

;;<!ELEMENT CLASSPATH (NAMESPACEPATH,CLASSNAME)>
(defun encode-classpath (namespace-path class-name)
  (eformat "<CLASSPATH>~%")
  (encode-namespacepath namespace-path)
  (encode-classname class-name)
  (eformat "</CLASSPATH>~%"))

;;<!ELEMENT LOCALCLASSPATH (LOCALNAMESPACEPATH, CLASSNAME)>
(defun encode-localclasspath (namespace-list class-name)
  (eformat "<LOCALCLASSPATH>~%")
  (encode-localnamespacepath namespace-list)
  (encode-classname class-name)
  (eformat "</LOCALCLASSPATH>~%"))

;;<!ELEMENT CLASSNAME EMPTY>
;;<!ATTLIST CLASSNAME
;;    %CIMName;>
(defun encode-classname (class-name)
  (eformat "<CLASSNAME NAME=\"~A\" />~%" class-name))

;;<!ELEMENT INSTANCEPATH (NAMESPACEPATH,INSTANCENAME)>
(defun encode-instancepath (namespace-path class-name key-slots)
  (eformat "<INSTANCEPATH>~%")
  (encode-namespacepath namespace-path)
  (encode-instancename class-name key-slots)
  (eformat "</INSTANCEPATH>~%"))

;;<!ELEMENT LOCALINSTANCEPATH (LOCALNAMESPACEPATH,INSTANCENAME)>
(defun encode-localinstancepath (namespace-list class-name key-slots)
  (eformat "<LOCALINSTANCEPATH>~%")
  (encode-localnamespacepath namespace-list)
  (encode-instancename class-name key-slots)
  (eformat "</LOCALINSTANCEPATH>~%"))

;;<!ELEMENT INSTANCENAME (KEYBINDING*|KEYVALUE?|VALUE.REFERENCE?)>
;;<!ATTLIST INSTANCENAME
;;    %ClassName;>
(defun encode-instancename (class-name key-slots)
  (eformat "<INSTANCENAME CLASSNAME=\"~A\">~%" class-name)
  (cond
	((cim-reference-p key-slots)
	 (encode-value.reference key-slots))
	((atom key-slots)
	 (encode-keyvalue key-slots))
	(t
	 (dolist (key-slot key-slots)
	   (encode-keybinding (car key-slot) (cdr key-slot)))))
  (eformat "</INSTANCENAME>~%"))

;;<!ELEMENT OBJECTPATH (INSTANCEPATH|CLASSPATH)>
(defun encode-objectpath (namespace-path class-name &optional key-slots)
  (eformat "<OBJECTPATH>~%")
  (if key-slots
	  (encode-instancepath namespace-path class-name key-slots)
	  (encode-classpath namespace-path class-name))
  (eformat "</OBJECTPATH>~%"))

;;<!ELEMENT KEYBINDING (KEYVALUE|VALUE.REFERENCE)>
;;<!ATTLIST KEYBINDING
;;    %CIMName;>
(defun encode-keybinding (name value)
  (eformat "<KEYBINDING NAME=\"~A\">~%" name)
  ;; FIXME: needs to handle value.reference values too!!!
  (encode-keyvalue value)
  (eformat "</KEYBINDING>~%"))

;;<!ELEMENT KEYVALUE (#PCDATA)>
;;<!ATTLIST KEYVALUE
;;     VALUETYPE    (string|boolean|numeric)  "string"
;;     %CIMType;    #IMPLIED>
(defun encode-keyvalue (value)
  (let ((tv (cond ((stringp value) (list "string" value))
				  ((numberp value) (list "numeric" value))
				  (t (list "boolean" (encode-boolean value))))))
	(eformat "<KEYVALUE VALUETYPE=\"~A\">~A</KEYVALUE>~%"
			 (first tv) (second tv))))

;;<!ELEMENT CLASS (QUALIFIER*,(PROPERTY|PROPERTY.ARRAY|PROPERTY.REFERENCE)*,METHOD*)>
;;<!ATTLIST CLASS 
;;    %CIMName;
;;    %SuperClass;>
(defun encode-class (class)
  (declare (type cim-class class))
  (let ((super-class (cim-class-superclasses class)))
	(if super-class
		(eformat "<CLASS NAME=\"~A\" SuperClass=\"~A\">~%"
				 (cim-name class)
				 (cim-name super-class))
		(eformat "<CLASS NAME=\"~A\">~%" (cim-name class))))
  (dolist (qualifier (cim-qualifiers class))
	(destructuring-bind (q . v) qualifier
	  (encode-qualifier q v)))
  (dolist (slot (cim-class-slots class))
	(encode-slot slot))
  (dolist (method (cim-class-methods class))
	(encode-method method))
  (eformat "</CLASS>~%"))

;;<!ELEMENT INSTANCE (QUALIFIER*,(PROPERTY|PROPERTY.ARRAY|PROPERTY.REFERENCE)*)>
;;<!ATTLIST INSTANCE
;;         %ClassName;
;;         xml:lang   NMTOKEN  #IMPLIED>
(defun encode-instance (instance)
  (let ((class (class-of instance)))
	(eformat "<INSTANCE CLASSNAME=\"~A\">~%" (cim-name class))
	(dolist (slot (cim-class-slots class))
	  (encode-property slot (slot-value instance (class-name slot))))
	(eformat "</INSTANCE>~%")))

;;<!ELEMENT QUALIFIER ((VALUE|VALUE.ARRAY)?)>
;;<!ATTLIST QUALIFIER 
;;     %CIMName;
;;     %CIMType;               #REQUIRED 
;;     %Propagated;
;;     %QualifierFlavor;
;;     xml:lang  NMTOKEN  #IMPLIED>
(defun encode-qualifier (qualifier value)
  (declare (type cim-qualifier qualifier))
  (let ((type (cim-qualifier-type qualifier)))
    (eformat "<QUALIFIER NAME=\"~A\" Type=\"~A\"/>~%"
	     (cim-name qualifier)
	     type)
    (encode-scope (cim-qualifier-scope qualifier))
    (cond
      ((and (listp type) (eq (car type) 'array))
       (encode-value.array value))
      ((eq type 'boolean)
       (encode-value (encode-boolean value)))
      (t
       (encode-value value))))
    (eformat "</QUALIFIER>~%"))

;;<!ELEMENT PROPERTY (QUALIFIER*,VALUE?)>
;;<!ATTLIST PROPERTY 
;;     %CIMName;
;;     %CIMType;           #REQUIRED 
;;     %ClassOrigin;
;;     %Propagated;
;;     %EmbeddedObject;
;;     xml:lang   NMTOKEN  #IMPLIED>
(defun encode-property (slot &optional value)
  (eformat "<PROPERTY NAME=\"~A\" TYPE=\"~A\">~%" (cim-name slot) (encode-type (cim-slot-type slot)))
  (dolist (qualifier (cim-qualifiers slot))
	(destructuring-bind (q . v) qualifier
	  (encode-qualifier q v)))
  (when (or value (eq (cim-slot-type slot) 'boolean))
	(encode-value value))
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
(defun encode-property.array (slot &optional value)
  (eformat "<PROPERTY.ARRAY NAME=\"~A\" TYPE=\"~A\">~%"
		   (cim-name slot)
		   (encode-type (cim-slot-type slot)))
  (dolist (qualifier (cim-qualifiers slot))
	(destructuring-bind (q . v) qualifier
	  (encode-qualifier q v)))
  (when value
	(encode-value.array value))
  (eformat "</PROPERTY.ARRAY>~%"))

;;<!ELEMENT PROPERTY.REFERENCE (QUALIFIER*,VALUE.REFERENCE?)>
;;<!ATTLIST PROPERTY.REFERENCE
;;     %CIMName;
;;     %ReferenceClass;
;;     %ClassOrigin;
;;     %Propagated;>
(defun encode-property.reference (slot &optional value)
  (eformat "<PROPERTY.REFERENCE NAME=\"~A\" REFERENCECLASS=\"~A\">~%"
		   (cim-name slot)
		   (cim-name (find-class (cim-slot-type slot))))
  (dolist (qualifier (cim-qualifiers slot))
	(destructuring-bind (q . v) qualifier
	  (encode-qualifier q v)))
  (when value
	(encode-value.reference value))
  (eformat "</PROPERTY.REFERENCE>~%"))
  

;; Lisp function to encode a Slot. It wraps the above 3 property calls
(defun encode-slot (slot &optional value)
  (let ((type (cim-slot-type slot)))
	(cond
	  ((and (listp type) (eq (car type) 'array))
	   (encode-property.array slot value))
	  ((subtypep type 'cim-primitive)
	   (encode-property slot value))
	  (t
	   ;; another type, must be a reference
	   (encode-property.reference slot value)))))

;;<!ELEMENT METHOD (QUALIFIER*,(PARAMETER|PARAMETER.REFERENCE|PARAMETER.ARRAY|PARAMETER.REFARRAY)*)>
;;<!ATTLIST METHOD 
;;     %CIMName;
;;     %CIMType;          #IMPLIED 
;;     %ClassOrigin;
;;     %Propagated;>
(defun encode-method (method)
  (eformat "<METHOD NAME=\"~A\">~%" (cim-name method))
  (dolist (qualifier (cim-qualifiers method))
	(destructuring-bind (q . v) qualifier
	  (encode-qualifier q v)))
  (dolist (parameter (cim-method-parameters method))
	(encode-parameter parameter))
  (eformat "</METHOD>~%"))

;;<!ELEMENT PARAMETER (QUALIFIER*)>
;;<!ATTLIST PARAMETER 
;;     %CIMName;
;;     %CIMType;      #REQUIRED>
(defun %encode-parameter (parameter)
  (eformat "<PARAMETER NAME=\"~A\" TYPE=\"~A\">~%"
	   (cim-name parameter)
	   (encode-type (cim-parameter-type parameter)))
  (dolist (qualifier (cim-qualifiers parameter))
    (destructuring-bind (q . val) qualifier
      (encode-qualifier q val)))
  (eformat "</PARAMETER>~%"))

;;<!ELEMENT PARAMETER.REFERENCE (QUALIFIER*)>
;;<!ATTLIST PARAMETER.REFERENCE
;;     %CIMName;
;;     %ReferenceClass;>
(defun encode-parameter.reference (parameter)
  (eformat "<PARAMETER.REFERENCE NAME=\"~A\" REFERENCECLASS=\"~A\">~%"
	   (cim-name parameter)
	   (cim-name (find-class (cim-parameter-type parameter))))
  (dolist (qualifier (cim-qualifiers parameter))
    (destructuring-bind (q . val) qualifier
      (encode-qualifier q val)))
  (eformat "</PARAMETER.REFERENCE>~%"))
  
;;<!ELEMENT PARAMETER.ARRAY (QUALIFIER*)>
;;<!ATTLIST PARAMETER.ARRAY
;;     %CIMName;
;;     %CIMType;           #REQUIRED
;;     %ArraySize;>
(defun encode-parameter.array (parameter)
  (eformat "<PARAMETER.ARRAY NAME=\"~A\" TYPE=\"~A\">~%"
	   (cim-name parameter)
	   (encode-type (cim-parameter-type parameter)))
  (dolist (qualifier (cim-qualifiers parameter))
    (destructuring-bind (q . val) qualifier
      (encode-qualifier q val)))
  (eformat "</PARAMETER.ARRAY>~%"))

;;<!ELEMENT PARAMETER.REFARRAY (QUALIFIER*)>
;;<!ATTLIST PARAMETER.REFARRAY
;;     %CIMName;
;;     %ReferenceClass;
;;     %ArraySize;>
(defun encode-parameter.refarray (parameter)
  (eformat "<PARAMETER.REFARRAY NAME=\"~A\" REFERENCECLASS=\"~A\">~%"
	   (cim-name parameter)
	   (cim-name (find-class (cim-parameter-type parameter))))
  (dolist (qualifier (cim-qualifiers parameter))
    (destructuring-bind (q . val) qualifier
      (encode-qualifier q val)))
  (eformat "</PARAMETER.REFARRAY>~%"))


;; Lisp function to wrap the above calls to the various parameter encoders
(defun encode-parameter (parameter)
  (let ((type (cim-parameter-type parameter)))
	(cond
	  ((and (listp type) (eq (car type) 'array))
	   (if (subtypep (cadr type) 'cim-primitive)
		   (encode-parameter.array parameter)
		   (encode-parameter.refarray parameter)))
	  ((subtypep type 'cim-primitive)
	   (%encode-parameter parameter))
	  (t
	   (encode-parameter.reference parameter)))))


;;<!ELEMENT MESSAGE (SIMPLEREQ|MULTIREQ|SIMPLERSP|MULTIRSP|
;;          SIMPLEEXPREQ|MULTIEXPREQ|SIMPLEEXPRSP|MULTIEXPRSP)>
;;<!ATTLIST MESSAGE
;;         ID             CDATA     #REQUIRED
;;         PROTOCOLVERSION CDATA     #REQUIRED>
(defun encode-message (message)
  (let ((request (cim-message-request message))
	(response (cim-message-response message)))
    (eformat "<MESSAGE ID=\"~A\" PROTOCOLVERSION=\"~A\">~%"
	     (cim-message-id message)
	     +protocol-version+)
    (cond
      ((consp request)
       ;; list of requests, i.e. a multireq node
       (encode-multireq request))
      ((atom request)
       (encode-simplereq request))
      ((consp response)
       ;; list of responses, i.e. a multirsp node
       (encode-multirsp response))
      ((atom response)
       (encode-simplersp response))
      (t (error "Unable to handle message ~S" message)))
    (eformat "</MESSAGE>~%")))


;;<!ELEMENT MULTIREQ (SIMPLEREQ,SIMPLEREQ+)>
(defun encode-multireq (request-list)
  (eformat "<MULTIREQ>~%")
  (dolist (req request-list)
    (encode-simplereq req))
  (eformat "</MULTIREQ>~%"))

;;<!ELEMENT SIMPLEREQ (METHODCALL|IMETHODCALL)>
(defun encode-simplereq (request)
  (eformat "<SIMPLEREQ>~%")
  (eformat "~A" request)
  (eformat "</SIMPLEREQ>~~%"))

;;<!ELEMENT METHODCALL ((LOCALCLASSPATH|LOCALINSTANCEPATH),PARAMVALUE*)>
;;<!ATTLIST METHODCALL
;;     %CIMName;>
(defun encode-methodcall (method-name reference param-values)
  "REFERENCE is a CIM-REFERNCE object.

PARAM-VALUES is a list of form (name value type)."
  (eformat "<METHODCALL NAME=\"~A\">~%" method-name)
  (let ((namespace (cim-reference-namespace reference))
		(class-name (cim-reference-classname reference)))
	(if (cim-reference-keyslots reference)
		(encode-localinstancepath (parse-namespace namespace)
								  class-name
								  (cim-reference-keyslots reference))
		(encode-localclasspath (parse-namespace namespace)
							   class-name)))
  (dolist (param-value param-values)
	(destructuring-bind (name value type) param-value
	  (encode-paramvalue name value type)))								
  (eformat "</METHODCALL>~%"))

;;<!ELEMENT PARAMVALUE (VALUE|VALUE.REFERENCE|VALUE.ARRAY|VALUE.REFARRAY)?>
;;<!ATTLIST PARAMVALUE
;;     %CIMName;
;;     %ParamType;    #IMPLIED
;;     %EmbeddedObject;>
(defun encode-paramvalue (name value type)
  (eformat "<PARAMVALUE NAME=\"~A\">~%" name)
  (cond
	((and (listp type) (eq (car type) 'array))
	 (if (subtypep (cadr type) 'cim-primitive)
		 (encode-value.array value)
		 (encode-value.refarray value)))
	((cim-reference-p value)
	 (encode-value.reference value))
	(t (encode-value value)))
  (eformat "</PARAMVALUE>~%"))

;;<!ELEMENT IMETHODCALL (LOCALNAMESPACEPATH,IPARAMVALUE*)>
;;<!ATTLIST IMETHODCALL
;;     %CIMName;>

;;<!ELEMENT IPARAMVALUE (VALUE|VALUE.ARRAY|VALUE.REFERENCE|CLASSNAME|INSTANCENAME|QUALIFIER.DECLARATION|
;;              CLASS|INSTANCE|VALUE.NAMEDINSTANCE)?>
;;<!ATTLIST IPARAMVALUE
;;     %CIMName;>

;; <!ELEMENT MULTIRSP (SIMPLERSP,SIMPLERSP+)>
(defun encode-multirsp (response-list)
  (eformat "<MULTIRSP>~%")
  (dolist (rsp response-list)
    (encode-simplersp rsp))
  (eformat "</MULTIRSP>~%"))

;;<!ELEMENT SIMPLERSP (METHODRESPONSE|IMETHODRESPONSE)>
(defun encode-simplersp (response)
  (eformat "<SIMPLERSP>~%")
  (eformat "~A~%" response)
  (eformat "</SIMPLERSP>~%"))

;;<!ELEMENT METHODRESPONSE (ERROR|(RETURNVALUE?,PARAMVALUE*))>
;;<!ATTLIST METHODRESPONSE
;;           %CIMName;>

;;<!ELEMENT IMETHODRESPONSE (ERROR|IRETURNVALUE?)>
;;<!ATTLIST IMETHODRESPONSE
;;           %CIMName;>

;;<!ELEMENT ERROR (INSTANCE*)
;;<!ATTLIST ERROR
;;              CODE        CDATA   #REQUIRED
;;              DESCRIPTION CDATA   #IMPLIED>
(defun encode-error (code &optional instances)
  (eformat "<ERROR CODE=\"~A\">~%" code)
  (when instances
	(dolist (instance instances)
	  (encode-instance instance)))
  (eformat "</ERROR>~%"))


;;<!ELEMENT RETURNVALUE (VALUE|VALUE.REFERENCE)>
;;<!ATTLIST RETURNVALUE
;;         %EmbeddedObject;
;;     %ParamType;     #IMPLIED>
(defun encode-returnvalue (value)
  (eformat "<RETURNVALUE>~%")
  (if (cim-reference-p value)
	  (encode-value.reference value)
	  (encode-value value))
  (eformat "</RETURNVALUE>~%"))
	  
;;<!ELEMENT IRETURNVALUE (CLASSNAME*|INSTANCENAME*|VALUE*|VALUE.OBJECTWITHPATH*|VALUE.OBJECTWITHLOCALPATH*
;;              VALUE.OBJECT*|OBJECTPATH*|QUALIFIER.DECLARATION*|VALUE.ARRAY?|VALUE.REFERENCE?|
;;               CLASS*|INSTANCE*|VALUE.NAMEDINSTANCE*)>



;;<!ELEMENT MULTIEXPREQ (SIMPLEEXPREQ,SIMPLEEXPREQ+)>

;;<!ELEMENT SIMPLEEXPREQ (EXPMETHODCALL)>

;;<!ELEMENT EXPMETHODCALL (EXPPARAMVALUE*)>
;;<!ATTLIST EXPMETHODCALL 
;;    %CIMName;>

;;<!ELEMENT MULTIEXPRSP (SIMPLEEXPRSP,SIMPLEEXPRSP+)>

;;<!ELEMENT SIMPLEEXPRSP (EXPMETHODRESPONSE)>

;;<!ELEMENT EXPMETHODRESPONSE (ERROR|IRETURNVALUE?)>
;;<!ATTLIST EXPMETHODRESPONSE
;;      %CIMName;>

;;<!ELEMENT EXPPARAMVALUE (INSTANCE?)>
;;<!ATTLIST EXPPARAMVALUE 
;;    %CIMName;>

