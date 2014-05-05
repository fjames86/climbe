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


(asdf:defsystem :climbe
  :name "CLIMBE"
  :author "Frank James <frank.a.james@gmail.com>"
  :licence "Lisp Lesser General Public License (LLGPL)"
  :description "Common Lisp Common Information Model Based Enterprise Management"
  :components
  ((:module 
    :src
    :components
    ((:file "package")
	 
	 ;; utilities used by everything else
     (:file "utils" :depends-on ("package"))
	 (:file "error" :depends-on ("utils"))
	 (:file "climbe" :depends-on ("error"))
	 (:file "messages" :depends-on ("climbe"))
	 (:file "qualifiers" :depends-on ("messages"))
	 (:file "encoding" :depends-on ("qualifiers"))
	 (:file "decoding" :depends-on ("encoding"))

	 (:file "client" :depends-on ("decoding"))
	 (:file "server" :depends-on ("client"))
	 )))
  
  :depends-on (:s-xml :drakma :hunchentoot :bordeaux-threads))

