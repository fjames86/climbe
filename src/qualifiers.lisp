

(in-package :climbe)


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

(defmethod cim-name ((qualifier cim-qualifier))
  (cim-qualifier-name qualifier))

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

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defun qualifiers-list-helper (list)
    "Used in macros"
    (mapcar (lambda (item)
              (if (listp item)
                  `(list ,(car item) ,(cadr item))
                  item))
            list)))

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


(defun qualifier-p (qualifier qualifiers)
  "Find the qualifier provided in the alist of qualifier values.

QUALIFIER may be a qualifier object (from FIND-QUALIFIER) or a Lisp name (suitable for input to FIND-QUALIFIER)."
  (declare ((or symbol cim-qualifier) qualifier)
           (list qualifiers))
  (assoc (if (cim-qualifier-p qualifier)
             qualifier
             (find-qualifier qualifier))
         qualifiers
         :test #'eq))




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

