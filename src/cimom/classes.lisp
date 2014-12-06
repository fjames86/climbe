

(in-package #:climbe.cimom)


;; ---------- classes ----------

(defclass cim-standard-class (closer-mop:standard-class)
  ((cim-name :initarg :cim-name :initform nil :accessor cim-name)
   (qualifiers :initarg :qualifiers :initform nil :accessor cim-qualifiers)
   (methods :initarg :methods :initform nil :accessor cim-methods))
  (:documentation "Metaclass used to represent CIM classes."))

(defclass cim-association (cim-standard-class)
  ((associations :initarg :associations :initform nil :accessor cim-class-associations))
  (:documentation "Metaclass used to represent CIM association classes."))

(defclass cim-indication (cim-standard-class)
  ()
  (:documentation "Metaclass used to represent CIM indication classes."))

;; slots
(defclass cim-standard-direct-slot-definition (closer-mop:standard-direct-slot-definition)
  ((cim-name :initarg :cim-name :initarg nil :accessor cim-name)
   (cim-type :initarg :cim-type :initform nil :accessor cim-type)
   (qualifiers :initarg :qualifiers :initform nil :accessor cim-qualifiers)))

(defclass cim-standard-effective-slot-definition (closer-mop:standard-effective-slot-definition)
  ((cim-name :initarg :cim-name :initform nil :accessor cim-name)
   (cim-type :initarg :cim-type :initform nil :accessor cim-type)
   (qualifiers :initarg :qualifiers :initform nil :accessor cim-qualifiers)))

(defmethod print-object ((slot cim-standard-direct-slot-definition) stream)
  (print-unreadable-object (slot stream :type t)
    (format stream "~A" (cim-name slot))))

(defmethod print-object ((slot cim-standard-effective-slot-definition) stream)
  (print-unreadable-object (slot stream :type t)
    (format stream "~A" (cim-name slot))))


(defmethod closer-mop:direct-slot-definition-class ((class cim-standard-class) &rest initargs)
  (declare (ignore initargs))
  (find-class 'cim-standard-direct-slot-definition))

(defmethod closer-mop:effective-slot-definition-class ((class cim-standard-class) &rest initargs)
  (declare (ignore initargs))
  (find-class 'cim-standard-effective-slot-definition))


(defun cim-class-direct-slots (class)
  "Get the slots of a class."
  (declare (type cim-standard-class class))
  (closer-mop:class-direct-slots class))

(defun cim-class-superclasses (class)
  "Get all CIM superclasses."
  (declare (type cim-standard-class class))
  (let ((super (car (closer-mop:class-direct-superclasses class))))
    (cond
      ((null super) nil)
      ((eq super (find-class 'standard-object))
       nil)
      (t
       (cons super (cim-class-superclasses super))))))

(defun cim-class-subclasses (class)
  "Get all subclasses of the class."
  (declare (type cim-standard-class class))
  (let ((subs (closer-mop:class-direct-subclasses class)))
    (mapcan (lambda (sub)
              (cons sub (cim-class-subclasses sub)))
            subs)))

(defmethod closer-mop:validate-superclass ((class cim-standard-class) (super standard-class))
  t)

(defmethod initialize-instance :after ((class cim-standard-class) &rest initargs &key &allow-other-keys)
  (declare (ignore initargs))
  ;; convert the cim-name from (<name>) to <name>
  (when (listp (cim-name class))
    (setf (cim-name class) (car (cim-name class))))
  ;; convert the qualifiers from keyword-pairs to assoc list
  (setf (cim-qualifiers class) 
	(make-qualifiers-list (cim-qualifiers class))))

(defmethod reinitialize-instance :after ((class cim-standard-class) &rest initargs &key &allow-other-keys)
  (declare (ignore initargs))
  ;; convert the cim-name from (<name>) to <name>
  (when (listp (cim-name class))
    (setf (cim-name class) (car (cim-name class))))
  ;; convert the qualifiers from keyword-pairs to assoc list
  (setf (cim-qualifiers class) (make-qualifiers-list (cim-qualifiers class))))
  

(defmethod initialize-instance :after ((slot cim-standard-direct-slot-definition) &rest initargs &key &allow-other-keys)
  (declare (ignore initargs))
  (setf (cim-qualifiers slot) (make-qualifiers-list (cim-qualifiers slot))))

(defmethod initialize-instance :after ((slot cim-standard-effective-slot-definition) &rest initargs &key &allow-other-keys)
  (declare (ignore initargs))
  (setf (cim-qualifiers slot) (make-qualifiers-list (cim-qualifiers slot))))


(defmethod reinitialize-instance :after ((slot cim-standard-direct-slot-definition) &rest initargs &key &allow-other-keys)
  (declare (ignore initargs))
  (setf (cim-qualifiers slot) (make-qualifiers-list (cim-qualifiers slot))))

(defmethod reinitialize-instance :after ((slot cim-standard-effective-slot-definition) &rest initargs &key &allow-other-keys)
  (declare (ignore initargs))
  (setf (cim-qualifiers slot) (make-qualifiers-list (cim-qualifiers slot))))



(defmethod print-object ((class cim-standard-class) stream)
  (print-unreadable-object (class stream :type t)
    (format stream "~A" (cim-name class))))


(defmethod print-object ((slot cim-standard-direct-slot-definition) stream)
  (print-unreadable-object (slot stream :type t)
    (format stream "~A :TYPE ~A" (cim-name slot) (cim-type slot))))

(defmethod print-object ((slot cim-standard-effective-slot-definition) stream)
  (print-unreadable-object (slot stream :type t)
    (format stream "~A :TYPE ~A" (cim-name slot) (cim-type slot))))


(defun find-cim-class (class-name &optional (namespace *namespace*))
  "Find a CIM class by the stringy CIM-NAME in the given namespace."
  (declare (type string class-name) 
	   (type cim-namespace namespace))
  (find class-name (cim-namespace-classes namespace)
	:test #'string-equal
	:key #'cim-name))

(defun find-cim-slot (slot-name class)
  "Finds a slot of the class with the stringy CIM-NAME specified."
  (declare (type string slot-name)
	   (type cim-standard-class class))
  (let ((slots (cim-class-direct-slots class)))
    (find slot-name slots 
	  :key #'cim-name 
	  :test #'string-equal)))
		     
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

(defun remove-class-from-namespace (class ns &key (children t) super-classes)
  "Remove a class from a namespace.

If CHILDREN is T all the CIM subclasses are also removed.

If SUPER-CLASSES is T all the superclasses are also removed."
  (when (symbolp class)
    (setf class (find-class class)))
  (let ((classes (cim-namespace-classes ns))
        (rlist (append (list class) 
                       (when super-classes (cim-class-superclasses class))
                       (when children (cim-class-subclasses class)))))
    (setf (cim-namespace-classes ns)
          (remove-if (lambda (cl)
                       (member cl rlist))
                     classes))
    class))
    
(defun cim-key-slots (object)
  "Find the slots marked with the KEY qualifier."
  (flet ((cim-class-key-slots (class)
           (declare (type cim-standard-class class))
           (let ((slots (closer-mop:class-slots class)))
             (mapcan (lambda (slot)
                       (let ((key (qualifier-p :key (cim-qualifiers slot))))
                         (when (and key (cdr key))
                           (list slot))))
                     slots))))
    (if (typep object 'cim-standard-class)
        (cim-class-key-slots object)
        (cim-class-key-slots (class-of object)))))

(defun instance-slots (instance)
  (let ((slots (cim-class-direct-slots (class-of instance))))
	(mapcar (lambda (slot)
			  (list (cim-name slot)
					(slot-value instance (class-name slot))
					(cim-type slot)))
			slots)))

(defun instance-key-slots (instance)
  (let ((slots (cim-key-slots instance)))
	(mapcar (lambda (slot)
			  (list (cim-name slot)
					(slot-value instance (class-name slot))
					(cim-type slot)))
			slots)))

(defmacro defcim-class (name direct-superclasses slots &rest options)
  `(progn
     ;; define the class
     (defclass ,name ,direct-superclasses 
       (,@(mapcar (lambda (slot)
		    (destructuring-bind (slot-name slot-type &rest args) slot
			`(,slot-name :cim-type ,slot-type ,@args)))
		  slots))      
       ;; set the metaclass
       (:metaclass 
        ,(let ((quals (cdr (assoc :qualifiers options))))
	      (cond          
		((find :association quals) 'cim-association)
		((find :indication quals) 'cim-indication)
		(t 'cim-standard-class))))
       ;; other class options
       ,@options)

     ;; add class to current namespace
     (add-class-to-namespace (find-class ',name) *namespace*)

     ;; finalize the class
     (closer-mop:ensure-finalized (find-class ',name))))


  
;; -------------- extrinsic methods --------

(defun add-method-to-class (method class &key (subclasses t))
  "Add a method to a CIM class and all of its subclasses."
  (declare (type cim-method method)
           (type cim-standard-class class))
  ;; start by adding it to the class
  (pushnew* method (cim-methods class)
            :test (lambda (meth new-meth)
                    (string-equal (cim-name meth)
                                  (cim-name new-meth))))

  ;; now iterate over the subclasses
  (when subclasses
    (dolist (subclass (cim-class-subclasses class))
      (add-method-to-class method subclass :subclasses t)))

  nil)


(defmacro defcim-method (name ((instance-var class-name) &rest parameters) options &body body)
  (let ((return-type (cadr (assoc :return-type options)))
        (fn (cadr (assoc :function options)))
        (in-params (mapcan (lambda (parameter)
                             (destructuring-bind (lisp-name type &optional cim-name &rest qualifiers) parameter
                               (declare (ignore lisp-name type cim-name))
                               (when (member :in qualifiers)
                                 (list parameter))))
                           parameters))
        (out-params (mapcan (lambda (parameter)
                              (destructuring-bind (lisp-name type &optional cim-name &rest qualifiers) parameter
                                (declare (ignore lisp-name type cim-name))
                                (when (member :out qualifiers)
                                 (list parameter))))
                            parameters)))
    (unless return-type 
      (error "A :RETURN-TYPE option must be supplied."))
    `(progn       
       ,(when (and (not fn) body)
          `(progn
             ;; define a Lisp function with ftype declarations
             (declaim (ftype (function ((or null ,class-name) ,@(mapcar #'cadr in-params)) ,return-type)
                             ,name))
             (defun ,name (,instance-var ,@(mapcar #'car in-params))
               (declare (type (or null ,class-name) ,instance-var)
                        ,@(mapcar (lambda (param)
                                    (destructuring-bind (lisp-name type &rest args) param
                                      (declare (ignore args))
                                      `(type ,type ,lisp-name)))
                                  in-params))
               ,@body)))

       ;; make a method and attach the function
       (add-method-to-class 
        (make-cim-method :name 
                         ,(cadr (assoc :cim-name options))
                         :symbol ',name
                         :return-type 
                         ',(cadr (assoc :return-type options))
                         :qualifiers 
                         (make-qualifiers-list 
                          (list ,@(qualifiers-list-helper 
                                   (cdr (assoc :qualifiers options)))))
                         :in-params
                         (list ,@(mapcar (lambda (parameter)
                                           (destructuring-bind (lisp-name type &optional cim-name &rest qualifiers) parameter
                                             `(make-cim-parameter 
					       :name ,(if cim-name cim-name (string lisp-name))
					       :type ',type
					       :qualifiers (make-qualifiers-list 
							    (list ,@(qualifiers-list-helper 
								     qualifiers))))))
                                         in-params))
                         :out-params
                         (list ,@(mapcar (lambda (parameter)
                                           (destructuring-bind (lisp-name type &optional cim-name &rest qualifiers) parameter
                                             `(make-cim-parameter 
					       :name ,(if cim-name cim-name (string lisp-name))
					       :type ',type
					       :qualifiers (make-qualifiers-list 
							    (list ,@(qualifiers-list-helper 
								     qualifiers))))))
                                         out-params))
                         :function 
                         ,(cond
                           (fn fn)
                           (body `(function ,name))))
        (find-class ',class-name)
        :subclasses t)
         
       ;; for the sanity of the REPL 
       ',name)))


(defun find-cim-method (cim-name class)
  "Find a CIM method on a class."
  (declare (type string cim-name)
		   (type cim-standard-class class))
  (find cim-name (cim-methods class)
        :key #'cim-name 
        :test #'string-equal))

(defun invoke-method (cim-name class &rest args)
  "Find a CIM method on the class and apply it to the args."
  (when (symbolp class)
    (setf class (find-class class)))
  (let ((method (find-cim-method cim-name class)))
    (if method
        (apply (cim-method-function method) args)
        (error "Method ~S not found" cim-name))))




(defun convert-cim-instance (cim-instance &optional namespace)
  "Takes a CIM-INSTANCE structure and instantiates a CLOS instance that represents it by searching 
through the local namespace repository."
  (declare (type cim-instance cim-instance))
  (let ((cl (find-cim-class (cim-instance-classname cim-instance)
			    (if namespace
					namespace
					(find-namespace (cim-instance-namespace cim-instance))))))
    (unless cl 
      (error "Class ~S not found." (cim-instance-classname cim-instance)))
    (let ((inst (make-instance cl)))
      (dolist (slot (cim-instance-slots cim-instance))
	(destructuring-bind (slot-name slot-value slot-type) slot
	  (declare (ignore slot-type))
	  (let ((slot-definition (find-cim-slot slot-name cl)))
	    (if slot-definition
		(setf (slot-value inst (closer-mop:slot-definition-name slot-definition))
		      slot-value)
		(error "Slot ~S not found." slot-name)))))
      inst)))

(defun instance-to-cim-instance (instance)
  "Convert a CLOS instance to a CIM-INSTANCE."
  (let ((cl (class-of instance)))
    (break)
    (make-cim-instance :classname (cim-name cl)
                       :slots 
                       (mapcar (lambda (slot)
                                 (list (cim-name slot)
                                       (slot-value instance (closer-mop:slot-definition-name slot))
                                       (cim-slot-type slot)))
                               (closer-mop:class-slots cl)))))

(defun class-to-declaration (class)
  "Converts a CIM-STANDARD-CLASS instance into a CIM-CLASS structure"
  (make-cim-class
   :name (cim-name class)
   :slots (mapcar (lambda (slot)
		    (make-cim-slot :name (cim-name slot)
				   :type (cim-type slot)
				   :qualifiers (cim-qualifiers slot)))
		  (cim-class-direct-slots class))
   :qualifiers (cim-qualifiers class)
   :methods (cim-methods class)
   :superclass (let ((scs (cim-class-superclasses class)))
				 (when scs
				   (cim-name (car scs))))))
							 
