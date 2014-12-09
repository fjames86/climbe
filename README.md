#Climbe
=======

Climbe is a Common Lisp Common Information Model (CIM) engine for Web-based enterprise management (WBEM).

It comprises both a CIMOM/server and client. It currently supports the CIMXML encoding protocol, with experimental
support for WS-Man coming soon.

At present the client is working and capable of talking to the well known OpenPegasus and SFCB servers.

The CIMOM/server component is not yet complete and has much more work to do yet before it's stable.

A Web Services Manangement (WS-Man) client is also included. This makes it possible to 
communicate with the Microsoft Windows WinRM service which exposes WMI using the SOAP-based protocol WS-Man.

This means native access to WMI from Lisp, provided the WinRM service is available on the 
target machine.


##1. CIMOM
-----------

The CIMOM (CIM object manager) is implented by extending CLOS using the Meta-object protocol (MOP). This means
the CIM classes themselves are implenented as regular CLOS classes (instances of CIM-STANDARD-CLASS). 
All the CIM class metadata is included in these CLOS instances. 
Server-side instances (i.e. in the CIMOM) of the CIM classes are real CLOS instances, 
rather than some struct container. This means we can implement the CIMOM as a set of generic functions
which merely need specializing for the CIM class. 

###1.1 Providers
----------------

Providers are implemented by defining regular CLOS classes which use the meta-class CIM-STANDARD-CLASS.
Specialize certain generics to implement the CIM intrinsic methods.

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

;; specialize on a dummy instance (i.e. an empty instance) of the Person class
(defmethod provider-enumerate-instances ((dummy-instance person))
  (list (make-instance 'person :name "Bob" :age 31)))

;; specialize on an instance of the Person class. The instance will have the provided key slots 
;; set to the values in the request.
(defmethod provider-get-instance ((instance person))
  (if (string-equal (person-name instance) "Bob")
      (make-instance 'person :name "Bob" :age 31)
	  (cim-error :not-found)))

;; define an extrinsic method of the class
(defcim-method hello ((instance person) (message string "Message" :in (:description "Message to say")))
  ((:cim-name "Hello")
   (:return-type string)
   (:qualifiers (:description "Say hello")))
 (format nil "Hello, ~A" message))
 
```

The intrinsic methods are implemented by these generic functions:
* provider-enumerate-instances (mandatory)
* provider-get-instance (mandatory)
* provider-create-instance (optional)
* provider-modify-instance (optional)
* provider-delete-instance (optional)
* provider-association-instances (mandatory for indication classes)
* provider-reference-instances (mandatory for indication classes)

For each of them a default method is provided which raises a CIM-NOT-SUPPORTED error.


###1.2 Associations
--------------------

Sort of working but still very buggy. Still a work in progress.

TODO: regular classes have no knowledge of any associations they have. This means we can't 
implement associations properly because when asked for assocations of a regular class it doesn't know 
where to look. This needs some serious work doing to it before it's working.

###1.3 Indications
------------------

CIM export messages supported by the client and server but it's still a work in progress. 


##2. Schema
-----------

The DMTF provides CIM schema (class definitions) in either MOF or XML format. Climbe can convert the XML format
schema definitions to the equivalent Lisp with the COMPILE-SCHEMA function. This can be used to generate
a Lisp skeleton for the CIM classes required.

For schema which are only distributed in MOF (e.g. SMI-S schema) you can either convert it to XML using some 
other tool (e.g. OpenPegasus) or type the Lisp in by hand. Because of this there is no MOF compiler.
All CIM classes must be added to Lisp using DEFCIM-CLASS.

###2.1 Compiled schema
-----------------------

The DMTF CIM schema 2.42 are compiled and included with this release. They can be included into your build
to be used as required.

Note that CIM classes can be added into different CIM namespaces with no need to define multiple CLOS classes
with the same content. Just use ADD-CLASS-TO-NAMESPACE to add a defined CLOS class to the namespace. 




##3. Client
-------------

Each of the intrinsic methods has an encoding function to generate the CIM-XML content. 
The CALL-CIM-SERVER function provides basic functionality but each of the intrinsic CIM methods 
has a CALL-* function.

```
;; call EnumerateInstances
(call-cim-server (encode-enumerate-instances "Person" :namespace "root/cimv2")
                 :basic-authorization '("frank" "mypassword"))

;; nicer interface
(call-enumerate-instances '(:basic-authorization ("frank" "mypassword")) 
                          "Person"
                          :namespace "root/cimv2")

```

Note that all these client calls use the CIMXML encoding protocol. Experimental support for WS-Man is coming.

###3.1 Supported client calls
------------------------------

* call-get-class
* call-get-instance
* call-delete-instance
* call-modify-instance
* call-enumerate-classes
* call-enumerate-class-names
* call-enumerate-instances
* call-enumerate-instance-names
* call-associators
* call-associator-names
* call-references
* call-reference-names
* call-enumerate-qualifiers


TODO: need to support more of the CIM HTTP header codes.

```
(setf *cim-uri* "https://my.host.contoso.com:5989")

(call-enumerate-classes nil :namespace "root/my/namespace")

(call-get-class nil "myclass" :namespace "root/my/namespace")

(call-enumerate-instances nil "Myclass" :namespace "root/my/namespace")
```


###3.2 WS-Man client
---------------------

You can now directly communicate with the WinRM service on Windows 8 and Server 2012 with the Climbe client. The client uses Negotiate (NTLM) authentication.


Some client calls now available are:
* call-wsman-identity
* call-wsman-get-class
* call-wsman-enumerate-classes
* call-wsman-get-instance
* call-wsman-enumerate-instances
* call-wsman-renew

These have been shown to work with the Windows 8.1 WinRM service. 

```
(setf *wsman-uri* "https://my.host.contoso.com:5985/wsman"
      *wsman-username* "administrator"
      *wsman-password* "password")

(call-wsman-enumerate-classes :namespace "root/my/namespace")

(call-wsman-get-class "myclass" :namespace "root/my/namespace")

(call-wsman-enumerate-instances "Win32_LogicalDisk" :namespace "root/cimv2")

(call-wsman-get-instance "Win32_LogicalDisk" '(("DeviceId" "C:")) :namespace "root/cimv2")

```


##4. Server
-------------

Server is partially complete, in that it works but is likely to be very buggy still. Most of the handlers
have yet to be tested. The server only supports CIM-XML at present.

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

##5. Required packages
------------------------

Climbe requires several standard packages which are all available in quicklisp. These are
Closer-MOP, CL-PPCRE, CXML, Drakma, Hunchentoot, Babel, Parse-Number, CL-WHO.

It also requires the NTLM package, which is not in quicklisp at present. You should 
get the most recent version from github.com/fjames86.

##6. TODO
-----------

Things that need to be working before Climbe can be branched for release:
* The CIMOM MUST understand Association classes
* The server MUST be able to return associated classes as well as instances 
of associated classes.
* The WS-Man client MUST support invoking methods on classes/instances.
* The WS-Man client MUST support requesting association/reference instances.

Things that ideally should be working by the time we branch for release:
* The server SHOULD support posting indication messages.
* The client SHOULD be able to notify the caller on receipt of indication messages. 
When the client subscribes to an indication, it can register a callback function 
which gets invoked by the server on receipt of the message???
* The WS-Man client SHOULD support indication subsciption
* The WS-Man client SHOULD (somehow) support receipt of indication messages.
Note that this is not simple: the received indictation message will be in 
WS-Man encoding, so it's not a simple as extending the CIMXML server. Either 
we extend the CIMXML server to also handle WS-Man indications, or we write a new 
server specifically to receieve these messages. 


Frank James 2014.

