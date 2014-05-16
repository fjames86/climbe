;;;; -*- mode: lisp -*-
;;;;
;;;; This is a Common Lisp implementation of a Common Information Model (CIM)
;;;; client and server. It contains a CIM-XML encoding/decoding support and
;;;; transport over WBEM. It uses the Common Lisp libraries Drakma and Hunchentoot
;;;; for HTTP/HTTPS transport.
;;;; See documentation under /notes for implementation details and /examples for
;;;; sample code.
;;;; 
;;;; Copyright (C) 2013, Frank James <frank.a.james@gmail.com>
;;;;
;;;; You are granted the rights to distribute and use this software
;;;; as governed by the terms of the Lisp Lesser General Public License
;;;; (http://opensource.franz.com/preamble.html), also known as the LLGPL.


(in-package :climbe)

;; the DTD version of the CIMXML encoding used
(defparameter *cim-dtd* "2.0")
;; the CIM schema version
(defparameter *cim-schema-version* "2.0")
(defparameter *cim-protocol-version* "1.0")

(defun tag-name (tag) (car tag))
(defun tag-attributes (tag) (cadr tag))
(defun tag-contents (tag) (caddr tag))
(defun find-tag (tagname tags) (assoc tagname tags))
(defun find-tag* (tagname tag) (find-tag tagname (tag-contents tag)))
(defun find-attribute (name tag) (cdr (assoc name (tag-attributes tag))))

;; intervals: ddddddddhhmmss.mmmmmm:000
;; absolute:  yyyymmddhhmmss.mmmmmmsutc
(defclass cim-datetime ()
  ((year :initarg :year :accessor cim-datetime-year)
   (month :initarg :month :accessor cim-datetime-month)
   (day :initarg :day :accessor cim-datetime-day)
   (hour :initarg :hour :accessor cim-datetime-hour)
   (minute :initarg :minute :accessor cim-datetime-minute)
   (second :initarg :second :accessor cim-datetime-second)
   (msecs :initarg :msecs :accessor cim-datetime-msecs)
   (interval :initarg :interval :initform nil :accessor cim-datetime-interval)))
  
(defun datetime-string (datetime)
  "Cnvert a datetime to a string"
  (if (cim-datetime-interval datetime)
	  (format nil "~8,'0D~2,'0D~2,'0D~2,'0D.~6,'0D:000"
			  (cim-datetime-day datetime)
			  (cim-datetime-hour datetime)
			  (cim-datetime-minute datetime)
			  (cim-datetime-second datetime)
			  (cim-datetime-msecs datetime))
	  (format nil "~4,'0D~2,'0D~2,'0D~2,'0D~2,'0D~2,'0D.~6,'0Dsutc"
			  (cim-datetime-year datetime)
			  (cim-datetime-month datetime)
			  (cim-datetime-day datetime)
			  (cim-datetime-hour datetime)
			  (cim-datetime-minute datetime)
			  (cim-datetime-second datetime)
			  (cim-datetime-msecs datetime))))

(defun string-datetime (string)
  "Generate a string representation of a datetime"
  (unless (= (length string) 25)
	(error "datetime strings should be 25 chars"))
  (let ((end (subseq string 21))
		(interval nil))
	(cond
	  ((string-equal end ":000")
	   (setf interval t))
	  ((not (string-equal end "sutc"))
	   (error "invalid datetime string")))

	(if interval
		;; intervals: ddddddddhhmmss.mmmmmm:000
		(let ((d (subseq string 0 8))
			  (h (subseq string 8 10))
			  (m (subseq string 10 12))
			  (s (subseq string 12 14))
			  (mm (subseq string 15 21)))				
		  (make-instance 'cim-datetime
						 :day (parse-integer d)
						 :hour (parse-integer h)
						 :minute (parse-integer m)
						 :second (parse-integer s)
						 :msecs (parse-integer mm)))
		;; absolute:  yyyymmddhhmmss.mmmmmmsutc
		(let ((y (subseq string 0 4))
			  (mth (subseq string 4 6))
			  (d (subseq string 6 8))
			  (h (subseq string 8 10))
			  (m (subseq string 10 12))
			  (s (subseq string 12 14))
			  (mm (subseq string 15 21)))				
		(make-instance 'cim-datetime
					   :year (parse-integer y)
					   :month (parse-integer mth)
					   :day (parse-integer d)
					   :hour (parse-integer h)
					   :minute (parse-integer m)
					   :second (parse-integer s)
					   :msecs (parse-integer mm))))))
					  
(defmethod print-object ((cim cim-datetime) stream)
  (print-unreadable-object (cim stream :type t)
	(format stream "~A" (datetime-string cim))))

(defun cim-datetime-p (cim)
  (typep cim 'cim-datetime))

;; -----------------------------------------------------------
;; try to support all these http://www.dmtf.org/sites/default/files/standards/documents/DSP201.html


;;<!ELEMENT CIM (MESSAGE|DECLARATION)>
;;<!ATTLIST CIM
;;         CIMVERSION CDATA #REQUIRED 
;;         DTDVERSION CDATA #REQUIRED>
(defun encode-cimxml (message stream)
  "Top level entry point encoding function"
  (format stream "<CIM CIMVERSION=~S DTDVERSION=~S>~%" *cim-schema-version* *cim-dtd*)
  (encode-cimxml-message message stream)
  (format stream "</CIM>~%"))

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

;;<!ELEMENT SCOPE EMPTY>
;;<!ATTLIST SCOPE 
;;         CLASS        (true|false)      "false"
;;         ASSOCIATION  (true|false)      "false"
;;         REFERENCE    (true|false)      "false"
;;         PROPERTY     (true|false)      "false"
;;         METHOD       (true|false)      "false"
;;         PARAMETER    (true|false)      "false"
;;         INDICATION   (true|false)      "false">

;;<!ELEMENT VALUE (#PCDATA)>
(defun encode-cimxml-value (value stream)
  (format stream "<VALUE>")
  (cond
    ;; if it's a string then we need proper xml encoding
    ((stringp value) (s-xml:print-string-xml value stream))
    ;; numbers (ints or reals) are easy
    ((numberp value) (format stream "~A" value))
    ;; datetimes need converting to a string first
    ((cim-datetime-p value) (format stream "~A" (datetime-string value)))
    ;; booleans
    (t (if value (format stream "true") (format stream "false"))))
  (format stream "</VALUE>~%"))

;;<!ELEMENT VALUE.ARRAY (VALUE*)>
(defun encode-cimxml-value-array (list stream)
  (format stream "<VALUE.ARRAY>~%")
  (dolist (value list)
	(encode-cimxml-value value stream))
  (format stream "</VALUE.ARRAY>~%"))
  
;;<!ELEMENT VALUE.REFERENCE (CLASSPATH|LOCALCLASSPATH|CLASSNAME|INSTANCEPATH|LOCALINSTANCEPATH|INSTANCENAME)>
(defun encode-cimxml-value-reference (reference stream)
  (format stream "<VALUE.REFERENCE>~%")
  (cond
    ((null (cim-namespace reference))
     ;; classname
     (encode-cimxml-classname (cim-name reference) stream))
    ((cim-keys reference)
     ;; instancepath/localinstancepath/instancename
     (if (cim-host reference)
	 (encode-cimxml-instancepath reference stream)
	 (encode-cimxml-localinstancepath reference stream)))
    (t
     ;; classpath/localclasspath
     (if (cim-host reference)
	 (encode-cimxml-classpath (cim-name reference)
				  (cim-namespace reference)
				  (cim-host reference)
				  stream)
	 (encode-cimxml-localclasspath (cim-name reference)
				       (cim-namespace reference)
				       stream))))
  (format stream "</VALUE.REFERENCE>~%"))

;;<!ELEMENT VALUE.REFARRAY (VALUE.REFERENCE*)>
(defun encode-cimxml-value-refarray (list stream)
  (format stream "<VALUE.REFARRAY>~%")
  (dolist (ref list)
    (encode-cimxml-value-reference ref stream))
  (format stream "</VALUE.REFARRAY>~%"))

;;<!ELEMENT VALUE.OBJECT (CLASS|INSTANCE)>
(defun encode-cimxml-value-object (object stream)
  (format stream "<VALUE.OBJECT>~%")
  (cond
    ((cim-class-p object)
     (encode-cimxml-class object stream))
    ((cim-instance-p object)
     (encode-cimxml-instance object stream))
    (t (error "OBJECT must be a CIM class or instance"))))

;;<!ELEMENT VALUE.NAMEDINSTANCE (INSTANCENAME,INSTANCE)>
(defun encode-cimxml-value-namedinstance (reference instance stream)
  (format stream "<VALUE.NAMEDINSTANCE>~%")
  (encode-cimxml-instancename (cim-name instance)
			      (cim-keys reference)
			      stream)
  (encode-cimxml-instance instance stream)  
  (format stream "</VALUE.NAMEDINSTANCE>~%"))


;;<!ELEMENT VALUE.NAMEDOBJECT (CLASS|(INSTANCENAME,INSTANCE))>
(defun encode-cimxml-value-namedobject (reference object stream)
  (format stream "<VALUE.NAMEDOBJECT>~%")
  (cond
    ((cim-class-p object)
     (encode-cimxml-class object stream))
    ((cim-instance-p object)
     (encode-cimxml-instancename object
				 (cim-keys reference)
				 stream)
     (encode-cimxml-instance object stream))
    (t (error "Must be a class or instance")))
  (format stream "</VALUE.NAMEDOBJECT>~%"))

;;<!ELEMENT VALUE.OBJECTWITHPATH ((CLASSPATH,CLASS)|(INSTANCEPATH,INSTANCE))>
(defun encode-cimxml-value-objectwithpath (reference object stream)
  (format stream "<VALUE.OBJECTWITHPATH>~%")
  (cond
    ((cim-class-p object)
     (encode-cimxml-classpath (cim-host reference) (cim-namespace reference) (cim-name reference) stream)
     (encode-cimxml-class object stream))
    ((cim-instance-p object)
     (encode-cimxml-instancepath reference stream)
     (encode-cimxml-instance object stream))
    (t (error "Must be a class or instance")))
  (format stream "</VALUE.OBJECTWITHPATH>~%"))

;;<!ELEMENT VALUE.OBJECTWITHLOCALPATH ((LOCALCLASSPATH,CLASS)|(LOCALINSTANCEPATH,INSTANCE))>
(defun encode-cimxml-value-objectwithlocalpath (reference object stream)
  (format stream "<VALUE.OBJECTWITHLOCALPATH>~%")
  (cond
    ((cim-class-p object)
     (encode-cimxml-localclasspath (cim-namespace reference) (cim-name reference) stream)
     (encode-cimxml-class object stream))
    ((cim-instance-p object)
     (encode-cimxml-localinstancepath reference stream)
     (encode-cimxml-instance object stream))
    (t (error "Must be a class or instance")))
  (format stream "</VALUE.OBJECTWITHLOCALPATH>~%"))

;;<!ELEMENT VALUE.NULL EMPTY>
(defun encode-cimxml-value-null (stream)
  (format stream "<VALUE.NULL></VALUE.NULL>~%"))

;;<!ELEMENT NAMESPACEPATH (HOST,LOCALNAMESPACEPATH)> 
(defun encode-cimxml-namespacepath (host namespace stream)
  (format stream "<NAMESPACEPATH>~%")
  (encode-cimxml-host host stream)
  (encode-cimxml-localnamespacepath namespace stream)
  (format stream "</NAMESPACEPATH>~%"))

;;<!ELEMENT LOCALNAMESPACEPATH (NAMESPACE+)> 
(defun encode-cimxml-localnamespacepath (namespace stream)
  (format stream "<LOCALNAMESPACEPATH>~%")
  (dolist (n (string-split (string namespace) #\/))
    (encode-cimxml-namespace n stream))
  (format stream "</LOCALNAMESPACEPATH>~%"))

;;<!ELEMENT HOST (#PCDATA)> 
(defun encode-cimxml-host (host stream)
  (format stream "<HOST>~A</HOST>~%" host))

;;<!ELEMENT NAMESPACE EMPTY> 
;;<!ATTLIST NAMESPACE
;;    %CIMName;> 
(defun encode-cimxml-namespace (namespace stream)
  (format stream "<NAMESPACE NAME=~S/>~%" namespace))

;;<!ELEMENT CLASSPATH (NAMESPACEPATH,CLASSNAME)>
(defun encode-cimxml-classpath (host namespace classname stream)
  (format stream "<CLASSPATH>~%")
  (encode-cimxml-namespacepath host namespace stream)
  (encode-cimxml-classname classname stream)
  (format stream "</CLASSPATH>~%"))
		  
;;<!ELEMENT LOCALCLASSPATH (LOCALNAMESPACEPATH, CLASSNAME)>
(defun encode-cimxml-localclasspath (namespace classname stream)
  (format stream "<LOCALCLASSPATH>~%")
  (encode-cimxml-localnamespacepath namespace stream)
  (encode-cimxml-classname classname stream)
  (format stream "</LOCALCLASSPATH>~%"))

;;<!ELEMENT CLASSNAME EMPTY>
;;<!ATTLIST CLASSNAME
;;    %CIMName;>
(defun encode-cimxml-classname (classname stream)
  (format stream "<CLASSNAME NAME=\"~A\" />~%" classname))

;;<!ELEMENT INSTANCEPATH (NAMESPACEPATH,INSTANCENAME)>
(defun encode-cimxml-instancepath (reference stream)
  (format stream "<INSTANCEPATH>~%")
  (encode-cimxml-namespacepath (cim-host reference)
			       (cim-namespace reference)
			       stream)
  (encode-cimxml-instancename (cim-name reference)
			      (cim-keys reference)
			      stream)
  (format stream "</INSTANCEPATH>~%"))

;;<!ELEMENT LOCALINSTANCEPATH (LOCALNAMESPACEPATH,INSTANCENAME)>
(defun encode-cimxml-localinstancepath (reference stream)
  (format stream "<LOCALINSTANCEPATH>~%")
  (encode-cimxml-localnamespacepath (cim-namespace reference) stream)
  (encode-cimxml-instancename (cim-name reference)
			      (cim-keys reference)
			      stream)
  (format stream "</LOCALINSTANCEPATH>~%"))

;;<!ELEMENT INSTANCENAME (KEYBINDING*|KEYVALUE?|VALUE.REFERENCE?)>
;;<!ATTLIST INSTANCENAME
;;    %ClassName;>
(defun encode-cimxml-instancename (classname keyvalues stream)
  (format stream "<INSTANCENAME CLASSNAME=~S>~%" classname)
  ;; need to know the KEY properties. need to get the class definition this instance corresponds to  
  (mapc (lambda (keyvalue)
	  (destructuring-slot (name type value) keyvalue
	    (declare (ignore type))
	    (encode-cimxml-keybinding name value stream)))
	keyvalues)
  (format stream "</INSTANCENAME>~%"))

;;<!ELEMENT OBJECTPATH (INSTANCEPATH|CLASSPATH)>
(defun encode-cimxml-objectpath (reference stream)
  (format stream "<OBJECTPATH>~%")
  (aif (cim-keys reference)
       (encode-cimxml-instancepath reference stream)
       (encode-cimxml-classpath (cim-host reference)
				(cim-namespace reference)
				(cim-name reference)
				stream))
  (format stream "</OBJECTPATH>~%"))

;;<!ELEMENT KEYBINDING (KEYVALUE|VALUE.REFERENCE)>
;;<!ATTLIST KEYBINDING
;;    %CIMName;>
(defun encode-cimxml-keybinding (name value stream)
  (format stream "<KEYBINDING NAME=~S>~%" name)
  (if (cim-instance-p value)
	  (encode-cimxml-value-reference value stream)
	  (encode-cimxml-keyvalue value stream))
  (format stream "</KEYBINDING>~%"))

;;<!ELEMENT KEYVALUE (#PCDATA)>
;;<!ATTLIST KEYVALUE
;;     VALUETYPE    (string|boolean|numeric)  "string"
;;     %CIMType;    #IMPLIED>
(defun encode-cimxml-keyvalue (value stream)
  (let ((type (cond
		((stringp value) "string")
		((numberp value) "numeric")
		(t "boolean"))))
    (format stream "<KEYVALUE VALUETYPE=~S>~A</KEYVALUE>~%"
	    type (if (string= type "boolean")
		     (if value "true" "false")
		     value))))

;;<!ELEMENT CLASS (QUALIFIER*,(PROPERTY|PROPERTY.ARRAY|PROPERTY.REFERENCE)*,METHOD*)>
;;<!ATTLIST CLASS 
;;    %CIMName;
;;    %SuperClass;>
(defun encode-cimxml-class (class stream)
  (format stream "<CLASS NAME=\"~A\"" (cim-name class))
  (awhen (cim-superclass class)
	(format stream " SUPERCLASS=\"~S\"" it))
  (format stream ">~%")

  ;; encode qualifiers
  (loop for (q . v) in (cim-qualifiers class)
	 do (encode-cimxml-qualifier q v stream))

  ;; encode properties
  (dolist (property (cim-properties class))
    (let ((type (cim-property-type property)))
      (cond
	((cim-primitive-p type) 
	 (encode-cimxml-property property stream))
	((cim-refarray-p type)
	 (error "Cannot have ref array properties"))
	((cim-array-p type)
	 (encode-cimxml-property-array property stream))
	((cim-ref-p type)
	 (encode-cimxml-property-reference property stream))
	(t (error "Invalid property type")))))

  ;; encode methods
  (dolist (method (cim-methods class))
	(encode-cimxml-method method stream))
  
  (format stream "</CLASS>~%"))

;;<!ELEMENT INSTANCE (QUALIFIER*,(PROPERTY|PROPERTY.ARRAY|PROPERTY.REFERENCE)*)>
;;<!ATTLIST INSTANCE
;;         %ClassName;
;;         xml:lang   NMTOKEN  #IMPLIED>
(defun encode-cimxml-instance (instance stream)
  (format stream "<INSTANCE CLASSNAME=~S>~%" (cim-name instance))
  ;; need the class definition for the instance in order to know its properties
  (dolist (slot (cim-slots instance))
	(destructuring-slot (name type val) slot
	  (let ((property (cim-slot-property slot)))
		(cond
		  ((cim-primitive-p type)
		   (encode-cimxml-property property stream))
		((cim-array-p type)
		 (encode-cimxml-property-array property stream))
		((cim-ref-p type)
		 (encode-cimxml-property-reference property stream))
		(t (error "Invalid property type ~S" type))))))
  (format stream "</INSTANCE>~%"))

;;<!ELEMENT QUALIFIER ((VALUE|VALUE.ARRAY)?)>
;;<!ATTLIST QUALIFIER 
;;     %CIMName;
;;     %CIMType;               #REQUIRED 
;;     %Propagated;
;;     %QualifierFlavor;
;;     xml:lang  NMTOKEN  #IMPLIED>
(defun encode-cimxml-qualifier (qualifier-name value stream)
  (destructuring-qualifier (name string type default qualifiers) (cim-qualifier-by-name qualifier-name)
    (format stream "<QUALIFIER NAME=~S TYPE=~S>~%"
	    string
	    (cond
	      ((cim-primitive-p type)
	       (cim-primitive-string type))
	      ((cim-array-p type)
	       (cim-primitive-string (cim-array-type type)))))
    (if (cim-array-p type)
	(encode-cimxml-value-array value stream)
	(encode-cimxml-value value stream))
    (format stream "</QUALIFIER>~%")))

;;<!ELEMENT PROPERTY (QUALIFIER*,VALUE?)>
;;<!ATTLIST PROPERTY 
;;     %CIMName;
;;     %CIMType;           #REQUIRED 
;;     %ClassOrigin;
;;     %Propagated;
;;     %EmbeddedObject;
;;     xml:lang   NMTOKEN  #IMPLIED>
(defun encode-cimxml-property (property stream)
  (destructuring-property (name type qualifiers origin value) property
    (format stream "<PROPERTY NAME=\"~A\" TYPE=\"~A\"" name (cim-primitive-string type))

	(when origin
	  (format stream " CLASSORIGIN=\"~A\"" origin))

	(format stream ">~%")
	  
    ;; qualifiers
    (loop for (q . v) in qualifiers
       do (encode-cimxml-qualifier q v stream))

    ;; default value
    (when value (encode-cimxml-value value stream))

    (format stream "</PROPERTY>~%")))
			  
;;<!ELEMENT PROPERTY.ARRAY (QUALIFIER*,VALUE.ARRAY?)>
;;<!ATTLIST PROPERTY.ARRAY 
;;    %CIMName;
;;    %CIMType;           #REQUIRED 
;;    %ArraySize;
;;    %ClassOrigin;
;;    %Propagated;
;;    %EmbeddedObject;
;;    xml:lang   NMTOKEN  #IMPLIED>
(defun encode-cimxml-property-array (property stream)
  (destructuring-property (name type qualifiers origin value) property 
    (format stream "<PROPERTY.ARRAY NAME=\"~A\" TYPE=\"~A\""
	    name (cim-primitive-string (cim-array-type type)))

    (when origin 
      (format stream " CLASSORIGIN=\"~A\"" origin))

    (awhen (cim-array-length type)
      (format stream " ARRAYSIZE=\"~A\"" it))
    (format stream ">~%")

    ;; encode the qualifiers
    (dolist (qualifier qualifiers)
      (destructuring-bind (q . v) qualifier
	(encode-cimxml-qualifier q v stream)))

    ;; encode the default value
    (when value
      (encode-cimxml-value-array value stream))

    (format stream "</PROPERTY.ARRAY>~%")))

;;<!ELEMENT PROPERTY.REFERENCE (QUALIFIER*,VALUE.REFERENCE?)>
;;<!ATTLIST PROPERTY.REFERENCE
;;     %CIMName;
;;     %ReferenceClass;
;;     %ClassOrigin;
;;     %Propagated;>
(defun encode-cimxml-property-reference (property stream)
  (destructuring-property (name type qualifiers origin value) property 
    (format stream "<PROPERTY.REFERENCE NAME=\"~A\" REFERENCECLASS=\"~A\""
	    name (cim-ref-class type))
    (when origin
      (format stream "CLASSORIGIN=\"~A\"" origin))
    (format stream ">~%")

    (dolist (qualifier qualifiers)
      (destructuring-bind (q . v) qualifier
	(encode-cimxml-qualifier q v stream)))

    (when value
      (encode-cimxml-value-reference value stream))

    (format stream "</PROPERTY.REFERENCE>~%")))

;;<!ELEMENT METHOD (QUALIFIER*,(PARAMETER|PARAMETER.REFERENCE|PARAMETER.ARRAY|PARAMETER.REFARRAY)*)>
;;<!ATTLIST METHOD 
;;     %CIMName;
;;     %CIMType;          #IMPLIED 
;;     %ClassOrigin;
;;     %Propagated;>
(defun encode-cimxml-method (method stream)
  (destructuring-method (name return-type parameters qualifiers function origin) method
    (format stream "<METHOD NAME=\"~A\" TYPE=\"~A\""
	    name (cim-primitive-string return-type))

    (when origin
      (format stream "CLASSORIGIN=\"~A\"" origin))
    (format stream ">~%")

    ;; qualifiers
    (dolist (qualifier qualifiers)
      (destructuring-bind (q . v) qualifier 
	(encode-cimxml-qualifier q v stream)))
  
    ;; encode the parameters
    (dolist (parameter parameters)
      ;; depending on the type of the parameters
      (let ((type (cim-parameter-type parameter)))
	(cond
	  ((cim-primitive-p type)
	   (encode-cimxml-parameter parameter stream))
	  ((cim-refarray-p type)
	   (encode-cimxml-parameter-refarray parameter stream))
	  ((cim-array-p type)
	   (encode-cimxml-parameter-array parameter stream))
	  ((cim-ref-p type)
	   (encode-cimxml-parameter-reference parameter stream))
	  (t (error "Invalid type ~S" type)))))
  
  (format stream "</METHOD>~%")))

;;<!ELEMENT PARAMETER (QUALIFIER*)>
;;<!ATTLIST PARAMETER 
;;     %CIMName;
;;     %CIMType;      #REQUIRED>
(defun encode-cimxml-parameter (parameter stream)
  (destructuring-parameter (name type qualifiers) parameter
    (format stream "<PARAMETER NAME=\"~A\" TYPE=\"~A\">~%"
	    name (cim-primitive-string type))
    
    (dolist (qualifier qualifiers)
      (destructuring-bind (q . v) qualifier
	(encode-cimxml-qualifier q v stream)))

    (format stream "</PARAMETER>~%")))

;;<!ELEMENT PARAMETER.REFERENCE (QUALIFIER*)>
;;<!ATTLIST PARAMETER.REFERENCE
;;     %CIMName;
;;     %ReferenceClass;>
(defun encode-cimxml-parameter-reference (parameter stream)
  (destructuring-parameter (name type qualifiers) parameter
    (format stream "<PARAMETER.REFERENCE NAME=\"~A\" REFERENCECLASS=\"~A\">~%"
	    name (cim-ref-class type))

    (dolist (qualifier qualifiers)
      (destructuring-bind (q . v) qualifier
	(encode-cimxml-qualifier q v stream)))

    (format stream "</PARAMETER.REFERENCE>~%")))

;;<!ELEMENT PARAMETER.ARRAY (QUALIFIER*)>
;;<!ATTLIST PARAMETER.ARRAY
;;     %CIMName;
;;     %CIMType;           #REQUIRED
;;     %ArraySize;>
(defun encode-cimxml-parameter-array (parameter stream)
  (destructuring-parameter (name type qualifiers) parameter
      (format stream "<PARAMETER.ARRAY NAME=\"~A\" TYPE=\"~A\""
	      name (cim-primitive-string (cim-array-type type)))
    (awhen (cim-array-length type)
      (format stream "ARRAYSIZE=~A" it))
    (format stream ">~%")
  
    (dolist (qualifier qualifiers)
      (destructuring-bind (q . v) qualifier
	(encode-cimxml-qualifier q v stream)))
    
    (format stream "</PARAMETER.ARRAY>~%")))

;;<!ELEMENT PARAMETER.REFARRAY (QUALIFIER*)>
;;<!ATTLIST PARAMETER.REFARRAY
;;     %CIMName;
;;     %ReferenceClass;
;;     %ArraySize;>
(defun encode-cimxml-parameter-refarray (parameter stream)
  (destructuring-parameter (name type qualifiers) parameter
    (format stream "<PARAMETER.REFARRAY NAME=\"~A\" REFERENCECLASS=\"~A\"" 
	    name (cim-ref-class (cim-array-type type)))
    (awhen (cim-array-length type)
      (format stream "ARRAYSIZE=~A" it))
    (format stream ">~%")
  
  (dolist (qualifier qualifiers)
    (destructuring-bind (q . v) qualifier
      (encode-cimxml-qualifier q v stream)))
  
  (format stream "</PARAMETER.REFARRAY>~%")))

;;<!ELEMENT MESSAGE (SIMPLEREQ|MULTIREQ|SIMPLERSP|MULTIRSP|
;;          SIMPLEEXPREQ|MULTIEXPREQ|SIMPLEEXPRSP|MULTIEXPRSP)>
;;<!ATTLIST MESSAGE
;;         ID             CDATA     #REQUIRED
;;         PROTOCOLVERSION CDATA     #REQUIRED>
(defun encode-cimxml-message (message stream)
  (format stream "<MESSAGE ID=\"~A\" PROTOCOLVERSION=~S>~%" (cim-message-id message) *cim-protocol-version*)
  ;; depending on whether its a request or a response
  (let ((contents (cim-message-contents message)))
    (acond
     ((cim-request-p contents)
      (encode-cimxml-simplereq contents stream))
     ((cim-response-p contents)
      (encode-cimxml-simplersp contents stream))
     (t (error "Must be a request or response"))))
  (format stream "</MESSAGE>~%"))

;;<!ELEMENT MULTIREQ (SIMPLEREQ,SIMPLEREQ+)>

;;<!ELEMENT SIMPLEREQ (METHODCALL|IMETHODCALL)>
(defun encode-cimxml-simplereq (request stream)
  (format stream "<SIMPLEREQ>~%")
  ;; depending on whether its an intrinsic or extrinsic methodcall
  (if (cim-request-intrinsic-p request)
      (encode-cimxml-imethodcall (cim-request-method request)
				 (cim-namespace
				  (cim-request-classpath request))
				 (cim-request-params request)
				 stream)
      (encode-cimxml-methodcall (cim-request-method request)
				(cim-request-classpath request)
				(cim-request-params request)
				stream))
  (format stream "</SIMPLEREQ>~%"))

;;<!ELEMENT METHODCALL ((LOCALCLASSPATH|LOCALINSTANCEPATH),PARAMVALUE*)>
;;<!ATTLIST METHODCALL
;;     %CIMName;>
(defun encode-cimxml-methodcall (methodname reference arguments stream)
  (format stream "<METHODCALL NAME=~S>~%" methodname)
  (if (cim-keys reference)
      (encode-cimxml-localinstancepath reference stream)
      (encode-cimxml-localclasspath (cim-namespace reference)
				    (cim-name reference)
				    stream))
  ;; parameters
  (dolist (arg arguments)
    (destructuring-slot (name type value) arg
      (encode-cimxml-paramvalue name value type stream)))

  (format stream "</METHODCALL>~%"))

;;<!ELEMENT PARAMVALUE (VALUE|VALUE.REFERENCE|VALUE.ARRAY|VALUE.REFARRAY)?>
;;<!ATTLIST PARAMVALUE
;;     %CIMName;
;;     %ParamType;    #IMPLIED
;;     %EmbeddedObject;>
(defun encode-cimxml-paramvalue (name value type stream)
  (format stream "<PARAMVALUE NAME=\"~A\">~%" name)
  ;; depending on the type of value dispatch to the appropriate function
  (cond
    ((cim-primitive-p type)
     (encode-cimxml-value value stream))
    ((cim-refarray-p type)
     (encode-cimxml-value-refarray value stream))
    ((cim-array-p type)
     (encode-cimxml-value-array value stream))
    ((cim-ref-p type)
     (encode-cimxml-value-reference value stream))
    (t (error "Invalid type ~S" type)))
  (format stream "</PARAMVALUE>~%"))

;;<!ELEMENT IMETHODCALL (LOCALNAMESPACEPATH,IPARAMVALUE*)>
;;<!ATTLIST IMETHODCALL
;;     %CIMName;>
(defun encode-cimxml-imethodcall (methodname namespace arguments stream)
  (format stream "<IMETHODCALL NAME=\"~A\">~%" methodname)
  (encode-cimxml-localnamespacepath namespace stream)
  (dolist (arg arguments)
    (destructuring-slot (name type value) arg 
      (encode-cimxml-iparamvalue name value type stream)))
  (format stream "</IMETHODCALL>~%"))

;;<!ELEMENT IPARAMVALUE (VALUE|VALUE.ARRAY|VALUE.REFERENCE|CLASSNAME|INSTANCENAME|QUALIFIER.DECLARATION|
;;              CLASS|INSTANCE|VALUE.NAMEDINSTANCE)?>
;;<!ATTLIST IPARAMVALUE
;;     %CIMName;>
(defun encode-cimxml-iparamvalue (name value type stream)
  (format stream "<IPARAMVALUE NAME=\"~A\">~%" name)
  (cond
    ((cim-primitive-p type)
     (encode-cimxml-value value stream))
    ((cim-refarray-p type)
     (encode-cimxml-value-refarray value stream))
    ((cim-array-p type)
     (encode-cimxml-value-array value stream))
    ((cim-ref-p type)
     (encode-cimxml-value-reference value stream))
    ((eq type :classname)
     (encode-cimxml-classname value stream))
    ((eq type :instancename)
     ;; the value should be a cim-reference object
     (encode-cimxml-instancename (cim-name value) (cim-keys value) stream))
    ;;	((eq type :qualifier.declaration)
    ;;	 (encode-cimxml-qualifier-declaration value stream))
    ((eq type :class)
     (encode-cimxml-class value stream))
    ((eq type :instance)
     (encode-cimxml-instance value stream))
    ((eq type :value.namedinstance)
     ;; named instances need a reference object to specify the keys
     ;; value should be (list object reference)
     (encode-cimxml-value-namedinstance (second value) (first value) stream))
    (t (error "Invalid type ~S" type)))
  (format stream "</IPARAMVALUE>~%"))

;; <!ELEMENT MULTIRSP (SIMPLERSP,SIMPLERSP+)>

;;<!ELEMENT SIMPLERSP (METHODRESPONSE|IMETHODRESPONSE)>
(defun encode-cimxml-simplersp (response stream)
  (format stream "<SIMPLERSP>~%")
  (if (cim-response-intrinsic-p response)
	  (encode-cimxml-imethodresponse (cim-response-method response) response stream)
	  (encode-cimxml-methodresponse (cim-response-method response) response stream))
  (format stream "</SIMPLERSP>~%"))

;;<!ELEMENT METHODRESPONSE (ERROR|(RETURNVALUE?,PARAMVALUE*))>
;;<!ATTLIST METHODRESPONSE
;;           %CIMName;>
(defun encode-cimxml-methodresponse (name response stream)
  (format stream "<METHODRESPONSE NAME=\"~A\">~%" name)
  (acond
   ((cim-response-error response)
    (encode-cimxml-error (cim-error-code it)
			 (cim-error-description it)
			 nil
			 stream))
   (t 
    ;; encode the return value
    (awhen (cim-response-return-value response)
      (encode-cimxml-returnvalue it stream))
    ;; encode the out parameters
    (dolist (outparam (cim-response-outparams response))
      (destructuring-slot (name type value) outparam
	(encode-cimxml-paramvalue name value type stream)))))
  (format stream "</METHODRESPONSE>~%"))

;;<!ELEMENT IMETHODRESPONSE (ERROR|IRETURNVALUE?)>
;;<!ATTLIST IMETHODRESPONSE
;;           %CIMName;>
(defun encode-cimxml-imethodresponse (name response stream)
  (format stream "<IMETHODRESPONSE NAME=\"~A\">~%" name)
  (acond
   ((cim-response-error response)
    (encode-cimxml-error (cim-error-code it)
			 (cim-error-description it)
			 nil
			 stream))
   (t ;(cim-response-return-value response)
    (encode-cimxml-ireturnvalue (cim-response-return-value response)
				(cim-response-return-type response)
				(cim-response-namespace response)
				stream)))   
  (format stream "</IMETHODRESPONSE>~%"))

;;<!ELEMENT ERROR (INSTANCE*)
;;<!ATTLIST ERROR
;;              CODE        CDATA   #REQUIRED
;;              DESCRIPTION CDATA   #IMPLIED>
(defun encode-cimxml-error (code description instances stream)
  (declare (ignore instances))
  (format stream "<ERROR CODE=\"~A\" DESCRIPTION=~S>~%"
		  code description)
  (format stream "</ERROR>~%"))
	
;;<!ELEMENT RETURNVALUE (VALUE|VALUE.REFERENCE)>
;;<!ATTLIST RETURNVALUE
;;         %EmbeddedObject;
;;     %ParamType;     #IMPLIED>
(defun encode-cimxml-returnvalue (value stream)
  (format stream "<RETURNVALUE")
  (when (or (cim-class-p value) (cim-instance-p value))
    (format stream " EMBEDDEDOBJECT=\"true\"")
    ;; ################## FIXME ###################
    (error "FIXME now!"))
  (format stream ">~%")

  (if (or (cim-class-p value) (cim-instance-p value))
      (encode-cimxml-value-reference value stream)
      (encode-cimxml-value value stream))

  (format stream "</RETURNVALUE>~%"))

;;<!ELEMENT IRETURNVALUE (CLASSNAME*|INSTANCENAME*|VALUE*|VALUE.OBJECTWITHPATH*|VALUE.OBJECTWITHLOCALPATH*
;;              VALUE.OBJECT*|OBJECTPATH*|QUALIFIER.DECLARATION*|VALUE.ARRAY?|VALUE.REFERENCE?|
;;               CLASS*|INSTANCE*|VALUE.NAMEDINSTANCE*)>
(defun encode-cimxml-ireturnvalue (values type namespace stream)
  (format stream "<IRETURNVALUE>~%")
  (ecase type
    (:classname
     (dolist (classname values)
       (encode-cimxml-classname classname stream)))
    (:instancename
     (dolist (reference values)
       (encode-cimxml-instancename (cim-name reference) (cim-keys reference) stream)))
    (:value
     (dolist (value values)
       (encode-cimxml-value value stream)))
    (:value.objectwithpath
     (dolist (obj values)
       (encode-cimxml-value-objectwithpath (make-cim-reference (cim-name obj) :namespace namespace)
					   obj stream)))
    (:value.objectwithlocalpath
     (dolist (obj values)
       (encode-cimxml-value-objectwithlocalpath (make-cim-reference (cim-name obj) :namespace namespace)
						obj stream)))
    (:value.object
     (dolist (obj values)
       (encode-cimxml-value-object obj stream)))
    (:objectpath
     (dolist (obj values)
       (encode-cimxml-objectpath obj stream)))
    ;;	(:qualifier.declaration
    ;;	 (dolist (q values)
    ;;	   (encode-cimxml-qualifier-declaration q stream)))
    (:value.array
     (encode-cimxml-value-array values stream))
    (:value.reference
     (encode-cimxml-value-reference values stream))
    (:class
     (dolist (class values)
       (encode-cimxml-class class stream)))
    (:instance
     (dolist (instance values)
       (encode-cimxml-instance instance stream)))
    (:namedinstance
     (dolist (namedinstance values)
       ;; named instances need a reference object to specify the key values
       ;; should be (list instance reference)
       (encode-cimxml-value-namedinstance (second namedinstance) (first namedinstance) stream))))
  (format stream "</IRETURNVALUE>~%"))

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

;; --------------------------------

(defun cim-encode (message &key (encoding :cimxml))
  (with-output-to-string (s)
    (format s "<?xml version=\"1.0\" encoding=\"utf-8\" ?>")
    (ecase encoding
      (:cimxml (encode-cimxml message s)))))

(defgeneric encode-object (cim stream))

(defmethod encode-object ((cim cim-class) stream)
  (encode-cimxml-class cim stream))

(defmethod encode-object ((cim cim-instance) stream)
  (encode-cimxml-instance cim stream))

(defmethod encode-object ((cim cim-reference) stream)
  (encode-cimxml-instancename (cim-name cim) (cim-keys cim) stream))

(defun encode (object &optional (stream *standard-output*))
  (encode-object object stream))

;; ------------------------
	 
(defun encode-mof-value (value type stream)  
  (cond
    ((cim-ref-p type)
     (format stream "~A." (cim-name value))
     (dolist* (slot slist (cim-keys value))
       (destructuring-slot (name type val) slot
         (format stream "~A=" name)
         (encode-mof-value val type stream)
         (when (cdr slist)
           (format stream ",")))))     
    ((cim-array-p type)
     (let ((tpe (cim-array-type type)))
       (format stream "{")
       (dolist* (val vlist value)
         (encode-mof-value val tpe stream)
         (when (cdr vlist)
           (format stream ",")))
       (format stream "}")))     
    ((cim-refarray-p type)
     (error "refarrays are not supported"))
    (t
     (ecase type
       ((:uint8 :uint16 :uint32 :uint64 :sint8 :sint16 :sint32 :sint64 :real32 :real64)
        (format stream "~A" value))
       (:string (format stream "\"~A\"" value))
       (:datetime (format stream "~A" (datetime-string value)))
       (:boolean (if value 
                     (format stream "true")
                     (format stream "false")))))))

(defun encode-mof-qualifiers (qualifiers stream)
  (format stream "[")
  (dolist* (qualifier qlist qualifiers)
    (destructuring-bind (name . val) qualifier
      (let ((q (cim-qualifier-by-name name)))
	(if q
	    (destructuring-qualifier (n str type def qualifiers) q
	      (if (and (eq type :boolean) val)
		  (format stream "~A" str)
		  (progn
		    (format stream "~A(" str)
		    (encode-mof-value val type stream)
		    (format stream ")"))))
	    (progn
	      (format stream "~A(" name)
	      (encode-mof-value val :string stream)
	      (format stream ")")))))
    (when (cdr qlist)
      (format stream ", ")))
  (format stream "]"))

(defun encode-mof-property (property stream)
  (destructuring-property (name type qualifiers origin value) property 
    (when qualifiers
      (format stream "  ")
      (encode-mof-qualifiers qualifiers stream)
      (format stream "~%"))
    (cond
      ((cim-ref-p type)
       (format stream "  REF ~A ~A;~%" (cim-ref-class type) name))
      ((cim-array-p type)
       (format stream "  ~A ~A[" (cim-array-type type) name)
       (when (cim-array-length type)
         (format stream "~A" (cim-array-length type)))
       (format stream "];~%"))
      ((cim-refarray-p type)
       (let ((ref (cim-array-type type)))
         (format stream "  REF ~A ~A[" (cim-ref-class ref) name)
         (when (cim-array-length type)
           (format stream "~A" (cim-array-length type)))
         (format stream "];~%")))
      (t
       (format stream "  ~A ~A;~%" (cim-primitive-string type) name)))))
    
(defun encode-mof-class (class stream)
  (when (cim-qualifiers class)
    (encode-mof-qualifiers (cim-qualifiers class) stream)
    (format stream "~%"))

  (format stream "class ~A" (cim-name class))
  (when (cim-superclass class)
    (format stream " : ~A" (cim-superclass class)))
  (format stream " {~%")

  (dolist (property (cim-properties class))
    (encode-mof-property property stream))
  
  (dolist (method (cim-methods class))
    (destructuring-method (name return-type parameters qualifiers function origin) method
      (when qualifiers
	(encode-mof-qualifiers qualifiers stream)
	(format stream "~%"))

      (format stream "  ~A ~A(" (cim-primitive-string return-type) name)
      (dolist* (parameter plist parameters)
	(destructuring-parameter (name type qualifiers) parameter
	  (when qualifiers 
	    (encode-mof-qualifiers qualifiers stream))
	  (format stream "~A ~A" (cim-primitive-string type) name))
	(when (cdr plist)
	  (format stream ", ")))

      (format stream ");~%")))

  (format stream "};~%"))

(defun encode-mof-slot (slot stream)
  (destructuring-slot (name type value) slot
    (cond
      ((cim-ref-p type)
       (format stream "  REF ~A ~A" (cim-ref-class type) name)
       (when value
         (format stream " = ")
         (encode-mof-value value type stream))
       (format stream ";~%"))
      ((cim-array-p type)
       (format stream "  ~A ~A[" (cim-primitive-string (cim-array-type type)) name)
       (when (cim-array-length type)
         (format stream "~A" (cim-array-length type)))
       (format stream "]")
       (when value
         (format stream " = ")
         (encode-mof-value value type stream))
       (format stream ";~%"))
      ((cim-refarray-p type)
       (error "refarrays are not supported"))
      (t 
       (format stream "  ~A ~A" (cim-primitive-string type) name)
       (when (or (eq type :boolean) value)
         (format stream " = ")
         (encode-mof-value value type stream))
       (format stream ";~%")))))

(defun encode-mof-instance (inst stream)
  (format stream "instance ~A {~%" (cim-name inst))
  (dolist (slot (cim-slots inst))
    (encode-mof-slot slot stream))
  (format stream "};~%"))

(defgeneric encode-mof (object stream))

(defmethod encode-mof ((class cim-class) stream)
  (encode-mof-class class stream))

(defmethod encode-mof ((inst cim-instance) stream)
  (encode-mof-instance inst stream))


