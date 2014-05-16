;;;; -*- mode: lisp -*-
;;;;
;;;; This is a Common Lisp implementation of a Common Information Model (CIM)
;;;; client and server. It contains a CIM-XML encoding/decoding support and
;;;; transport over WBEM. It uses the Common Lisp libraries Drakma and Hunchentoot
;;;; for HTTP/HTTPS transport.
;;;; 
;;;; Copyright (C) 2013, Frank James <frank.a.james@gmail.com>
;;;;
;;;; You are granted the rights to distribute and use this software
;;;; as governed by the terms of the Lisp Lesser General Public License
;;;; (http://opensource.franz.com/preamble.html), also known as the LLGPL.

(defpackage :climbe
  (:use :cl)
  (:nicknames :cim)
  (:export ;; errors
           #:cim-error-t
	   #:cim-error
	   #:cim-error-by-name
	   #:cim-debug
	   #:*cim-debug*

	   ;; generate CIM engine stuff
	   #:cim-class
	   #:cim-class-p
	   #:cim-instance
	   #:cim-instance-p
	   #:cim-reference
	   #:cim-reference-p
	   #:*namespace*
	   #:in-namespace
	   #:define-cim-class
	   #:cim-class-by-name
	   #:cim-property-by-name
	   #:destructuring-property
	   #:cim-property-type
	   #:make-cim-property
	   #:cim-method-by-name
	   #:destructuring-method
	   #:make-cim-method
	   #:destructuring-parameter
	   #:make-cim-parameter
	   #:cim-parameter-type
	   #:define-cim-method
	   #:cim-method-function
	   #:cim-method-parameters
	   #:cim-method-return-type
	   #:enumerate-instances
	   #:get-instance
	   #:get-property
	   #:set-property
	   #:modify-instance
	   #:delete-instance
	   #:create-instance
	   #:associator-instances
	   #:reference-instances
	   #:invoke-method
	   #:make-cim-instance
	   #:cim-slot
	   #:cim-slot-value
	   #:cim-slot-type
	   #:destructuring-slot
	   #:make-cim-slot
	   #:make-cim-reference
	   #:cim-primitive-p
	   #:cim-array-p
	   #:cim-ref-p
	   #:cim-refarray-p
	   #:cim-array-type
	   #:cim-array-length
	   #:cim-ref-class
	   #:define-qualifier
	   #:cim-qualifier-by-name
	   #:cim-datetime
	   #:cim-datetime-p
	   #:cim-object-list 
	   #:cim-instance-reference
	   #:cim-reference-instance
	   #:cim-name
	   #:cim-namespace

	   ;; encoding/decoding
	   #:cim-encode
	   #:cim-decode
	   #:encode
	   #:encode-mof

	   ;; client
	   #:cim-get-class
	   #:cim-get-instance
	   #:cim-delete-instance
	   #:cim-create-instance
	   #:cim-modify-instance
	   #:cim-enumerate-classes
	   #:cim-enumerate-class-names
	   #:cim-enumerate-instances
	   #:cim-enumerate-instance-names
	   #:cim-associators
	   #:cim-associator-names
	   #:cim-references
	   #:cim-reference-names
	   #:cim-invoke-method
	   #:cim-enumerate-namespaces

	   ;; server
	   #:start-cim-server
	   #:stop-cim-server))





;; load: utils.lisp error.lisp climbe.lisp messages.lisp qualifiers.lisp encoding.lisp decoding.lisp client.lisp server.lisp

