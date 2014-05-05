
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

(defun make-qualifier (qualifier-name qualifier-string type &key default qualifiers)
  (list qualifier-name qualifier-string type default qualifiers))

(defmacro destructuring-qualifier ((name string type default qualifiers) qualifier &body body)
  `(destructuring-bind (,name ,string ,type ,default ,qualifiers) ,qualifier 
     (declare (ignorable ,name ,string ,type ,default ,qualifiers))
     ,@body))


(defvar *qualifiers* nil)
				   
(defun define-qualifier (name type &key default qualifiers)
  "Defines a new qualifier into the namespace"
  (push (make-qualifier (make-keyword name)
			name
			type
			:default default
			:qualifiers qualifiers)
	*qualifiers*)
  t)

(defun cim-qualifier-by-name (name)
  (assoc name *qualifiers* :test #'string-equal))

;; ---------------- definitions from http://www.dmtf.org/sites/default/files/standards/documents/DSP0004_2.7.0.pdf ---------------

;; Meta-qualifiers
(define-qualifier "Association" :boolean)
(define-qualifier "Indication" :boolean)

;; Standard qualifiers
(define-qualifier "Abstract" :boolean)
(define-qualifier "Aggregate" :boolean)
(define-qualifier "ArrayType" :string :default "Bag")
(define-qualifier "Bitmap" '(:array :string))
(define-qualifier "BitValues" '(:array :string))
(define-qualifier "ClassConstraint" '(:array :string))
(define-qualifier "Composition" :boolean)
(define-qualifier "Correlatable" '(:array :string))
(define-qualifier "Counter" :boolean)
(define-qualifier "Deprecated" '(:array :string))
(define-qualifier "Description" :string)
(define-qualifier "DisplayName" :string)
(define-qualifier "DN" :boolean)
(define-qualifier "EmbeddedInstance" :string)
(define-qualifier "EmbeddedObject" :boolean)
(define-qualifier "Exception" :boolean)
(define-qualifier "Experimental" :boolean)
(define-qualifier "Gauge" :boolean)
(define-qualifier "In" :boolean)
(define-qualifier "IsPUnit" :boolean)
(define-qualifier "Key" :boolean)
(define-qualifier "MappingStrings" '(:array :string))
(define-qualifier "Max" :uint32)
(define-qualifier "MaxLen" :uint32)
(define-qualifier "MaxValue" :sint64)
(define-qualifier "MethodConstraint" '(:array :string))
(define-qualifier "Min" :uint32 :default 0)
(define-qualifier "MinLen" :uint32 :default 0)
(define-qualifier "MinValue" :sint64)
(define-qualifier "ModelCorrespondence" '(:array :string))
(define-qualifier "NullValue" :string)
(define-qualifier "OctetString" :boolean)
(define-qualifier "Out" :boolean)
(define-qualifier "Override" :string)
(define-qualifier "Propagated" :string)
(define-qualifier "PropertyConstraint" '(:array :string))
(define-qualifier "PUnit" :string)
(define-qualifier "Read" :boolean)
(define-qualifier "Reference" :string)
(define-qualifier "Required" :boolean)
(define-qualifier "Static" :boolean)
(define-qualifier "Structure" :boolean)
(define-qualifier "Terminal" :boolean)
(define-qualifier "UMLPackagePath" :string)
(define-qualifier "ValueMap" '(:array :string))
(define-qualifier "Values" '(:array :string))
(define-qualifier "Version" :string)
(define-qualifier "Weak" :boolean)
(define-qualifier "Write" :boolean)
(define-qualifier "XMLNamespaceName" :string)

;; Optional qualifiers
(define-qualifier "Alias" :string)
(define-qualifier "Delete" :boolean)
(define-qualifier "DisplayDescription" :string)
(define-qualifier "Expensive" :boolean)
(define-qualifier "IfDeleted" :boolean)
(define-qualifier "Invisible" :boolean)
(define-qualifier "Large" :boolean)
(define-qualifier "PropertyUsage" :string)
(define-qualifier "Provider" :string)
(define-qualifier "Syntax" :string)
(define-qualifier "SyntaxType" :string)
(define-qualifier "TriggerType" :string)
(define-qualifier "UnknownValues" '(:array :string))
(define-qualifier "UnsupportedValues" '(:array :string))
