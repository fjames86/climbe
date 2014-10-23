Climbe
======

Climbe is a CIM engine, comprising both CIMOM and client. Currently supports the CIMXML encoding protocol, but
support for WS-Management (WS-Man) is intended. This should make it possible to interact with Windows WMI via the
WinRM protocol (which is basically WS-Man). 

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
	  (error :not-found)))

(defcim-method hello ((instance person) (message string "Message" :in (:description "Message to say")))
  ((:cim-name "Hello")
   (:return-type string)
   (:qualifiers (:description "Say hello")))
 (format nil "Hello, ~A" message))
 
```

Client
-------

Each of the intrinsic methods has an encoding function to generate the
CIM-XML content. Use the CALL-CIM-SERVER function.

```
;; call EnumerateInstances
(call-cim-server (encode-enumerate-instances "Person" :namespace "root/cimv2")
                 :uri "http://my-server:5898/cimom")

```

Server
------

Not yet written.

Indications
-----------

Not yet supported.


Frank James 2014.