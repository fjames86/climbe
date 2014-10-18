Climbe
======

Climbe is a CIM engine, comprising both CIMOM and client. Currently supports the CIMXML encoding protocol, but
support for WS-Management (WS-Man) is intended. This should make it possible to interact with Windows WMI via the
WinRM protocol (which is basically WS-Man). 

CIMOM
-------

Providers are implemented by defining regular CLOS classes and specializing certain generics.

```
(defcim person ()
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

```

Client
-------

Not yet written.

Server
------

Not yet written.

Indications
-----------

Not yet supported.



Frank James 2014.