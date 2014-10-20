


(defpackage :climbe.test
  (:use :cl :climbe))

(in-package :climbe.test)


;; ------------------------------
;; examples


(defcim-class Person ()
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



(defcim-method say-hello ((instance person) 
                          (message string "Message" :in (:description "Message to say"))                          
                          (response string "Response" :out (:description "Response to message")))
    ((:return-type uint16)
     (:cim-name "SayHello")
     (:qualifiers (:description "A method to say hello")))
  (values 0
          (list (cons 'response 
                      (format nil "xxx Hello, ~A: ~A" 
                              (if instance (person-name instance) "anon")
                              message)))))


(defcim-class Parent (person)
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

(defcim-class Child (person)
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

(defcim-class Parent-Child ()
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
  (:qualifiers :association
               (:description "A parent-child linking associator.")))








