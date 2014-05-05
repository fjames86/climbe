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

(defvar *default-message-id* 1000)

;; ------------------------------------------------

;; class representing a CIM message block. these have an id number and contain 
;; either a request or a response
(defclass cim-message ()
  ((id :initarg :id :reader cim-message-id)
   (contents :initarg :contents :reader cim-message-contents))
  (:documentation "A CIM message block"))

(defmethod print-object ((cim cim-message) stream)
  (print-unreadable-object (cim stream :type t)
	(format stream ":ID ~S"	(cim-message-id cim))))

(defun make-cim-message (contents &optional (id *default-message-id*))
  "Make a message to be sent to/from a CIM server."
  (make-instance 'cim-message
				 :id id
				 :contents contents))

;; -------------------------------------------

;; CIM requests
;; set the intrinsic-p slot to t for intrinsic methods
(defclass cim-request ()
  ((method :initarg :method :reader cim-request-method)
   (classpath :initarg :classpath :reader cim-request-classpath)
   (intrinsic-p :initarg :intrinsic :initform nil :reader cim-request-intrinsic-p)
   (params :initarg :params :initform nil :reader cim-request-params)
   (namespace :initarg :namespace :reader cim-namespace))
  (:documentation "A request to a CIM server."))

(defun make-cim-request (reference method params &optional intrinsicp)
  "Make a CIM-REQUEST object."
  (unless (cim-reference-p reference)
    (error "Classpath must be a cim-reference object"))
  
  (make-instance 'cim-request
		 :method method
		 :params params
		 :namespace (cim-namespace reference)
		 :intrinsic intrinsicp
		 :classpath reference))

(defun cim-request-p (cim)
  "Request predicate"
  (typep cim 'cim-request))

(defmethod print-object ((cim cim-request) stream)
  (print-unreadable-object (cim stream :type t)
	(format stream ":METHOD ~S"	(cim-request-method cim))))

;; -----------------------------------------------

;; CIM responses
(defclass cim-response ()
  ((method :initarg :method :reader cim-response-method)
   (namespace :initarg :namespace :reader cim-response-namespace)
   (intrinsic-p :initarg :intrinsic :initform nil :reader cim-response-intrinsic-p)
   (return-value :initarg :return-value :reader cim-response-return-value)
   (return-type :initarg :return-type :reader cim-response-return-type)
   (outparams :initarg :outparams :reader cim-response-outparams)
   (errorinstance :initarg :error :reader cim-response-error))
  (:documentation "A response from a CIM server."))

(defun cim-response-p (cim)
  "Response predicate"
  (typep cim 'cim-response))
					   
(defmethod print-object ((cim cim-response) stream)
  (print-unreadable-object (cim stream :type t)
	(format stream ":RETURN ~S"
			(cim-response-return-value cim))))

(defun make-cim-response (method return-value return-type &key intrinsicp outparams errorinstance namespace)
  "Make a response object"
  (make-instance 'cim-response
				 :method method
				 :namespace namespace
				 :intrinsic intrinsicp
				 :return-value return-value
				 :return-type return-type
				 :outparams outparams
				 :error errorinstance))

;; ------- declarations -------

(defun make-cim-declaration (namespace qualifiers values)
  (declare (ignore namespace qualifiers values))
  (error "Not implemented yet"))