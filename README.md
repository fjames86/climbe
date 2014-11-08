Climbe
======

Climbe is a CIM engine, comprising both CIMOM/server and client. It currently supports the CIMXML encoding protocol, 

At present the client is working and capable of talking to OpenPegasus and SFCB servers.

The CIMOM/server component is not yet complete and has much more work to do yet before it's stable.

Support for WS-Management (WS-Man) is intended at some point, this should make it possible to
interact with Windows WMI via the WinRM protocol (which is basically WS-Man). 

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
other tool (e.g. OpenPegasus) or type the Lisp in by hand. Because of this there is no MOF compiler.
All CIM classes must be added to Lisp using DEFCIM-CLASS.

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


;; Supported client calls:
;;   call-get-class
;;   call-get-instance
;;   call-delete-instance
;;   call-modify-instance
;;   call-enumerate-classes
;;   call-enumerate-class-names
;;   call-enumerate-instances
;;   call-enumerate-instance-names
;;   call-associators
;;   call-associator-names
;;   call-references
;;   call-reference-names
;;   call-enumerate-qualifiers



```

TODO: need to support more of the CIM HTTP header codes.




Server
------

Partially complete. The server runs but the handlers are still very buggy.

```

;; define some classes
(in-namespace "root/cimv2")

(defcim-class MyClass ()
  ((x string :cim-name "x"))
  (:cim-name "MyClass"))

;; start the server 
(start-cim-server)

;; stop the server
(stop-cim-server)

```



TODO: need to add support for the various CIM http codes.

Associations
-------------

Sort of working but still very buggy. Still a work in progress.


Indications
-----------

CIM export messages supported by the client and server but it's still
a work in progress. 



Frank James 2014.