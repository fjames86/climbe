
(in-package #:climbe.cimom)

;; this file contains the genereric functions that providers should specialize for their classes


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
(defgeneric provider-enumerate-instances (instance)
  (:documentation "Provider generic specialized on the class."))

(defun enumerate-instances (class &key (local-only t) (deep-inheritance t) property-list)
  "Call PROVIDER-ENUMERATE-INSTANCES on the class specified and each of its subclasses.

If LOCAL-ONLY is T then only the local repository is searched.

If DEEP-INHERITANCE is T then all subclasses are also enumerated.

If PROPERTY-LIST is non-null, it should be a list of slot-symbols which the return instances should contain."
  (declare (ignore local-only property-list))
  ;; if class is a symbol then look up the class
  (when (symbolp class)
    (setf class (find-class class)))
  ;; call the generic on each of the classes, least-specific first
  (do ((insts (ignore-cim-errors (provider-enumerate-instances (make-instance class)))
              (nconc insts 
                     (ignore-cim-errors (provider-enumerate-instances (make-instance (car classes))))))
       (classes (when deep-inheritance (cim-class-subclasses class))
                (cdr classes)))
      ((null classes) insts)))

;; default method that errors
(defmethod provider-enumerate-instances ((class t))
  (cim-error :not-supported))


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
  (or (ignore-cim-errors (provider-get-instance instance))
      (some (lambda (sub-class)
              (let ((inst (change-class instance (class-name sub-class))))
                (ignore-cim-errors (provider-get-instance inst))))
            (cim-class-subclasses (class-of instance)))
      (cim-error :not-found)))

(defmethod provider-get-instance ((instance cim-standard-class))
  (cim-error :not-supported))



;; <instanceName>  CreateInstance (
;;        [IN] <instance> NewInstance
;; )
(defgeneric provider-create-instance (instance)
  (:documentation "Create an instance with these properties."))

(defun create-instance (instance)
  "Create an instance of this class."
  (declare (type cim-standard-class instance))
  (provider-create-instance instance))

(defmethod provider-create-instance ((instance cim-standard-class))
  (cim-error :not-supported))



;; ModifyInstance
;; void ModifyInstance (
;;        [IN] <namedInstance> ModifiedInstance
;; )
(defgeneric provider-modify-instance (instance)
  (:documentation "Modify the properties of the given instance. The KEY slots of the instance name the target instance and should not be modified."))

(defun modify-instance (instance)
  "Modify the instance named by the KEY slots."
  (declare (type cim-standard-class instance))
  (provider-modify-instance instance))

(defmethod provider-modify-instance ((instance cim-standard-class))
  (cim-error :not-supported))

;; DeleteInstance
;; void  DeleteInstance (
;;         [IN] <instanceName> InstanceName
;; )
(defgeneric provider-delete-instance (instance)
  (:documentation "Delete the instance named by the KEY slots."))

(defun delete-instance (instance)
  "Delete the instance named by the KEY slots of the input instance."
  (declare (type cim-standard-class instance))
  (provider-delete-instance instance))

(defmethod provider-delete-instance ((instance cim-standard-class))
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

If ASSOC-CLASS is non-nil, it should be a symbol designating a class-name of the CIM Association class, 
mandating that each returned instance MUST be associated to the source instance via an instance of this 
Class or one of its subclasses.

The ROLE input parameter, if not NULL, MUST be a valid Property name. It acts as a filter on the returned 
set of Objects by mandating that each returned Object MUST be associated to the source Object via an 
Association in which the source Object plays the specified role (i.e. the name of the Property in the 
Association Class that refers to the source Object MUST match the value of this parameter).

The RESULT-ROLE input parameter, if not NULL, MUST be a valid Property name. It acts as a filter on the
 returned set of Objects by mandating that each returned Object MUST be associated to the source Object 
via an Association in which the returned Object plays the specified role (i.e. the name of the Property 
in the Association Class that refers to the returned Object MUST match the value of this parameter)."))

(defun association-instances (instance assoc-class &key result-class role result-role property-list)
  "Find all concrete instances associated with the given instance.

If RESULT-CLASS is non-nil, it should be a symbol designating a CIM Class name. It acts as a filter on the returned set of Objects by mandating that each returned Object MUST be either an Instance of this class (or one of its subclasses).
"
  (declare (ignore property-list) )
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

(defmethod provider-association-instances ((instance cim-standard-class) assoc-class &key &allow-other-keys)
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
  (declare (ignore property-list))
  (let ((insts (provider-reference-instances instance :role role)))
    (if result-class
        (mapcan (lambda (inst)
                  (when (typep inst result-class)
                    (list inst)))
                insts)
        insts)))


;; indications
;;(defgeneric subscribe (instance))

;;(defgeneric unsubscribe (instance))


