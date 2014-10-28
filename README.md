Climbe
======

Climbe is a CIM engine, comprising both CIMOM/server and client. Currently supports the CIMXML encoding protocol, 
but support for WS-Management (WS-Man) is intended. 
This should make it possible to interact with Windows WMI via the WinRM protocol (which is basically WS-Man). 

At present the Climbe client is capable of talking to OpenPegasus and SFCB servers. 

CIMOM
-------

Providers are implemented by defining regular CLOS classes and specializing certain generics.

```
(defcim-class person ()
  ((name string
         :cim-name "Name"
		 :qualifiers (:key (:description "Name of person"))
		 :accessor person-name)
   (age uint16
        :cim-name "Age"
		:qualifiers ((:description "Age of person"))
		:accessor person-age))
  (:cim-name "Person")
  (:qualifiers (:description "Person class")))

(defmethod provider-enumerate-instances ((class-name (eql 'person)))
  (list (make-instance 'person :name "Bob" :age 31)))

(defmethod provider-get-instance ((instance person))
  (if (string-equal (person-name instance) "Bob")
      (make-instance 'person :name "Bob" :age 31)
	  (cim-error :not-found)))

(defcim-method hello ((instance person) (message string "Message" :in (:description "Message to say")))
  ((:cim-name "Hello")
   (:return-type string)
   (:qualifiers (:description "Say hello")))
 (format nil "Hello, ~A" message))
 
```

Schema
-------

The DMTF provides CIM schema (class definitions) in either MOF or XML format. Climbe can convert the XML format
schema definitions to the equivalent Lisp with the COMPILE-SCHEMA function. This can be used to generate
a Lisp skeleton for the CIM classes required.

For schema which are only distributed in MOF (e.g. SMI-S schema) you can either convert it to XML using some 
other tool (e.g. OpenPegasus) or type the Lisp in by hand. 

Client
-------

Each of the intrinsic methods has an encoding function to generate the
CIM-XML content. The CALL-CIM-SERVER function provides basic functionality but each
of the intrinsic CIM methods has a CALL-* function.

```
;; call EnumerateInstances
(call-cim-server (encode-enumerate-instances "Person" :namespace "root/cimv2")
                 :basic-authorization '("frank" "mypassword"))

;; nicer interface
(call-enumerate-instances '(:basic-authorization ("frank" "mypassword")) 
                          "Person"
                          :namespace "root/cimv2")

```

Server
------

Not yet written.

Indications
-----------

Not yet supported.


Frank James 2014.