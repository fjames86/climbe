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

(define-condition cim-error-t (error)
  ((code :initarg :code :reader cim-error-code)
   (description :initarg :description :reader cim-error-description))
  (:report (lambda (err stream)
			 (format stream "CIM-ERROR ~A: ~A"
					 (cim-error-code err)
					 (cim-error-description err)))))

;; I've added CIM_OK = 0
(defparameter *cim-error-codes*
  (mapcar (lambda (code message)
			(let ((str (string message)))
			  (list (intern (substitute #\- #\_ str :test #'char=) :keyword) str code)))
		  '(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21)
		  '(CIM_OK CIM_ERR_FAILED CIM_ERR_ACCESS_DENIED CIM_ERR_INVALID_NAMESPACE CIM_ERR_INVALID_PARAMETER
			CIM_ERR_INVALID_CLASS CIM_ERR_NOT_FOUND CIM_ERR_NOT_SUPPORTED CIM_ERR_CLASS_HAS_CHILDREN
			CIM_ERR_CLASS_HAS_INSTANCES CIM_ERR_INVALID_SUPERCLASS CIM_ERR_ALREADY_EXISTS CIM_ERR_NO_SUCH_PROPERTY
			CIM_ERR_TYPE_MISMATCH CIM_ERR_QUERY_LANGUAGE_NOT_SUPPORTED CIM_ERR_INVALID_QUERY
			CIM_ERR_METHOD_NOT_AVAILABLE CIM_ERR_METHOD_NOT_FOUND CIM_ERR_UNEXPECTED_RESPONSE
			CIM_ERR_INVALID_RESPONSE_DESTINATION CIM_ERR_NAMESPACE_NOT_EMPTY |DMTF Reserved|)))

(defun cim-error-by-name (name)
  (cdr (assoc name *cim-error-codes*)))

(defun cim-error (name &optional description)
  (destructuring-bind (desc code) (cim-error-by-name name)
	(let ((d (if description
				 (format nil "~A: ~A" desc description)
				 desc)))
	  (error 'climbe::cim-error-t
			 :code code
			 :description d))))


;; ------------- debugging ----------------

(defparameter *cim-debug* nil)

(defun cim-debug (format-string &rest args)
  (when *cim-debug*
    (apply #'format *cim-debug* format-string args)
    (fresh-line *cim-debug*)))

