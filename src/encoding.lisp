

(defpackage :climbe.encoding.cimxml
  (:use :cl :climbe))

(in-package :climbe.encoding.cimxml)

;; structure for holding CIM messages in
(defstruct cim-message 
  request response id)



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

;;<!ELEMENT VALUE.REFARRAY (VALUE.REFERENCE*)>

;;<!ELEMENT VALUE.OBJECT (CLASS|INSTANCE)>

;;<!ELEMENT VALUE.NAMEDINSTANCE (INSTANCENAME,INSTANCE)>

;;<!ELEMENT VALUE.NAMEDOBJECT (CLASS|(INSTANCENAME,INSTANCE))>

;;<!ELEMENT VALUE.OBJECTWITHPATH ((CLASSPATH,CLASS)|(INSTANCEPATH,INSTANCE))>

;;<!ELEMENT VALUE.OBJECTWITHLOCALPATH ((LOCALCLASSPATH,CLASS)|(LOCALINSTANCEPATH,INSTANCE))>

;;<!ELEMENT VALUE.NULL EMPTY>
(defun encode-null ()
  (eformat "<VALUE.NULL />~%"))

;;<!ELEMENT NAMESPACEPATH (HOST,LOCALNAMESPACEPATH)> 
(defun encode-namespacepath (host namespace-list)
  (eformat "<NAMESPACEPATH>~%")
  (encode-host host)
  (encode-localnamespacepath namespace-list)
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

;;<!ELEMENT LOCALCLASSPATH (LOCALNAMESPACEPATH, CLASSNAME)>

;;<!ELEMENT CLASSNAME EMPTY>
;;<!ATTLIST CLASSNAME
;;    %CIMName;>
(defun encode-classname (class-name)
  (eformat "<CLASSNAME NAME=\"~A\" />~%" class-name))

;;<!ELEMENT INSTANCEPATH (NAMESPACEPATH,INSTANCENAME)>

;;<!ELEMENT LOCALINSTANCEPATH (LOCALNAMESPACEPATH,INSTANCENAME)>

;;<!ELEMENT INSTANCENAME (KEYBINDING*|KEYVALUE?|VALUE.REFERENCE?)>
;;<!ATTLIST INSTANCENAME
;;    %ClassName;>

;;<!ELEMENT OBJECTPATH (INSTANCEPATH|CLASSPATH)>

;;<!ELEMENT KEYBINDING (KEYVALUE|VALUE.REFERENCE)>
;;<!ATTLIST KEYBINDING
;;    %CIMName;>

;;<!ELEMENT KEYVALUE (#PCDATA)>
;;<!ATTLIST KEYVALUE
;;     VALUETYPE    (string|boolean|numeric)  "string"
;;     %CIMType;    #IMPLIED>

;;<!ELEMENT CLASS (QUALIFIER*,(PROPERTY|PROPERTY.ARRAY|PROPERTY.REFERENCE)*,METHOD*)>
;;<!ATTLIST CLASS 
;;    %CIMName;
;;    %SuperClass;>

;;<!ELEMENT INSTANCE (QUALIFIER*,(PROPERTY|PROPERTY.ARRAY|PROPERTY.REFERENCE)*)>
;;<!ATTLIST INSTANCE
;;         %ClassName;
;;         xml:lang   NMTOKEN  #IMPLIED>

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
    (eformat "</QUALIFIER>~%")))

;;<!ELEMENT PROPERTY (QUALIFIER*,VALUE?)>
;;<!ATTLIST PROPERTY 
;;     %CIMName;
;;     %CIMType;           #REQUIRED 
;;     %ClassOrigin;
;;     %Propagated;
;;     %EmbeddedObject;
;;     xml:lang   NMTOKEN  #IMPLIED>
			  
;;<!ELEMENT PROPERTY.ARRAY (QUALIFIER*,VALUE.ARRAY?)>
;;<!ATTLIST PROPERTY.ARRAY 
;;    %CIMName;
;;    %CIMType;           #REQUIRED 
;;    %ArraySize;
;;    %ClassOrigin;
;;    %Propagated;
;;    %EmbeddedObject;
;;    xml:lang   NMTOKEN  #IMPLIED>

;;<!ELEMENT PROPERTY.REFERENCE (QUALIFIER*,VALUE.REFERENCE?)>
;;<!ATTLIST PROPERTY.REFERENCE
;;     %CIMName;
;;     %ReferenceClass;
;;     %ClassOrigin;
;;     %Propagated;>

;;<!ELEMENT METHOD (QUALIFIER*,(PARAMETER|PARAMETER.REFERENCE|PARAMETER.ARRAY|PARAMETER.REFARRAY)*)>
;;<!ATTLIST METHOD 
;;     %CIMName;
;;     %CIMType;          #IMPLIED 
;;     %ClassOrigin;
;;     %Propagated;>

;;<!ELEMENT PARAMETER (QUALIFIER*)>
;;<!ATTLIST PARAMETER 
;;     %CIMName;
;;     %CIMType;      #REQUIRED>
(defun encode-parameter (parameter)
  (eformat "<PARAMETER NAME=\"~A\" TYPE=\"~A\">~%"
	   (cim-name parameter) (cim-parameter-type parameter))
  (dolist (qualifier (cim-qualifiers parameter))
    (destructuring-bind (q . val) qualifier
      (encode-qualifier q val)))
  (eformat "</PARAMETER>~%"))

;;<!ELEMENT PARAMETER.REFERENCE (QUALIFIER*)>
;;<!ATTLIST PARAMETER.REFERENCE
;;     %CIMName;
;;     %ReferenceClass;>

;;<!ELEMENT PARAMETER.ARRAY (QUALIFIER*)>
;;<!ATTLIST PARAMETER.ARRAY
;;     %CIMName;
;;     %CIMType;           #REQUIRED
;;     %ArraySize;>

;;<!ELEMENT PARAMETER.REFARRAY (QUALIFIER*)>
;;<!ATTLIST PARAMETER.REFARRAY
;;     %CIMName;
;;     %ReferenceClass;
;;     %ArraySize;>

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

;;<!ELEMENT PARAMVALUE (VALUE|VALUE.REFERENCE|VALUE.ARRAY|VALUE.REFARRAY)?>
;;<!ATTLIST PARAMVALUE
;;     %CIMName;
;;     %ParamType;    #IMPLIED
;;     %EmbeddedObject;>

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
(defun encode-error (cim-error)
  (eformat "<ERROR CODE=\"~A\" DESCRIPTION=\"~A\">~%" 
	   (cim-error-code cim-error)
	   (cim-error-description cim-error))
  (eformat "</ERROR>~%"))


;;<!ELEMENT RETURNVALUE (VALUE|VALUE.REFERENCE)>
;;<!ATTLIST RETURNVALUE
;;         %EmbeddedObject;
;;     %ParamType;     #IMPLIED>

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

