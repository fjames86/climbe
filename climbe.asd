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
  ((:module :src
            :pathname "src"
            :components
            ((:module :utils
                      :pathname "utils"
                      :components 
                      ((:file "package")
                       (:file "utils" :depends-on ("package"))))
             (:module :core
                      :pathname "core"
                      :components
                      ((:file "package")
                       (:file "errors" :depends-on ("package"))
                       (:file "namespaces" :depends-on ("errors"))
                       (:file "types" :depends-on ("namespaces"))
                       (:file "qualifiers" :depends-on ("types"))
                       (:file "structures" :depends-on ("qualifiers")))                       
                      :depends-on (:utils))
             (:module :cimom
                      :pathname "cimom"
                      :components
                      ((:file "package")
                       (:file "classes" :depends-on ("package"))
                       (:file "cimom" :depends-on ("classes")))
                      :depends-on (:core))
             (:module :encoding
                      :pathname "encoding"
                      :components 
                      ((:file "package")
                       (:file "cimxml" :depends-on ("package"))
                       (:file "wsman" :depends-on ("package")))
                      :depends-on (:core :cimom))
             (:module :decoding
                      :pathname "decoding"
                      :components
                      ((:file "package")
                       (:file "tags" :depends-on ("package"))
                       (:file "cimxml" :depends-on ("tags"))
                       (:file "wsman" :depends-on ("tags")))
                      :depends-on (:core))
             (:module :client
                      :pathname "client"
                      :components
                      ((:file "package")
                       (:file "client" :depends-on ("package"))
                       (:file "ntlm-client" :depends-on ("client"))
		       (:file "wsman" :depends-on ("ntlm-client")))
                      :depends-on (:core :cimom :encoding :decoding))
             (:module :server
                      :pathname "server"
                      :components
                      ((:file "package")
                       (:file "server" :depends-on ("package")))
                      :depends-on (:core :cimom :encoding :decoding))
			 (:module :schema
					  :pathname "schema"
					  :components
					  ((:file "package")
					   (:file "schema" :depends-on ("package")))
					  :depends-on (:core :cimom :encoding :decoding))
             (:file "package" :depends-on (:core :cimom :client :server :schema)) )))
  :depends-on (:closer-mop :cl-ppcre :cxml :drakma :hunchentoot :babel :parse-number :ntlm :cl-who))

