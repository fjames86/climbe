

(defpackage :climbe.cimom
  (:use :cl))

(in-package :climbe.cimom)

;; ----- namespaces ------

(defstruct cim-namespace
  name parent children classes qualifiers)

(defmethod print-object ((ns cim-namespace) stream)
  (format stream "#S(CIM-NAMESPACE :NAME ~S :CHILDREN ~S)"
		  (cim-namespace-name ns)
		  (mapcar #'cim-namespace-name (cim-namespace-children ns))))

(defparameter *namespaces* (make-cim-namespace :name "root")
  "Root node of the tree of namespaces.")

(defun parse-namespace (name)
  "Parse a namespace string of form \\server\root\cimv2 to the individual components.

The \\server component is optional, and is typically only used when communicating with remote machines over a network.

Namespace nodes are delimited with the #\/ character only (backslashes are not allowed)."
  (declare (string name))
  (flet ((scan-server (name)
		   (declare (optimize (debug 3)))
		   (multiple-value-bind (start end starts ends) 
			   (cl-ppcre:scan "(//[\\.\\w]+)?" name)
			 (declare (ignore start end)
					  (optimize (debug 3)))
			 (if (and starts ends (aref starts 0))
				 (values (subseq name (+ (aref starts 0) 2) (aref ends 0))
						 (aref ends 0))
				 (values nil 0))))
		 (scan-namespace (name)
		   (multiple-value-bind (start end starts ends)
			   (cl-ppcre:scan "/?(\\w+)" name)
			 (declare (ignore start))
			 (if (and starts ends (aref starts 0))
				 (values (subseq name (aref starts 0) (aref ends 0))
						 end)
				 (values nil 0)))))
	(multiple-value-bind (server pos) (scan-server name)
	  (do ((p pos)
		   (ns-list nil))
		  ((null p) (values (nreverse ns-list) server))
		(multiple-value-bind (n end) (scan-namespace (subseq name p))
		  (if n
			  (setf p (+ p end)
					ns-list (cons n ns-list))
			  (setf p nil)))))))

(defun find-namespace (name)
  "Find a namespace given the stringy name."
  (declare (string name))
  (do ((ns *namespaces*)
	   (ns-list (cdr (parse-namespace name)) (cdr ns-list)))
	  ((null ns-list) ns)
	(let ((n (find (car ns-list) (cim-namespace-children ns)
				   :test #'string-equal
				   :key #'cim-namespace-name)))
	  (if n
		  (setf ns n)
		  (error "Namespace ~S not found" name)))))

(defun ensure-namespace (name)
  "Ensure the namespace exists, creating it and its nodes if they don't yet exist."
  (declare (string name))
  (do ((ns *namespaces* (or (find (car ns-list) (cim-namespace-children ns)
								  :test #'string-equal
								  :key #'cim-namespace-name)
							(let ((new (make-cim-namespace :name (car ns-list)
														   :parent ns)))
							  (push new (cim-namespace-children ns))
							  new)))
	   (ns-list (cdr (parse-namespace name)) (cdr ns-list)))
	  ((null ns-list) ns)))

(defun namespace-tree (&optional root)
  "Convert namespaces to a tree for more easy inspection."
  (labels ((tree (ns)
			 (cons (cim-namespace-name ns)
				   (mapcar #'tree
						   (cim-namespace-children ns)))))
	(tree (if root root *namespaces*))))

;; current namespace
(defparameter *namespace* (find-namespace "root")
  "Current namespace to use when defining or searching.")

(defmacro in-namespace (name)
  `(eval-when (:compile-toplevel :load-toplevel :execute)
	 (setf *namespace* (ensure-namespace ,name))))
										


;; ---------- classes ----------

(defclass cim-class (closer-mop:standard-class)
  ((cim-name :initarg :cim-name :accessor cim-name)
   (qualifiers :initarg :qualifiers :initform nil :accessor cim-qualifiers))
  (:documentation "Metaclass used to represent CIM classes."))

(defclass cim-association (cim-class)
  ()
  (:documentation "Metaclass used to represent CIM association classes."))

(defclass cim-indication (cim-class)
  ()
  (:documentation "Metaclass used to represent CIM indication classes."))

;; slots
(defclass cim-standard-direct-slot-definition (closer-mop:standard-direct-slot-definition)
  ((cim-name :initarg :cim-name :accessor cim-name)
   (cim-type :initarg :cim-type :accessor cim-slot-type)
   (qualifiers :initarg :qualifiers :accessor cim-qualifiers)))
   
(defclass cim-standard-effective-slot-definition (closer-mop:standard-effective-slot-definition)
  ((cim-name :initarg :cim-name :accessor cim-name)
   (cim-type :initarg :cim-type :accessor cim-slot-type)
   (qualifiers :initarg :qualifiers :accessor cim-qualifiers)))

(defmethod closer-mop:direct-slot-definition-class ((class cim-class) &rest initargs)
  (declare (ignore initargs))
  (find-class 'cim-standard-direct-slot-definition))

(defmethod closer-mop:effective-slot-definition-class ((class cim-class) &rest initargs)
  (declare (ignore initargs))
  (find-class 'cim-standard-effective-slot-definition))


(defun cim-class-slots (class)
  "Get the slots of a class."
  (declare (cim-class class))
  (closer-mop:class-direct-slots class))

(defun cim-class-superclasses (class)
  "Get all CIM superclasses."
  (declare (cim-class class))
  (let ((super (car (closer-mop:class-direct-superclasses class))))
	(cond
	  ((null super) nil)
	  ((eq super (find-class 'standard-object))
	   nil)
	  (t
	   (cons super (cim-class-superclasses super))))))

(defun cim-class-subclasses (class)
  "Get all subclasses of the class."
  (declare (cim-class class))
  (let ((subs (closer-mop:class-direct-subclasses class)))
	(mapcan #'cim-class-subclasses subs)))

(defmethod closer-mop:validate-superclass ((class cim-class) (super standard-class))
  t)

(defmethod initialize-instance :after ((class cim-class) &rest initargs &key &allow-other-keys)
  (declare (ignore initargs))
  ;; convert the cim-name from (<name>) to <name>
  (setf (cim-name class) (car (cim-name class)))
  ;; convert the qualifiers from keyword-pairs to assoc list
  (setf (cim-qualifiers class) (make-qualifiers-list (cim-qualifiers class))))

(defmethod print-object ((class cim-class) stream)
  (print-unreadable-object (class stream :type t)
	(format stream "~A" (cim-name class))))

(defun find-cim-class (class-name &optional (namespace *namespace*))
  "Find a CIM class by the stringy CIM-NAME in the given namespace."
  (declare (string class-name) (cim-namespace namespace))
  (find class-name (cim-namespace-classes namespace)
		:test #'string-equal
		:key #'cim-name))

(defun add-class-to-namespace (class ns &key (super-classes t) children)
  "Add a class to the namespace.

If SUPER-CLASSES is T all the CIM superclasses are also added.

If CHILDREN is T all the CIM subclasses are also added."
  (declare (cim-namespace ns) (boolean super-classes children))  
  ;; if the class is a symbol then find the class first 
  (when (symbolp class)
	(setf class (find-class class)))
  
  ;; add the class to the namespace
  (pushnew class (cim-namespace-classes ns))
  ;; add the superclass(es) to the namespace as well
  (when super-classes
	(let ((super (car (closer-mop:class-direct-superclasses class))))
	  (unless (equal super (find-class 'standard-object))
		(add-class-to-namespace super ns :super-classes t))))
  ;; add the children to the namespace as well
  (when children
	(dolist (ch (closer-mop:class-direct-subclasses class))
	  (add-class-to-namespace ch ns :children t)))
  class)

;; --------------- cim types -----------

;; the 8 types of integers supported by CIM
(deftype uint8 ()
  '(integer 0 255))
(deftype sint8 ()
  '(integer -128 127))
(deftype uint16 ()
  '(integer 0 65535))
(deftype sint16 ()
  '(integer -32768 32767))
(deftype uint32 ()
  '(integer 0 4294967295))
(deftype sint32 ()
  '(integer -2147483648 2147483647))
(deftype uint64 ()
  '(integer 0 18446744073709551615))
(deftype sint64 ()
  '(integer -9223372036854775808 9223372036854775807))

;; types of real numbers
(deftype real32 () 'single-float)
(deftype real64 () 'double-float)

;; characters. supposed to be a 16-bit UCS-2 char code
(deftype char16 () 'character)

;; also there are booleans and strings but we can use the ordinary Lisp types for these

;; datetimes are either a timestamp (cim-datetime) or an interval of time (cim-interval)
(defstruct cim-datetime
  (year 0 :type integer)
  (month 0 :type (integer 0 11))
  (day 0 :type (integer 0 31))
  (hour 0 :type (integer 0 23))
  (minute 0 :type (integer 0 59))
  (second 0 :type (integer 0 59))
  (milli 0 :type (integer 0 999))
  (utc 0 :type integer))

(defun cim-datetime-string (datetime)
  "Convert a CIM datetime to a string."
  (declare (cim-datetime datetime))
  (format nil "~4,'0D~2,'0D~2,'0D~2,'0D~2,'0D~2,'0D.~6,'0D~C~3,'0D"
		  (cim-datetime-year datetime)
		  (cim-datetime-month datetime)
		  (cim-datetime-day datetime)
		  (cim-datetime-hour datetime)
		  (cim-datetime-minute datetime)
		  (cim-datetime-second datetime)
		  (cim-datetime-milli datetime)
		  (if (minusp (cim-datetime-utc datetime)) #\- #\+)
		  (abs (cim-datetime-utc datetime))))

(defmethod print-object ((datetime cim-datetime) stream)
  (print-unreadable-object (datetime stream :type t)
	(format stream "~A" (cim-datetime-string datetime))))

(defun string-cim-datetime (string)
  "Parse a string to a CIM datetime."
  (declare (string string))
  (make-cim-datetime :year (parse-integer (subseq string 0 4))
					 :month (parse-integer (subseq string 4 6))
					 :day (parse-integer (subseq string 6 8))
					 :hour (parse-integer (subseq string 8 10))
					 :minute (parse-integer (subseq string 10 12))
					 :second (parse-integer (subseq string 12 14))
					 :milli (parse-integer (subseq string 15 21))
					 :utc (parse-integer (subseq string 21 25))))

(defstruct cim-interval
  (days 0 :type (integer 0 99999999))
  (hours 0 :type (integer 0 23))
  (minutes 0 :type (integer 0 59))
  (seconds 0 :type (integer 0 59))
  (micro 0 :type (integer 0 999999)))

(defun cim-interval-string (interval)
  "Convert a CIM interval to a string."
  (declare (cim-interval interval))
  (format nil "~8,'0D~2,'0D~2,'0D~2,'0D.~6,'0D:000"
		  (cim-interval-days interval)
		  (cim-interval-hours interval)
		  (cim-interval-minutes interval)
		  (cim-interval-seconds interval)
		  (cim-interval-micro interval)))

(defmethod print-object ((interval cim-interval) stream)
  (print-unreadable-object (interval stream :type t)
	(format stream "~A" (cim-interval-string interval))))

(defun string-cim-interval (string)
  "Parse a CIM interval from a string."
  (declare (string string))
  (make-cim-interval :days (parse-integer (subseq string 0 8))
					 :hours (parse-integer (subseq string 8 10))
					 :minutes (parse-integer (subseq string 10 12))
					 :seconds (parse-integer (subseq string 12 14))
					 :micro (parse-integer (subseq string 15 21))))

;; public CIM type (combines the two types)

(deftype datetime ()
  '(or cim-datetime cim-interval))

(defun string-datetime (string)
  "Convert a string to a datetime/interval."
  (declare (string string))
  (ecase (char string 21)
	(#\:
	 ;; interval
	 (string-cim-interval string))
	((#\+ #\-)
	 ;; datetime
	 (string-cim-datetime string))))

(defun datetime-string (datetime-or-interval)
  "Convert a datetime/interval to a string."
  (declare (datetime datetime-or-interval))
  (etypecase datetime-or-interval
	(cim-datetime (cim-datetime-string datetime-or-interval))
	(cim-interval (cim-interval-string datetime-or-interval))))

;; a cim primitive type
(deftype cim-primitive ()
  '(or
	sint8 sint16 sint32 sint64
	uint8 uint16 uint32 uint64
	boolean
	character
	string
	real32 real64
	datetime))


;; ----------------- qualifiers -------------------------

(deftype cim-flavour ()
  '(member :to-sub-class :restricted :enable-override :disable-override :translatable))

(deftype cim-scope ()
  '(member :class :association :indication :property :reference :method :parameter :any))

(defstruct cim-qualifier
  (name nil :type string)
  type
  (qualifiers nil :type list)
  (scope nil :type list)
  (flavour nil :type list)
  (default nil :type cim-primitive))

;; built-in qualifiers always available
(defparameter *qualifiers* (make-hash-table))
				  
(defun find-qualifier (name &optional (namespace *namespace*))
  "Find a qualifier by symbol-name or string-name."
  (or (gethash name *qualifiers*)
	  (let ((q nil))
		(maphash (lambda (key val)
				   (declare (ignore key))
				   (when (string-equal name (cim-qualifier-name val))
					 (setf q val)))
				 *qualifiers*)
		q)
	  (find name (cim-namespace-qualifiers namespace)
			:test #'string-equal
			:key #'cim-name)))

(defun make-qualifiers-list (list)
  "Make an alist of qualifiers from a kwlist. Boolean-type qualifiers do not take values."
  (declare (list list))
  (do ((alist nil)
	   (list list (cdr list)))
	  ((null list) alist)
	(let ((item (car list)))
	  (cond
		((symbolp item)
		 ;; a qualifier-name, use the default value
		 (let ((qualifier (find-qualifier item)))
		   (if qualifier
			   (push (cons qualifier (cim-qualifier-default qualifier))
					 alist)
			   (error "Qualifier ~S not found." item))))
		((listp item)
		 ;; (name value)
		 (destructuring-bind (name value) item
		   (let ((qualifier (find-qualifier name)))
			 (if qualifier
				 (push (cons qualifier value) alist)
				 (error "Qualifier ~S not found." name)))))
		(t (error "Malformed qualifier-item ~S" item))))))
	
(defun %defqualifier (lisp-name qualifier)
  "Define a built-in qualifier."
  (declare (symbol lisp-name) (cim-qualifier qualifier))
  (setf (gethash lisp-name *qualifiers*) qualifier))

(defmacro defqualifier (name type &rest options)
  `(%defqualifier ',name
				  (make-cim-qualifier
				   :type ',type
				   ,@(mapcan (lambda (option)
							   (let ((n (car option)))
								 (ecase n
								   ((:name :default)
									`(,n ,(cadr option)))
								   ((:scope :flavour)
									`(,n (list ,@(cdr option))))
								   (:qualifiers
									`(,n (make-qualifiers-list (list ,@(cdr option))))))))
							 options))))

;; Meta-qualifiers
(defqualifier :association boolean
  (:name "Association")
  (:scope :association)
  (:flavour :disable-override)
  (:default t))
(defqualifier :indication boolean
  (:name "Indication")
  (:scope :class :indication)
  (:flavour :disable-override)
  (:default t))

;; Standard qualifiers
(defqualifier :abstract boolean
  (:name "Abstract")
  (:scope :class :association :indication)
  (:flavour :restricted)
  (:default t))
(defqualifier :aggregate boolean
  (:name "Aggregate")
  (:scope :reference)
  (:flavour :disable-override)
  (:default t))
(defqualifier :arraytype string
  (:name "ArrayType")
  (:scope :property :parameter)
  (:flavour :disable-override)
  (:default "Bag"))
(defqualifier :bitmap (array string)
  (:name "Bitmap")
  (:scope :property :parameter :method)
  (:flavour :enable-override))
(defqualifier :bit-values (array string)
  (:name "BitValues")
  (:scope :property :parameter :method)
  (:flavour :enable-override :translatable))
(defqualifier :class-constraint (array string)
  (:name "ClassConstraint")
  (:scope :class :association :indication)
  (:flavour :enable-override))
(defqualifier :composition boolean
  (:name "Composition")
  (:scope :association)
  (:flavour :disable-override)
  (:default t))
(defqualifier :correlatable (array string)
  (:name "Correlatable")
  (:scope :property)
  (:flavour :enable-override))
(defqualifier :counter boolean
  (:name "Counter")
  (:scope :property :parameter :method)
  (:flavour :enable-override)
  (:default t))
(defqualifier :deprecated (array string)  
  (:name "Deprecated")
  (:scope :class :association :indication :property :reference :parameter :method)
  (:flavour :restricted))
(defqualifier :description string
  (:name "Description")
  (:scope :class :association :indication :property :reference :parameter :method)
  (:flavour :enable-override :translatable))
(defqualifier :display-name string
  (:name "DisplayName")
  (:scope :class :association :indication :property :reference :parameter :method)
  (:flavour :enable-override :translatable))
(defqualifier :dn boolean
  (:name "DN")
  (:scope :property :parameter :method)
  (:flavour :disable-override)
  (:default t))
(defqualifier :embedded-instance string
  (:name "EmbeddedInstance")
  (:scope :propery :parameter :method)
  (:flavour :enable-override))
(defqualifier :embedded-object boolean
  (:name "EmbeddedObject")
  (:scope :property :parameter :method)
  (:flavour :disable-override)
  (:default t))
(defqualifier :exception boolean
  (:name "Exception")
  (:scope :indication)
  (:flavour :disable-override)
  (:default t))
(defqualifier :experimental boolean
  (:name "Experimental")
  (:scope :class :association :indication :property :reference :parameter :method)
  (:flavour :restricted)
  (:default t))
(defqualifier :gauge boolean
  (:name "Gauge")
  (:scope :property :parameter :method)
  (:flavour :enable-override)
  (:default t))
(defqualifier :in boolean
  (:name "In")
  (:scope :parameter)
  (:flavour :disable-override)
  (:default t))
(defqualifier :is-p-unit boolean
  (:name "IsPUnit")
  (:scope :property :parameter :method)
  (:flavour :enable-override)
  (:default t))
(defqualifier :key boolean
  (:name "Key")
  (:scope :property :reference)
  (:flavour :disable-override)
  (:default t))
(defqualifier :mapping-strings (array string)
  (:name "MappingStrings")
  (:scope :class :association :indication :property :reference :parameter :method)
  (:flavour :enable-override))
(defqualifier :max uint32
  (:name "Max")
  (:scope :reference)
  (:flavour :enable-override)
  (:default 0))
(defqualifier :max-len uint32
  (:name "MaxLen")
  (:scope :property :parameter :method)
  (:flavour :enable-override)
  (:default 0))
(defqualifier :max-value sint64
  (:name "MaxValue")
  (:scope :property :parameter :method)
  (:flavour :enable-override)
  (:default 0))
(defqualifier :method-contraint (array string)
  (:name "MethodConstraint")
  (:scope :method)
  (:flavour :enable-override))
(defqualifier :min uint32
  (:name "Min")
  (:scope :reference)
  (:flavour :enable-override)
  (:default 0))
(defqualifier :min-len uint32
  (:name "MinLen")
  (:scope :property :parameter :method)
  (:flavour :enable-override)
  (:default 0))
(defqualifier :min-value sint64
  (:name "MinValue")
  (:scope :property :parameter :method)
  (:flavour :enable-override)
  (:default 0))
(defqualifier :model-correspondence (array string)
  (:name "ModelCorrespondence")
  (:scope :class :association :indication :property :reference :parameter :method)
  (:flavour :enable-override))
(defqualifier :null-value string
  (:name "NullValue")
  (:scope :property)
  (:flavour :disable-override))
(defqualifier :octet-string boolean
  (:name "OctetString")
  (:scope :property :parameter :method)
  (:flavour :disable-override)
  (:default t))
(defqualifier :out boolean
  (:name "Out")
  (:scope :parameter)
  (:flavour :disable-override)
  (:default t))
(defqualifier :override string
  (:name "Override")
  (:scope :property :parameter :method)
  (:flavour :restricted))
(defqualifier :propogated string
  (:name "Propagated")
  (:scope :property)
  (:flavour :disable-override))
(defqualifier :property-constraint (array string)
  (:name "PropertyConstraint")
  (:scope :property :reference)
  (:flavour :enable-override))
(defqualifier :p-unit string
  (:name "PUnit")
  (:scope :property :parameter :method)
  (:flavour :enable-override))
(defqualifier :read boolean
  (:name "Read")
  (:scope :property)
  (:flavour :enable-override)
  (:default t))
(defqualifier :reference string
  (:name "Reference")
  (:scope :property)
  (:flavour :enable-override))
(defqualifier :required boolean
  (:name "Required")
  (:scope :property :reference :parameter :method)
  (:flavour :disable-override)
  (:default t))
(defqualifier :static boolean
  (:name "Static")
  (:scope :property :method)
  (:flavour :disable-override)
  (:default t))
(defqualifier :structure boolean
  (:name "Structure")
  (:scope :indication)
  (:flavour :enable-override)
  (:default t))
(defqualifier :terminal boolean
  (:name "Terminal")
  (:scope :class :association :indication)
  (:flavour :enable-override)
  (:default t))
(defqualifier :uml-package-path string
  (:name "UMLPackagePath")
  (:scope :class :association :indication)
  (:flavour :enable-override))
(defqualifier :value-map (array string)
  (:name "ValueMap")
  (:scope :property :parameter :method)
  (:flavour :enable-override))
(defqualifier :values (array string)
  (:name "Values")
  (:scope :property :parameter :method)
  (:flavour :enable-override :translatable))
(defqualifier :version string
  (:name "Version")
  (:scope :class :association :indication)
  (:flavour :restricted :translatable))
(defqualifier :weak boolean
  (:name "Weak")
  (:scope :reference)
  (:flavour :disable-override))
(defqualifier :write boolean
  (:name "Write")
  (:scope :property)
  (:flavour :enable-override)
  (:default t))
(defqualifier :xml-namespace-name string
  (:name "XMLNamespaceName")
  (:scope :property :method :parameter)
  (:flavour :enable-override))

;; Optional qualifiers
(defqualifier :alias string
  (:name "Alias")
  (:scope :property :reference :method)
  (:flavour :enable-override :translatable))
(defqualifier :delete boolean
  (:name "Delete")
  (:scope :association :reference)
  (:flavour :enable-override)
  (:default t))
(defqualifier :display-description string
  (:name "DisplayDescription")
  (:scope :class :association :indication :property :reference :parameter :method)
  (:flavour :enable-override :translatable))
(defqualifier :expensive boolean
  (:name "Expensive")
  (:scope :class :association :indication :property :reference :parameter :method)
  (:flavour :enable-override)
  (:default t))		 
(defqualifier :if-deleted boolean
  (:name "IfDeleted")
  (:scope :association :reference)
  (:flavour :enable-override)
  (:default t))
(defqualifier :invisible boolean
  (:name "Invisible")
  (:scope :class :association :property :reference :method)
  (:flavour :enable-override)
  (:default t))
(defqualifier :large boolean
  (:name "Large")
  (:scope :class :property)
  (:flavour :enable-override)
  (:default t))
(defqualifier :property-usage string
  (:name "PropertyUsage")
  (:scope :property)
  (:flavour :enable-override))
(defqualifier :provider string
  (:name "Provider")
  (:scope :class :association :indication :property :reference :parameter :method)
  (:flavour :enable-override))
(defqualifier :syntax string
  (:name "Syntax")
  (:scope :propery :reference :parameter :method)
  (:flavour :enable-override))
(defqualifier :syntax-type string
  (:name "SyntaxType")
  (:scope :property :reference :parameter :method)
  (:flavour :enable-override))
(defqualifier :trigger-type string
  (:name "TriggerType")
  (:scope :class :association :indication :property :reference :method)
  (:flavour :enable-override))
(defqualifier :unknown-values (array string)
  (:name "UnknownValues")
  (:scope :property)
  (:flavour :disable-override))
(defqualifier :unsupported-values (array string)
  (:name "UnsupportedValues")
  (:scope :property)
  (:flavour :disable-override))


;; ------------------------------
;; examples

(defclass myclass ()
  ((name :initarg :name :accessor myclass-name))
  (:metaclass cim-class)
  (:cim-name "MyClass")
  (:qualifiers :key))

(defclass myclass2 (myclass)
  ((age :initarg :age :Accessor myclass-age))
  (:metaclass cim-class)
  (:cim-name "MyClass2")
  (:qualifiers :key (:description "My little class.")))

(defclass myclass3 (myclass)
  ((frank :initarg :frank))
  (:metaclass cim-class)
  (:cim-name "Frank"))
