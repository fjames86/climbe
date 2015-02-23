;;;; Copyright (C) 2013, Frank James <frank.a.james@gmail.com>

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
             (:file "package" :depends-on (:core :cimom :client :server :schema))))
   (:module :cim-schema
	    :pathname "schema/CIM2.42.0"
	    :components
	    ((:file "CIM_ManagedElement")
	     (:file "CIM_Namespace" :depends-on ("CIM_ManagedElement")))
	    :depends-on (:src)))
  :depends-on (:closer-mop :cl-ppcre :cxml :drakma :hunchentoot :babel :parse-number :ntlm :cl-who))




