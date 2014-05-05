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

;; decode raw xml using s-xml library
(defun decode-cim-new-element (name attributes seed)
  (declare (ignore name attributes seed))
  nil)

(defun decode-cim-finish-element (name attributes parent-seed seed)
  (cons (list name attributes seed)
	parent-seed))

(defun decode-cim-text (string seed)
  (declare (ignore seed))
  (if (> (length (string-trim '(#\Space #\Newline #\Return) string))
	 0)
      string
      nil))

(defun decode-xml (stream)
  "generates nested lists for the xml tags read from stream" 
  (s-xml:start-parse-xml
   stream
   (make-instance 's-xml:xml-parser-state
		  :new-element-hook #'decode-cim-new-element
		  :finish-element-hook #'decode-cim-finish-element
		  :text-hook #'decode-cim-text)))

(defun decode-xml-string (string)
  "Decode some xml from a string"
  (with-input-from-string (s string)
    (decode-xml s)))

;; -------------------------

;; try to implement dispatch functions for all of these
;; http://www.dmtf.org/sites/default/files/standards/documents/DSP201.html

(defparameter *cim-decode-dispatch-table* (make-hash-table :size 60))

(defun %define-decode-dispatch (name function)
  (setf (gethash (make-keyword name)
		 *cim-decode-dispatch-table*) function)
  name)

(defmacro define-decode-dispatch (name (attributes containing) &body body)
  (with-gensyms (gname gdecoded gattributes gcontaining)
    `(%define-decode-dispatch 
      ',name
      (lambda (,gdecoded)
	(destructuring-bind (,gname ,gattributes ,gcontaining) ,gdecoded
	  (if (eq ,gname ,(intern (symbol-name name) :keyword))
	      (funcall (lambda (,attributes ,containing) ,@body)
		       ,gattributes (if (listp ,gcontaining)
					(reverse ,gcontaining)
					,gcontaining))
	      (error "Decoding error: expected tag ~S got ~S" 
		     ,(intern (symbol-name name) :keyword) ,gname)))))))

(defun lookup-decode-dispatch (name)
  (gethash name *cim-decode-dispatch-table*))

(defun decode-dispatch (tag)
  (when tag
    (let ((fn (lookup-decode-dispatch (tag-name tag))))
      (cond
	(fn (funcall fn tag))
	(t 
	 (error "No dispatch function for ~S" (car tag)))))))

(defun decode-cimxml (stream)
  "Top level decoding function"
  (let ((tags (decode-xml stream)))
    (decode-dispatch (find-tag :cim tags))))

(defun cim-decode (stream &key (encoding :cimxml))
  (ecase encoding
    (:cimxml (decode-cimxml stream))))

;; ------------- dispatch definitions follow ------------------------------------------


;;<!ELEMENT CIM (MESSAGE|DECLARATION)>
;;<!ATTLIST CIM
;;         CIMVERSION CDATA #REQUIRED 
;;         DTDVERSION CDATA #REQUIRED>
(define-decode-dispatch Cim (attributes containing)
  (declare (ignore attributes))
  (decode-dispatch (car containing)))

;;<!ELEMENT DECLARATION  (DECLGROUP|DECLGROUP.WITHNAME|DECLGROUP.WITHPATH)+>
(define-decode-dispatch Declaration (attributes containing)
  (declare (ignore attributes))
  (mapcar (lambda (tag)
	    (decode-dispatch tag))
	  containing))

;;<!ELEMENT DECLGROUP  ((LOCALNAMESPACEPATH|NAMESPACEPATH)?,QUALIFIER.DECLARATION*,VALUE.OBJECT*)>
(define-decode-dispatch DeclGroup (attributes containing)
  (declare (ignore attributes))
  (let ((namespace (decode-dispatch (or (assoc :localnamespacepath containing)
					(assoc :namespacepath containing))))
	(qualifiers (mapcan (lambda (tag)
			      (when (eq (tag-name tag) :qualifier.declaration)
				(list (decode-dispatch tag))))
			    containing))
	(values (mapcan (lambda (tag)
			  (when (eq (tag-name tag) :value.object)
			    (list (decode-dispatch tag))))
			containing)))
    (make-cim-declaration namespace qualifiers values)))

;;<!ELEMENT DECLGROUP.WITHNAME  ((LOCALNAMESPACEPATH|NAMESPACEPATH)?,QUALIFIER.DECLARATION*,VALUE.NAMEDOBJECT*)>
(define-decode-dispatch DeclGroup.WithName (attributes containing)
  (declare (ignore attributes))
  (let ((namespace (decode-dispatch (or (assoc :localnamespacepath containing)
					(assoc :namespacepath containing))))
	(qualifiers (mapcan (lambda (tag)
			      (when (eq (tag-name tag) :qualifier.declaration)
				(list (decode-dispatch tag))))
			    containing))
	(values (mapcan (lambda (tag)
			  (when (eq (tag-name tag) :value.namedobject)
			    (list (decode-dispatch tag))))
			containing)))
    (make-cim-declaration namespace qualifiers values)))


;;<!ELEMENT DECLGROUP.WITHPATH  (VALUE.OBJECTWITHPATH|VALUE.OBJECTWITHLOCALPATH)*>
(define-decode-dispatch DeclGroup.WithPath (attributes containing)
  (declare (ignore attributes))
  (mapcar #'decode-dispatch containing))

;;<!ELEMENT QUALIFIER.DECLARATION (SCOPE?,(VALUE|VALUE.ARRAY)?)>
;;<!ATTLIST QUALIFIER.DECLARATION 
;;     %CIMName;
;;     %CIMType;                       #REQUIRED 
;;     ISARRAY        (true|false)     #IMPLIED
;;     %ArraySize;
;;     %QualifierFlavor;>
(define-decode-dispatch Qualifier.Declaration (attributes containing)
  (declare (ignore attributes containing))
  ;; we ignore qualifier declarations
  nil)

;;<!ELEMENT SCOPE EMPTY>
;;<!ATTLIST SCOPE 
;;         CLASS        (true|false)      "false"
;;         ASSOCIATION  (true|false)      "false"
;;         REFERENCE    (true|false)      "false"
;;         PROPERTY     (true|false)      "false"
;;         METHOD       (true|false)      "false"
;;         PARAMETER    (true|false)      "false"
;;         INDICATION   (true|false)      "false">
(define-decode-dispatch Scope (attributes containing)
  (declare (ignore attributes containing))
  ;; we ignore scope
  nil)

;;<!ELEMENT VALUE (#PCDATA)>
(define-decode-dispatch Value (attributes containing)
  (declare (ignore attributes))
  (string-trim '(#\return #\newline #\space #\tab) containing))

;;<!ELEMENT VALUE.ARRAY (VALUE*)>
(define-decode-dispatch Value.Array (attributes containing)
  (declare (ignore attributes))
  (mapcar #'decode-dispatch containing))

;; <!ELEMENT VALUE.REFERENCE (CLASSPATH|LOCALCLASSPATH|CLASSNAME|INSTANCEPATH|LOCALINSTANCEPATH|INSTANCENAME)>
(define-decode-dispatch Value.Reference (attributes containing)
  (declare (ignore attributes))
  (decode-dispatch (car containing)))

;;<!ELEMENT VALUE.REFARRAY (VALUE.REFERENCE*)>
(define-decode-dispatch Value.RefArray (attributes containing)
  (declare (ignore attributes))
  (mapcar #'decode-dispatch containing))

;;<!ELEMENT VALUE.OBJECT (CLASS|INSTANCE)>
(define-decode-dispatch Value.Object (attributes containing)
  (declare (ignore attributes))
  (decode-dispatch (car containing)))

;;<!ELEMENT VALUE.NAMEDINSTANCE (INSTANCENAME,INSTANCE)>
(define-decode-dispatch Value.NamedInstance (attributes containing)
  (declare (ignore attributes))
  (warn "FIXME in Value.NamedInstance: ignoring instance name")
  (let ((namedinstance (decode-dispatch (assoc :instancename containing)))
	(instance (decode-dispatch (assoc :instance containing))))
    (declare (ignore namedinstance))
    instance))

;;<!ELEMENT VALUE.NAMEDOBJECT (CLASS|(INSTANCENAME,INSTANCE))>
(define-decode-dispatch Value.NamedObject (attributes containing)
  (declare (ignore attributes))
  (let ((classtag (assoc :class containing)))
    (if classtag
	(decode-dispatch classtag)
	;; not a class, just get the instance tag i.e. ignore the instancename tag
	(decode-dispatch (assoc :instance containing)))))

;; FIXME: ignores the classpath/instanceapath tag and we need these to know the namespace
;;<!ELEMENT VALUE.OBJECTWITHPATH ((CLASSPATH,CLASS)|(INSTANCEPATH,INSTANCE))>
(define-decode-dispatch Value.ObjectWithPath (attributes containing)
  (declare (ignore attributes))
  (warn "FIXME in Value.ObjectWithPath: ignores class/instance path")
  (let ((classtag (assoc :class containing))
	(instancetag (assoc :instance containing)))
    (if classtag
	(decode-dispatch classtag)
	(decode-dispatch instancetag))))

;;<!ELEMENT VALUE.OBJECTWITHLOCALPATH ((LOCALCLASSPATH,CLASS)|(LOCALINSTANCEPATH,INSTANCE))>
(define-decode-dispatch Value.ObjectWithLocalPath (attributes containing)
  (declare (ignore attributes))
  (warn "FIXME in Value.ObjectWithLocalPath")
  (let ((classtag (assoc :class containing))
	(instancetag (assoc :instance containing)))
    (if classtag
	(decode-dispatch classtag)
	(decode-dispatch instancetag))))

;;<!ELEMENT VALUE.NULL EMPTY>
(define-decode-dispatch Value.Null (attributes containing)
  (declare (ignore attributes containing))
  nil)

;;<!ELEMENT NAMESPACEPATH (HOST,LOCALNAMESPACEPATH)>
(define-decode-dispatch NamespacePath (attributes containing)
  (declare (ignore attributes))
  (let ((host (decode-dispatch (assoc :host containing)))
	(localnamespacepath (decode-dispatch (assoc :localnamespacepath containing))))
    (values localnamespacepath host)))

;;<!ELEMENT LOCALNAMESPACEPATH (NAMESPACE+)> 
(define-decode-dispatch LocalNamespacePath (attributes containing)
  (declare (ignore attributes))
  (let ((subnames (mapcar (lambda (namespace)
			    (decode-dispatch namespace))
			  containing)))
    (make-keyword
     (with-output-to-string (s)
       (loop with printed = nil
	  for n in subnames do
	    (progn 
	      (when printed 
		(format s "/"))
	      (format s "~A" n)
	      (setf printed t)))))))

;;<!ELEMENT HOST (#PCDATA)>
(define-decode-dispatch Host (attributes containing)
  (declare (ignore attributes))
  containing)

;;<!ELEMENT NAMESPACE EMPTY> 
;;<!ATTLIST NAMESPACE
;;    %CIMName;> 
(define-decode-dispatch Namespace (attributes containing)
  (declare (ignore containing))
  (make-keyword (cdr (assoc :name attributes))))

;;<!ELEMENT CLASSPATH (NAMESPACEPATH,CLASSNAME)>
(define-decode-dispatch ClassPath (attributes contains)
  (declare (ignore attributes))
  (let ((classname (decode-dispatch (assoc :classname contains))))
    (multiple-value-bind (host namespace) (decode-dispatch (assoc :namespacepath contains))	
      (make-cim-reference classname 
			  :namespace namespace
			  :host host))))

;;<!ELEMENT LOCALCLASSPATH (LOCALNAMESPACEPATH, CLASSNAME)>
(define-decode-dispatch LocalClassPath (attributes contains)
  (declare (ignore attributes))
  (let ((namespace (decode-dispatch (assoc :localnamespacepath contains)))
	(classname (decode-dispatch (assoc :classname contains))))
    (make-cim-reference classname :namespace namespace)))

;;<!ELEMENT CLASSNAME EMPTY>
;;<!ATTLIST CLASSNAME
;;    %CIMName;>
(define-decode-dispatch ClassName (attributes containing)
  (declare (ignore containing))
  (cdr (assoc :name attributes)))

;;<!ELEMENT INSTANCEPATH (NAMESPACEPATH,INSTANCENAME)>
(define-decode-dispatch InstancePath (attributes contains)
  (declare (ignore attributes))
  (let ((namedinstance (decode-dispatch (assoc :instancename contains))))
    (multiple-value-bind (namespace host) (decode-dispatch (assoc :namespacepath contains))
      (setf (cim-namespace namedinstance) namespace
	    (cim-host namedinstance) host)
    namedinstance)))

;;<!ELEMENT LOCALINSTANCEPATH (LOCALNAMESPACEPATH,INSTANCENAME)>
(define-decode-dispatch LocalInstancePath (attributes containing)
  (declare (ignore attributes))
  (let ((namespace (decode-dispatch (assoc :localnamespacepath containing)))
	(namedinstance (decode-dispatch (assoc :instancename containing))))
    (setf (cim-namespace namedinstance) namespace)
    namedinstance))

;;<!ELEMENT INSTANCENAME (KEYBINDING*|KEYVALUE?|VALUE.REFERENCE?)>
;;<!ATTLIST INSTANCENAME
;;    %ClassName;>
(define-decode-dispatch InstanceName (attributes containing)
  (let ((classname (cdr (assoc :classname attributes)))
	(slots (aif (assoc :keyvalue containing)
		    (list (decode-dispatch it))
		    (mapcan (lambda (tag)
			      (when (member (tag-name tag) '(:keybinding :keyvalue :value.reference))
				(list (decode-dispatch tag))))
			    containing))))
    (make-cim-reference classname 
			:keys slots)))

;;<!ELEMENT OBJECTPATH (INSTANCEPATH|CLASSPATH)>
(define-decode-dispatch ObjectPath (attributes containing)
  (declare (ignore attributes))
  (decode-dispatch (car containing)))

;;<!ELEMENT KEYBINDING (KEYVALUE|VALUE.REFERENCE)>
;;<!ATTLIST KEYBINDING
;;    %CIMName;>
(define-decode-dispatch KeyBinding (attributes containing)
  (let ((name (cdr (assoc :name attributes))))
    (multiple-value-bind (value type) (decode-dispatch (car containing))
      (make-cim-slot name type value))))

;;<!ELEMENT KEYVALUE (#PCDATA)>
;;<!ATTLIST KEYVALUE
;;     VALUETYPE    (string|boolean|numeric)  "string"
;;     %CIMType;    #IMPLIED>
(define-decode-dispatch KeyValue (attributes containing)
  (let ((typestr (cdr (assoc :valuetype attributes))))
    (cond
      ;; booleans
      ((string-equal typestr "boolean")
       (cond
	 ((string-equal containing "true") 
	  (values t :boolean))
	 ((string-equal containing "false") 
	  (values nil :boolean))
	 (t (error "Can't parse ~S as a boolean" containing))))
      ;; strings
      ((string-equal typestr "string")
       (values containing :string))
      ;; a datetime
      ((string-equal typestr "datetime")
       (values (string-datetime containing) :datetime))
      ;; numeric type (int or float)
      (t (let ((num (read-from-string containing)))
	   (if (integerp num)
	       (values num :int32)
	       (values num :real32)))))))

;;<!ELEMENT CLASS (QUALIFIER*,(PROPERTY|PROPERTY.ARRAY|PROPERTY.REFERENCE)*,METHOD*)>
;;<!ATTLIST CLASS 
;;    %CIMName;
;;    %SuperClass;>
(define-decode-dispatch Class (attributes containing)
  (let ((classname (cdr (assoc :name attributes)))
	(superclass (cdr (assoc :superclass attributes))))
    (make-cim-class classname
		    ;; properties
		    (mapcan (lambda (tag)
			      (when (member (tag-name tag) '(:property :property.array :property.reference))
				(list (decode-dispatch tag))))
			    containing)
		    ;; methods
		    (mapcan (lambda (tag)
			      (when (eq (tag-name tag) :method)
				(let ((meth (decode-dispatch tag)))
;;				  (setf (cim-origin meth) classname)
				  (list meth))))
			    containing)
		    :superclass superclass
		    :qualifiers (mapcan (lambda (tag)
					  (when (eq (tag-name tag) :qualifier)
					    (list (decode-dispatch tag))))
					containing))))

;; this is not in the CIM definition, but it looks like we need it
;;<!ELEMENT CLASSES (CLASS)*>
(define-decode-dispatch Classes (attributes containing)
  (declare (ignore attributes))
  (mapcar #'decode-dispatch containing))

;;<!ELEMENT INSTANCE (QUALIFIER*,(PROPERTY|PROPERTY.ARRAY|PROPERTY.REFERENCE)*)>
;;<!ATTLIST INSTANCE
;;         %ClassName;
;;         xml:lang   NMTOKEN  #IMPLIED>
(define-decode-dispatch Instance (attributes containing)
  (let ((classname (cdr (assoc :classname attributes))))
    (make-cim-instance classname
		       (mapcan (lambda (tag)
						 (when (member (tag-name tag) '(:property :property.array :property.reference))
						   (let ((property (decode-dispatch tag)))
							 (list (cim-property-slot property)))))
			       containing))))

;;<!ELEMENT QUALIFIER ((VALUE|VALUE.ARRAY)?)>
;;<!ATTLIST QUALIFIER 
;;     %CIMName;
;;     %CIMType;               #REQUIRED 
;;     %Propagated;
;;     %QualifierFlavor;
;;     xml:lang  NMTOKEN  #IMPLIED>
(define-decode-dispatch Qualifier (attributes containing)
  (let ((name (cdr (assoc :name attributes)))
	(typename (cdr (assoc :type attributes))))
    (cons (make-keyword name)
	  (awhen (decode-dispatch (car containing))
	    ;; need to decode the value based on type
	    (cond
	      ((string-equal typename "string") it)
	      ((string-equal typename "boolean")
	       (if it t nil))
	      (t (read-from-string it)))))))

;;<!ELEMENT PROPERTY (QUALIFIER*,VALUE?)>
;;<!ATTLIST PROPERTY 
;;     %CIMName;
;;     %CIMType;           #REQUIRED 
;;     %ClassOrigin;
;;     %Propagated;
;;     %EmbeddedObject;
;;     xml:lang   NMTOKEN  #IMPLIED>
(define-decode-dispatch Property (attributes containing)
  (let ((name (cdr (assoc :name attributes)))
	(classorigin (cdr (assoc :classorigin attributes)))
	(typename (cdr (assoc :type attributes))))
    (make-cim-property name
		       (cim-string-primitive typename)
		       :origin classorigin
		       :qualifiers
		       (mapcan (lambda (tag)
				 (when (eq (tag-name tag) :qualifier)
				   (list (decode-dispatch tag))))
			       containing)
		       :value (let ((valuetag (assoc :value containing)))
				(when valuetag
				  (decode-dispatch valuetag))))))

;;<!ELEMENT PROPERTY.ARRAY (QUALIFIER*,VALUE.ARRAY?)>
;;<!ATTLIST PROPERTY.ARRAY 
;;    %CIMName;
;;    %CIMType;           #REQUIRED 
;;    %ArraySize;
;;    %ClassOrigin;
;;    %Propagated;
;;    %EmbeddedObject;
;;    xml:lang   NMTOKEN  #IMPLIED>
(define-decode-dispatch Property.Array (attributes containing)
  (let ((name (cdr (assoc :name attributes)))
	(typename (cdr (assoc :type attributes)))
	(arraysize (cdr (assoc :arraysize attributes))))
    (make-cim-property name
		       (if arraysize
			   (list :array (cim-string-primitive typename) (parse-integer arraysize))
			   (list :array (cim-string-primitive typename)))
		       :qualifiers (mapcan (lambda (tag)
					     (when (eq (tag-name tag) :qualifier)
					       (list (decode-dispatch tag))))
					   containing)
		       :value (let ((valuearraytag (assoc :value.array containing)))
				(when valuearraytag
				  (decode-dispatch valuearraytag))))))

;;<!ELEMENT PROPERTY.REFERENCE (QUALIFIER*,VALUE.REFERENCE?)>
;;<!ATTLIST PROPERTY.REFERENCE
;;     %CIMName;
;;     %ReferenceClass;
;;     %ClassOrigin;
;;     %Propagated;>
(define-decode-dispatch Property.Reference (attributes containing)
  (let ((name (cdr (assoc :name attributes)))
	(classorigin (cdr (assoc :classorigin attributes)))
	(classname (cdr (assoc :referenceclass attributes))))
    (make-cim-property name
		       (list :ref classname)
		       :origin classorigin
		       :qualifiers (mapcan (lambda (tag)
					     (when (eq (tag-name tag) :qualifier)
					       (list (decode-dispatch tag))))
					   containing)
		       :value (let ((valuetag (assoc :value.reference containing)))
				(when valuetag
				  (decode-dispatch valuetag))))))

;;<!ELEMENT METHOD (QUALIFIER*,(PARAMETER|PARAMETER.REFERENCE|PARAMETER.ARRAY|PARAMETER.REFARRAY)*)>
;;<!ATTLIST METHOD 
;;     %CIMName;
;;     %CIMType;          #IMPLIED 
;;     %ClassOrigin;
;;     %Propagated;>
(define-decode-dispatch Method (attributes containing)
  (let ((name (cdr (assoc :name attributes)))
	(classorigin (cdr (assoc :classorigin attributes)))
	(typename (cdr (assoc :type attributes))))
    (make-cim-method name
		     (cim-string-primitive typename)
		     (mapcan (lambda (tag)
			       (when (member (tag-name tag) '(:parameter :parameter.reference :parameter.array :parameter.refarray))
				 (list (decode-dispatch tag))))
			     containing)
		     :origin classorigin
		     :qualifiers (mapcan (lambda (tag)
					   (when (eq (tag-name tag) :qualifier)
					     (list (decode-dispatch tag))))
					 containing))))

;;<!ELEMENT PARAMETER (QUALIFIER*)>
;;<!ATTLIST PARAMETER 
;;     %CIMName;
;;     %CIMType;      #REQUIRED>
(define-decode-dispatch Parameter (attributes containing)
  (let ((name (cdr (assoc :name attributes)))
	(typename (cdr (assoc :type attributes))))
    (make-cim-parameter name
			(cim-string-primitive typename)
			:qualifiers
			(mapcan (lambda (tag)
				  (when (eq (tag-name tag) :qualifier)
				    (list (decode-dispatch tag))))
				containing))))

;;<!ELEMENT PARAMETER.REFERENCE (QUALIFIER*)>
;;<!ATTLIST PARAMETER.REFERENCE
;;     %CIMName;
;;     %ReferenceClass;>
(define-decode-dispatch Parameter.Reference (attributes containing)
  (let ((name (cdr (assoc :name attributes)))
	(classname (cdr (assoc :referenceclass attributes))))
    (make-cim-parameter name
			(list :ref classname)
			:qualifiers
			(mapcar #'decode-dispatch containing))))

;;<!ELEMENT PARAMETER.ARRAY (QUALIFIER*)>
;;<!ATTLIST PARAMETER.ARRAY
;;     %CIMName;
;;     %CIMType;           #REQUIRED
;;     %ArraySize;>
(define-decode-dispatch Parameter.Array (attributes containing)
  (let ((name (cdr (assoc :name attributes)))
	(typename (cdr (assoc :type attributes)))
	(arraysize (cdr (assoc :arraysize attributes))))
    (make-cim-parameter name
			(if arraysize 
			    (list :array (cim-string-primitive typename) (parse-integer arraysize))
			    (list :array (cim-string-primitive typename)))
			:qualifiers (mapcar #'decode-dispatch containing))))

;;<!ELEMENT PARAMETER.REFARRAY (QUALIFIER*)>
;;<!ATTLIST PARAMETER.REFARRAY
;;     %CIMName;
;;     %ReferenceClass;
;;     %ArraySize;>
(define-decode-dispatch Parameter.Refarray (attributes containing)
  (let ((name (cdr (assoc :name attributes)))
	(refclass (cdr (assoc :referenceclass attributes)))
	(arraysize (cdr (assoc :arraysize attributes))))
    (make-cim-parameter name
			(if arraysize 
			    (list :array (list :ref refclass) (parse-integer arraysize))
			    (list :array (list :ref refclass)))
			:qualifiers (mapcar #'decode-dispatch containing))))

;;<!ELEMENT MESSAGE (SIMPLEREQ|MULTIREQ|SIMPLERSP|MULTIRSP|SIMPLEEXPREQ|MULTIEXPREQ|SIMPLEEXPRSP|MULTIEXPRSP)>
;;<!ATTLIST MESSAGE
;;         ID             CDATA     #REQUIRED
;;         PROTOCOLVERSION CDATA     #REQUIRED>
(define-decode-dispatch Message (attributes containing)
  (let ((id (aif (cdr (assoc :id attributes))
		 (parse-integer it))))
    (let ((req (decode-dispatch (car containing))))
      (make-cim-message req id))))

;;<!ELEMENT MULTIREQ (SIMPLEREQ,SIMPLEREQ+)>
(define-decode-dispatch MultiReq (attributes containing)
  (declare (ignore attributes))
  (mapcar #'decode-dispatch containing))

;;<!ELEMENT SIMPLEREQ (METHODCALL|IMETHODCALL)>
(define-decode-dispatch SimpleReq (attributes containing)
  (declare (ignore attributes))
  (decode-dispatch (car containing)))

;;<!ELEMENT METHODCALL ((LOCALCLASSPATH|LOCALINSTANCEPATH),PARAMVALUE*)>
;;<!ATTLIST METHODCALL
;;     %CIMName;>
(define-decode-dispatch MethodCall (attributes containing)
  (let ((name (cdr (assoc :name attributes)))
	(path (cond
		((assoc :localclasspath containing)
		 (decode-dispatch (assoc :localclasspath containing)))
		((assoc :localinstancepath containing)
		 (decode-dispatch (assoc :localinstancepath containing)))
		(t (error "Method call must include a classpath or instancepath")))))
    (make-cim-request path
		      name
		      ;; parameters
		      (mapcan (lambda (tag)
				(when (eq (tag-name tag) :paramvalue)
				  (list (decode-dispatch tag))))
			      containing))))

;;<!ELEMENT PARAMVALUE (VALUE|VALUE.REFERENCE|VALUE.ARRAY|VALUE.REFARRAY)?>
;;<!ATTLIST PARAMVALUE
;;     %CIMName;
;;     %ParamType;    #IMPLIED
;;     %EmbeddedObject;>
;; ############## FIXME ####################: what type is the parameter?
(define-decode-dispatch ParamValue (attributes contains)
  (let ((name (cdr (assoc :name attributes)))
	(paramtype (cdr (assoc :paramtype attributes))))
    (warn "FIXME in ParamValue")
    (make-cim-slot name
		   paramtype 
		   (decode-dispatch (car contains)))))

;;<!ELEMENT IMETHODCALL (LOCALNAMESPACEPATH,IPARAMVALUE*)>
;;<!ATTLIST IMETHODCALL
;;     %CIMName;>
(define-decode-dispatch IMethodCall (attributes containing)
  (let ((name (cdr (assoc :name attributes)))
	(namespace (decode-dispatch (assoc :localnamespacepath containing)))
	(params (mapcan (lambda (tag)
			  (when (eq (tag-name tag) :iparamvalue)
			    (list (decode-dispatch tag))))
			containing)))
    (make-cim-request (make-cim-reference nil :namespace namespace)
		      name
		      params
		      t)))

;;<!ELEMENT IPARAMVALUE (VALUE|VALUE.ARRAY|VALUE.REFERENCE|CLASSNAME|INSTANCENAME|QUALIFIER.DECLARATION|
;;              CLASS|INSTANCE|VALUE.NAMEDINSTANCE)?>
;;<!ATTLIST IPARAMVALUE
;;     %CIMName;>
(define-decode-dispatch IParamValue (attributes containing)
  (let ((name (cdr (assoc :name attributes)))
	(contains (car containing)))
    (make-cim-slot name
		   nil
		   (decode-dispatch contains))))

;;<!ELEMENT MULTIRSP (SIMPLERSP,SIMPLERSP+)>
(define-decode-dispatch MultiRsp (attributes containing)
  (declare (ignore attributes))
  (mapcar #'decode-dispatch containing))

;;<!ELEMENT SIMPLERSP (METHODRESPONSE|IMETHODRESPONSE)>
(define-decode-dispatch SimpleRsp (attributes containing)
  (declare (ignore attributes))
  (decode-dispatch (car containing)))

;;<!ELEMENT METHODRESPONSE (ERROR|(RETURNVALUE?,PARAMVALUE*))>
;;<!ATTLIST METHODRESPONSE
;;           %CIMName;>
(define-decode-dispatch MethodResponse (attributes containing)
  (let ((name (cdr (assoc :name attributes))))
    (warn "FIXME in MethodResponse")

    ;; first check for an error
    (awhen (assoc :error containing)
      (decode-dispatch it))

    ;; no error, so get the return value and the out parameters
    (let ((retval (awhen (assoc :returnvalue containing)
		    (decode-dispatch it)))
	  (outparams (mapcan (lambda (tag)
			       (when (eq (tag-name tag) :paramvalue)
				 (list (decode-dispatch tag))))
			     containing)))

      (make-cim-response name
			 retval
			 nil ;; ######### FIXME ##########
			 :outparams outparams))))

;;<!ELEMENT IMETHODRESPONSE (ERROR|IRETURNVALUE?)>
;;<!ATTLIST IMETHODRESPONSE
;;           %CIMName;>
(define-decode-dispatch IMethodResponse (attributes containing)
  (let ((name (cdr (assoc :name attributes))))
    (make-cim-response name
		       (decode-dispatch (car containing))
		       nil)))

;;<!ELEMENT ERROR (INSTANCE*)
;;<!ATTLIST ERROR
;;              CODE        CDATA   #REQUIRED
;;              DESCRIPTION CDATA   #IMPLIED>
(define-decode-dispatch Error (attributes containing)
  (declare (ignore containing))
  (let ((code (parse-integer (cdr (assoc :code attributes))))
	(description (cdr (assoc :description attributes))))
    (error 'cim-error-t
	   :code code
	   :description description)))

;;<!ELEMENT RETURNVALUE (VALUE|VALUE.REFERENCE)>
;;<!ATTLIST RETURNVALUE
;;         %EmbeddedObject;
;;     %ParamType;     #IMPLIED>
(define-decode-dispatch ReturnValue (attributes containing)
  (declare (ignore attributes))
  (let ((value (decode-dispatch (car containing))))
    ;; could attempt to parse the value string (if the containing tag was a VALUE tag, not a VALUE.REFERENCE)
    ;; using the ParamType attribute value. However, since there is no guarantee of the attribute being present
    ;; we should just return the string always, and allow it to be parsed by any calling code
    value))		

;;<!ELEMENT IRETURNVALUE (CLASSNAME*|INSTANCENAME*|VALUE*|VALUE.OBJECTWITHPATH*|VALUE.OBJECTWITHLOCALPATH*
;;              VALUE.OBJECT*|OBJECTPATH*|QUALIFIER.DECLARATION*|VALUE.ARRAY?|VALUE.REFERENCE?|
;;               CLASS*|INSTANCE*|VALUE.NAMEDINSTANCE*)>
(define-decode-dispatch IReturnValue (attributes containing)
  (declare (ignore attributes))
  (if (member (tag-name (car containing)) '(:value.array :value.reference))
      (decode-dispatch (car containing))
      (let ((res (mapcar #'decode-dispatch containing)))
	;;	    (if (null (cdr res))
	;;		;; a list of a single object, just return the object
	;;		(car res)
	;;		res)
	res)))

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


;; -----------------------------------------------------------------------

(defun decode-test (message)
  "encode and then decode a message. should get back the same thing"
  (decode-dispatch 
   (car 
    (decode-xml-string 
     (with-output-to-string (s)
       (encode-cimxml message s))))))
