

(defpackage :climbe.test
  (:use :cl :climbe))

(in-package :climbe.test)


;; ------------------------------
;; examples

(defclass myclass ()
  ((name :initarg :name :accessor myclass-name :cim-name "Name"))
  (:metaclass cim-class)
  (:cim-name "MyClass")
  (:qualifiers :key))

(defmethod provider-enumerate-instances ((class-name (eql 'myclass)))
  (list (make-instance 'myclass
		       :name "Frank")))

(defmethod provider-get-instance ((instance myclass))
  (cim-error :not-found))

(def-cim-method mymethod ((instance myclass) (x uint32 "x" :in))
    ((:return-type uint32)
     (:qualifiers (:description "My method"))
     (:cim-name "MyMethod"))
  (declare (ignore instance))
  (values (1+ x)
          nil))



(defclass myclass2 (myclass)
  ((age :initarg :age :Accessor myclass-age :cim-name "Age"))
  (:metaclass cim-class)
  (:cim-name "MyClass2")
  (:qualifiers :key (:description "My little class.")))

(defmethod provider-enumerate-instances ((class-name (eql 'myclass2)))
  (list (make-instance 'myclass2 :name "James" :age 28)))

(defmethod provider-get-instance ((instance myclass2))
  (if (string= (slot-value instance 'name) "James")
      (make-instance 'myclass2 :name "James" :age 28)))





(defclass myclass3 (myclass)
  ((frank :initarg :frank :initform nil :cim-name "Frank"))
  (:metaclass cim-class)
  (:cim-name "Frank"))

(defclass myclass4 (myclass)
  ((myslot :initarg :myslot :cim-name "MySlot" :cim-type sint32 :qualifiers (:key)))
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



(closer-mop:ensure-finalized (find-class 'myclass))
(closer-mop:ensure-finalized (find-class 'myclass2))
(closer-mop:ensure-finalized (find-class 'myclass3))
(closer-mop:ensure-finalized (find-class 'myclass4))


;; -----------------------------------------


(defcim Person ()
  ((name string 
	 :initform "" 
	 :initarg :name 
	 :accessor person-name 
	 :cim-name "Name"
	 :qualifiers (:key (:description "Name of person")))
   (age uint16
	:initform 0
	:initarg :age
	:accessor person-age
	:cim-name "Age"))
  (:cim-name "Person")
  (:qualifiers :abstract
	       (:description "A base person class")))

(defmethod print-object ((person person) stream)
  (print-unreadable-object (person stream :type t)
    (format stream ":NAME ~A" (person-name person))))

(defcim Parent (person)
  ()
  (:cim-name "Parent")
  (:qualifiers (:description "A parent person.")))

(defvar *parents* (list (make-instance 'parent 
				       :name "Fred" :age 30)
			(make-instance 'parent
				       :name "Alice" :age 30)))

(defmethod provider-enumerate-instances ((class-name (eql 'parent)))
  *parents*)

(defmethod provider-get-instance ((instance person))
  (find (person-name instance) *parents*
	:key #'person-name
	:test #'string-equal))

(defcim Child (person)
  ()
  (:cim-name "Child")
  (:qualifiers (:description "A child person.")))

(defvar *children* (list (make-instance 'child :name "Bob" :age 2)))
(defmethod provider-enumerate-instances ((class-name (eql 'child)))
  *children*)

(defmethod provider-get-instance ((instance child))
  (find (person-name instance) *children*
	:key #'person-name
	:test #'string-equal))

(defcim Parent-Child ()
  ((parent parent 
	   :initform nil 
	   :initarg :parent
	   :cim-name "Parent"
	   :accessor parent-child-parent)
   (child child
	  :initform nil
	  :initarg :child
	  :cim-name "Child"
	  :accessor parent-child-child))
  (:cim-name "Parent_Child")
  (:qualifiers :indication
	       (:description "A parent-child linking associator.")))











