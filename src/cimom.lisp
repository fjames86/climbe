

(defpackage :climbe.cimom
  (:use :cl))

(in-package :climbe.cimom)

(defun kwassoc (item kwlist &key key test test-not)
  (do ((kwlist kwlist (cddr kwlist)))
      ((null kwlist))
    (let ((name (let ((n (car kwlist)))
                  (if key 
                      (funcall key n)
                      n))))
      (when (or (and test (funcall test item name))
                (and test-not (not (funcall test-not item name)))
                (eql item name))
        (return-from kwassoc 
          (cons (car kwlist)
                (cadr kwlist)))))))



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
   (qualifiers :initarg :qualifiers :initform nil :accessor cim-qualifiers)
   (methods :initarg :methods :initform nil :accessor cim-class-methods))
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
   (qualifiers :initarg :qualifiers :initform nil :accessor cim-qualifiers)))
   
(defclass cim-standard-effective-slot-definition (closer-mop:standard-effective-slot-definition)
  ((cim-name :initarg :cim-name :accessor cim-name)
   (cim-type :initarg :cim-type :accessor cim-slot-type)
   (qualifiers :initarg :qualifiers :initform nil :accessor cim-qualifiers)))

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
    (mapcan (lambda (sub)
              (cons sub (cim-class-subclasses sub)))
            subs)))

(defmethod closer-mop:validate-superclass ((class cim-class) (super standard-class))
  t)

(defmethod initialize-instance :after ((class cim-class) &rest initargs &key &allow-other-keys)
  (declare (ignore initargs))
  ;; convert the cim-name from (<name>) to <name>
  (setf (cim-name class) (car (cim-name class)))
  ;; convert the qualifiers from keyword-pairs to assoc list
  (setf (cim-qualifiers class) (make-qualifiers-list (cim-qualifiers class))))

(defmethod initialize-instance :after ((slot cim-standard-direct-slot-definition) &rest initargs &key &allow-other-keys)
  (declare (ignore initargs))
  (setf (cim-qualifiers slot) (make-qualifiers-list (cim-qualifiers slot))))

(defmethod initialize-instance :after ((slot cim-standard-effective-slot-definition) &rest initargs &key &allow-other-keys)
  (declare (ignore initargs))
  (setf (cim-qualifiers slot) (make-qualifiers-list (cim-qualifiers slot))))



(defmethod print-object ((class cim-class) stream)
  (print-unreadable-object (class stream :type t)
	(format stream "~A" (cim-name class))))


(defmethod print-object ((slot cim-standard-direct-slot-definition) stream)
  (print-unreadable-object (slot stream :type t)
	(format stream "~A :TYPE ~A" (cim-name slot) (cim-slot-type slot))))

(defmethod print-object ((slot cim-standard-effective-slot-definition) stream)
  (print-unreadable-object (slot stream :type t)
	(format stream "~A :TYPE ~A" (cim-name slot) (cim-slot-type slot))))


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

;; ---------- intrinsic methods --------

;; basic methods from http://www.dmtf.org/sites/default/files/standards/documents/DSP200.html

;; EnumerateInstances
;; <namedInstance>* EnumerateInstances (
;;         [IN] <className> ClassName,
;;         [IN,OPTIONAL] boolean LocalOnly = true,
;;         [IN,OPTIONAL] boolean DeepInheritance = true,
;;         [IN,OPTIONAL] boolean IncludeQualifiers = false,
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false,
;;         [IN,OPTIONAL,NULL] string PropertyList [] = NULL
;; )
(defgeneric provider-enumerate-instances (class-name)
  (:documentation "Provider generic eql-specialized on the class-name."))

(defun enumerate-instances (class &key (local-only t) (deep-inheritance t) property-list)
  "Call PROVIDER-ENUMERATE-INSTANCES on the class specified and each of its subclasses.

If LOCAL-ONLY is T then only the local repository is searched.

If DEEP-INHERITANCE is T then all subclasses are also enumerated.

If PROPERTY-LIST is non-null, it should be a list of slot-symbols which the return instances should contain."
  (declare (ignore local-only property-list))
  ;; call the generic on each of the classes, least-specific first
  (do ((insts (provider-enumerate-instances (class-name class))
              (nconc insts 
                     (ignore-errors (provider-enumerate-instances (class-name (car classes))))))
       (classes (when deep-inheritance (cim-class-subclasses class))
                (cdr classes)))
      ((null classes) insts)))
      
;; GetInstance
;; <instance> GetInstance (
;;         [IN] <instanceName> InstanceName,
;;         [IN,OPTIONAL] boolean LocalOnly = true,
;;         [IN,OPTIONAL] boolean IncludeQualifiers = false,
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false,
;;         [IN,OPTIONAL,NULL] string PropertyList [] = NULL
;; )
(defgeneric provider-get-instance (instance)
  (:documentation "Provider method to find an instance. The instance provided are the argument should be expected to have its KEY properties set, but no others."))

(defun get-instance (instance &key (local-only t) property-list)
  "Find an instance of the class."
  (declare (ignore local-only property-list))
  (or (ignore-errors (provider-get-instance instance))
      (some (lambda (sub-class)
              (let ((inst (change-class instance (class-name sub-class))))
                (handler-case 
                    (provider-get-instance inst)
                  (cim-error () nil))))
            (cim-class-subclasses (class-of instance)))
      (cim-error :not-found)))
  
(defmethod provider-get-instance ((instance cim-class))
  (cim-error :not-supported))



;; <instanceName>  CreateInstance (
;;        [IN] <instance> NewInstance
;; )
(defgeneric provider-create-instance (instance)
  (:documentation "Create an instance with these properties."))

(defun create-instance (instance)
  "Create an instance of this class."
  (declare (cim-class instance))
  (provider-create-instance instance))

(defmethod provider-create-instance ((instance cim-class))
  (cim-error :not-supported))



;; ModifyInstance
;; void ModifyInstance (
;;        [IN] <namedInstance> ModifiedInstance
;; )
(defgeneric provider-modify-instance (instance)
  (:documentation "Modify the properties of the given instance. The KEY slots of the instance name the target instance and should not be modified."))

(defun modify-instance (instance)
  "Modify the instance named by the KEY slots."
  (declare (cim-class instance))
  (provider-modify-instance instance))

(defmethod provider-modify-instance ((instance cim-class))
  (cim-error :not-supported))

;; DeleteInstance
;; void  DeleteInstance (
;;         [IN] <instanceName> InstanceName
;; )
(defgeneric provider-delete-instance (instance)
  (:documentation "Delete the instance named by the KEY slots."))

(defun delete-instance (instance)
  "Delete the instance named by the KEY slots of the input instance."
  (declare (cim-class instance))
  (provider-delete-instance instance))

(defmethod provider-delete-instance ((instance cim-class))
  (cim-error :not-supported))


;; associations

;;Associators
;; <objectWithPath>* Associators (
;;         [IN] <objectName> ObjectName,
;;         [IN,OPTIONAL,NULL] <className> AssocClass = NULL,
;;         [IN,OPTIONAL,NULL] <className> ResultClass = NULL,
;;         [IN,OPTIONAL,NULL] string Role = NULL,
;;         [IN,OPTIONAL,NULL] string ResultRole = NULL,
;;         [IN,OPTIONAL] boolean IncludeQualifiers = false,
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false,
;;         [IN,OPTIONAL,NULL] string PropertyList [] = NULL
;; )
(defgeneric provider-association-instances (instance assoc-class &key role result-role)
  (:documentation "Returns all concrete instances which are associated with the input instance.

If ASSOC-CLASS is non-nil, it should be a symbol designating a class-name of the CIM Association class, mandating that each returned instance MUST be associated to the source instance via an instance of this Class or one of its subclasses.

The ROLE input parameter, if not NULL, MUST be a valid Property name. It acts as a filter on the returned set of Objects by mandating that each returned Object MUST be associated to the source Object via an Association in which the source Object plays the specified role (i.e. the name of the Property in the Association Class that refers to the source Object MUST match the value of this parameter).

The RESULT-ROLE input parameter, if not NULL, MUST be a valid Property name. It acts as a filter on the returned set of Objects by mandating that each returned Object MUST be associated to the source Object via an Association in which the returned Object plays the specified role (i.e. the name of the Property in the Association Class that refers to the returned Object MUST match the value of this parameter)."))

(defun association-instances (instance assoc-class &key result-class role result-role property-list)
  "Find all concrete instances associated with the given instance.

If RESULT-CLASS is non-nil, it should be a symbol designating a CIM Class name. It acts as a filter on the returned set of Objects by mandating that each returned Object MUST be either an Instance of this class (or one of its subclasses).
"
  (declare (ignore property-list) 
           (cim-class instance))
  ;; if result-class is provided then filter the resulting instances for those of this class
  (let ((insts (provider-association-instances instance 
                                               assoc-class
                                               :role role
                                               :result-role result-role)))
    (if result-class 
        (mapcan (lambda (inst)
                  (when (typep inst result-class)
                    (list inst)))
                insts)
        insts)))

(defmethod provider-association-instances ((instance cim-class) assoc-class &key &allow-other-keys)
  (cim-error :not-supported))
  

;; References
;; <objectWithPath>* References (
;;         [IN] <objectName> ObjectName,
;;         [IN,OPTIONAL,NULL] <className> ResultClass = NULL,
;;         [IN,OPTIONAL,NULL] string Role = NULL,
;;         [IN,OPTIONAL] boolean IncludeQualifiers = false,
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false,
;;         [IN,OPTIONAL,NULL] string PropertyList [] = NULL
;; )
(defgeneric provider-reference-instances (instance &key role)
  (:documentation "Returns all association instances which refer to the given INSTANCE.

The ROLE input parameter, if not NULL, MUST be a valid Property name. It acts as a filter on the returned set of Objects by mandating that each returned Objects MUST refer to the target Object via a Property whose name matches the value of this parameter."))

(defun reference-instances (instance &key result-class role property-list)
  "Returns all association instances which refer to the given INSTANCE.

The RESULT-CLASS input parameter, if not NULL, MUST be a valid CIM Class name. It acts as a filter on the returned set of Objects by mandating that each returned Object MUST be an Instance of this Class (or one of its subclasses), or this Class (or one of its subclasses).

The ROLE input parameter, if not NULL, MUST be a valid Property name. It acts as a filter on the returned set of Objects by mandating that each returned Objects MUST refer to the target Object via a Property whose name matches the value of this parameter.

If the PROPERTY-LIST input parameter is not NULL, the members of the array define one or more Property names.  Each returned Object MUST NOT include elements for any Properties missing from this list.  If the PropertyList input parameter is an empty array this signifies that no Properties are included in each returned Object. If the PropertyList input parameter is NULL this specifies that all Properties (subject to the conditions expressed by the other parameters) are included in each returned Object."
  (declare (ignore property-list)
           (cim-class instance))
  (let ((insts (provider-reference-instances instance result-class :role role)))
    (if result-class
        (mapcan (lambda (inst)
                  (when (typep inst result-class)
                    (list inst)))
                insts)
        insts)))


;; indications
;;(defgeneric subscribe (instance))

;;(defgeneric unsubscribe (instance))


;; -------------- extrinsic methods --------

(defstruct cim-parameter 
  name type qualifiers)


(defclass cim-method ()
  ((cim-name :initarg :cim-name :accessor cim-name)
   (return-type :initarg :return-type :accessor cim-method-return-type)
   (parameters :initarg :parameters :accessor cim-method-parameters)
   (qualifiers :initarg :qualifiers :accessor cim-qualifiers))
  (:metaclass closer-mop:funcallable-standard-class))

(defmethod initialize-instance :after ((instance cim-method) &rest initargs &key &allow-other-keys)
  (do ((kwlist initargs (cddr kwlist)))
      ((null kwlist))
    (case (car kwlist)
      (:cim-name (setf (cim-name instance) (cadr kwlist)))
      (:return-type (setf (cim-method-return-type instance) (cadr kwlist)))
      (:parameters 
       (setf (cim-method-parameters instance)
             (mapcar (lambda (parameter)
                       (destructuring-bind (lisp-name &key name type qualifiers) parameter
                         (cons lisp-name
                               (make-cim-parameter :name name
                                                   :type type
                                                   :qualifiers qualifiers))))
                     (cadr kwlist))))
      (:function 
       (closer-mop:set-funcallable-instance-function instance (cadr kwlist))))))

(def-cim-method mymethod ((instance myclass) (x uint32 "x" :in))
  ((:return-type uint32)
   (:cim-name "MyMethod"))
  "My little class"
  (declare (cim-class instance)
           (uint32 x))
  (values (1+ x)
          nil))

(defmacro def-cim-method (name ((instance-var class-name) &rest parameters) options &body body)
  `(let ((method 
          (make-instance 'cim-method
                         :parameters
                         (list ,@(mapcar (lambda (parameter)
                                           (destructuring-bind (lisp-name type cim-name &rest qualifiers) parameter
                                             `(cons ',lisp-name
                                                    (make-cim-parameter 
                                                     :name ,cim-name
                                                     :type ',type
                                                     :qualifiers (make-qualifiers-list (list ,@qualifiers))))))
                                         parameters))
                         :return-type ',(cadr (assoc :return-type options))
                         :cim-name ,(cadr (assoc :cim-name options)))))
     ;; define a Lisp function
     (defun ,name (,instance-var ,@(mapcar #'car parameters)) ,@body)
     ;; set the funcallable instance function
     (closer-mop:set-funcallable-instance-function method (symbol-function ',name))
     
     ;; attach to the class
     (let ((class (find-class ',class-name)))
       (push method (cim-class-methods class)))
     ',name))

;; ------------ errors -----------

;; base error type
(define-condition cim-error (error)
  ())

(define-condition cim-error-failed (cim-error)
  ())

(define-condition cim-error-access-denied (cim-error)
  ())

(define-condition cim-error-invalid-namespace (cim-error)
  ())

(define-condition cim-error-invalid-parameter (cim-error)
  ())

(define-condition cim-error-invalid-class (cim-error)
  ())

(define-condition cim-error-not-found (cim-error)
  ())

(define-condition cim-error-not-supported (cim-error)
  ())

(define-condition cim-error-class-has-children (cim-error)
  ())

(define-condition cim-error-class-has-instances (cim-error)
  ())

(define-condition cim-error-invalid-superclass (cim-error)
  ())

(define-condition cim-error-already-exists (cim-error)
  ())

(define-condition cim-error-no-such-property (cim-error)
  ())

(define-condition cim-error-type-mismatch (cim-error)
  ())

(define-condition cim-error-query-language-not-supported (cim-error)
  ())

(define-condition cim-error-invalid-query (cim-error)
  ())

(define-condition cim-eror-method-not-available (cim-error)
  ())

(define-condition cim-error-method-not-found (cim-error)
  ())

(define-condition cim-error-unexpected-response (cim-error)
  ())

(define-condition cim-error-invalid-response-destination (cim-error)
  ())

(define-condition cim-error-namespace-not-empty (cim-error)
  ())


(defun cim-error (type)
  "Raise a CIM error."
  (declare (keyword type))
  (error (cdr
		  (assoc
		   type
		   '((:failed . cim-error-failed)
			 (:access-denied . cim-error-access-denied)
			 (:invalid-namespace . cim-error-invalid-namespace)
			 (:invalid-parameter . cim-error-invalid-parameter)
			 (:invalid-class . cim-error-invalid-class)
			 (:not-found . cim-error-not-found)
			 (:not-supported . cim-error-not-supported)
			 (:class-has-children . cim-error-class-has-children)
			 (:class-has-instances . cim-error-class-has-instances)
			 (:invalid-superclass . cim-error-invalid-superclass)
			 (:already-exists . cim-error-already-exists)
			 (:no-such-property . cim-error-no-such-property)
			 (:type-mismatch . cim-error-type-mismatch)
			 (:query-language-not-supported . cim-error-query-language-not-supported)
			 (:invalid-query . cim-error-invalid-query)
			 (:method-not-available . cim-eror-method-not-available)
			 (:method-not-found . cim-error-method-not-found)
			 (:unexpected-response . cim-error-unexpected-response)
			 (:invalid-response-destination . cim-error-invalid-response-destination)
			 (:namespace-not-empty . cim-error-namespace-not-empty))))))



;; ------------------------------
;; examples

(defclass myclass ()
  ((name :initarg :name :accessor myclass-name))
  (:metaclass cim-class)
  (:cim-name "MyClass")
  (:qualifiers :key))

(defmethod provider-enumerate-instances ((class-name (eql 'myclass)))
  (list 'inst1))

(defmethod provider-get-instance ((instance myclass))
  (cim-error :not-found))

(defclass myclass2 (myclass)
  ((age :initarg :age :Accessor myclass-age))
  (:metaclass cim-class)
  (:cim-name "MyClass2")
  (:qualifiers :key (:description "My little class.")))

(defmethod provider-enumerate-instances ((class-name (eql 'myclass2)))
  (list 'inst2))

(defmethod provider-get-instance ((instance myclass2))
  'inst2)





(defclass myclass3 (myclass)
  ((frank :initarg :frank))
  (:metaclass cim-class)
  (:cim-name "Frank"))

(defclass myclass4 (myclass)
  ((myslot :initarg :myslot :cim-name "MySlot" :cim-type sint32
		   :qualifiers (:key)))
  (:metaclass cim-class)
  (:cim-name "MyClass4"))


(defclass myass ()
  ((source :initform nil :initarg :source :accessor myass-source)
   (target :initform nil :initarg :target :accessor myass-target))
  (:metaclass cim-association)
  (:cim-name "MyAss"))


(defmethod provider-association-instances ((instance myclass) (assoc-class (eql 'myass)) &key &allow-other-keys)
  (list (make-instance 'myclass2 :name "Frank")))

(defmethod provider-association-instances ((instance myclass2) (assoc-class (eql 'myass)) &key &allow-other-keys)
  (list (make-instance 'myclass :name "Frank")))



