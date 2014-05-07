Climbe
======

Climbe is a CIM engine, comprising both client and fully fledged CIMOM/server. It is written 
in Common Lisp and uses the libraries Drakma and Hunchentoot for HTTP transport.

Client
-------

All the client calls begin with the CIM- prefix. 

```
(cim-enumerate-class-names "mycimserver.domain.com" "root/cimv2" :ssl t :authorization (list "username" "password"))

(cim-get-class "mycimserver.domain.com" "MyClass" "root/cimv2" :ssl t :authorization (list "username" "password"))

(cim-enumerate-instances "mycimserver.domain.com" "MyClass" "root/cimv2" :ssl t :authorization (list "username" "password"))
```

Server
------

Example provider:
```
(defun sayhello () "hello")

(in-namespace "root/cimv2")

(define-cim-class |MyClass| ()
  ((|Name| :string)
   (|Age| :uint32))
  ((|SayHello| :string () :function #'sayhello)
   (|SayGoodbye| :string ())))

(defmethod enumerate-instances ((cim |MyClass|))
  (list (make-cim-instance "MyClass" :slots (list (make-cim-slot "Name" :string "frank")))))

;; define method handler later
(define-cim-method |SayGoodBye| |MyClass| ()
  "Goodbye")

```

Run the server using:
```
(start-cim-server)

(stop-cim-server)
```

TODO
----

Lots of things not yet done or done badly. Here's an incomplete list:

* Class inheritence (started, lots left to do)
* Association classes
* Embedded instances
* Indications


Frank James 2014.