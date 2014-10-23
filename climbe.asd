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
  :licence "BSD"
  :description "Common Lisp Common Information Model Web Based Enterprise Management"
  :components
  ((:module "src"
    :components
    ((:file "packages")
     (:file "utils" :depends-on ("packages"))
     (:file "errors" :depends-on ("utils"))
     (:file "namespaces" :depends-on ("errors"))
     (:file "types" :depends-on ("namespaces"))
     (:file "qualifiers" :depends-on ("types"))
     (:file "classes" :depends-on ("qualifiers"))     
     (:file "cimom" :depends-on ("classes"))
	 (:file "messages" :depends-on ("classes"))
	 (:file "encoding" :depends-on ("messages"))
     (:file "tags" :depends-on ("packages"))
	 (:file "decoding" :depends-on ("tags"))
     (:file "client" :depends-on ("encoding")))))
  :depends-on (:closer-mop :cl-ppcre :s-xml :drakma :hunchentoot :bordeaux-threads :babel))

