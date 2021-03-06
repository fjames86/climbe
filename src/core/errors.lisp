

(in-package #:climbe.core)

;; ------------ errors -----------
;; need to add codes and descriptions to the errors

;; base error type
(define-condition cim-error (error)
  ((code :initform 0 :initarg :code :reader cim-error-code)
   (name :initform "" :initarg :name :reader cim-error-name)
   (description :initform "" :initarg :description :reader cim-error-description))
  (:report (lambda (condition stream)
             (let ((desc (cim-error-description condition))
                   (name (cim-error-name condition)))
               (if desc
                   (format stream "CIM error ~A: ~A" name desc)
                   (format stream "CIM error ~A was raised" name))))))
                                             

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

(defparameter *cim-error-types*
  '((:failed cim-error-failed 1)
	(:access-denied cim-error-access-denied 2)
	(:invalid-namespace cim-error-invalid-namespace 3)
	(:invalid-parameter cim-error-invalid-parameter 4)
	(:invalid-class cim-error-invalid-class 5)
	(:not-found cim-error-not-found 6)
	(:not-supported cim-error-not-supported 7)
	(:class-has-children cim-error-class-has-children 8)
	(:class-has-instances cim-error-class-has-instances 9)
	(:invalid-superclass cim-error-invalid-superclass 10)
	(:already-exists cim-error-already-exists 11)
	(:no-such-property cim-error-no-such-property 12)
	(:type-mismatch cim-error-type-mismatch 13)
	(:query-language-not-supported cim-error-query-language-not-supported 14)
	(:invalid-query cim-error-invalid-query 15)
	(:method-not-available cim-eror-method-not-available 16)
	(:method-not-found cim-error-method-not-found 17)
	(:unexpected-response cim-error-unexpected-response 18)
	(:invalid-response-destination cim-error-invalid-response-destination 19)
	(:namespace-not-empty cim-error-namespace-not-empty 20)))

(defun make-cim-error (type &optional description)
  "Make a CIM-ERROR condition object." 
  (destructuring-bind (kwname name code)
	  (find-if (lambda (err-type)
				 (or (eq (first err-type) type)
					 (eq (third err-type) type)))
			   *cim-error-types*)
	(make-condition name
					:code code
                    :name (symbol-name kwname)
					:description description)))
  
(defun cim-error (type &optional description)
  "Raise a CIM error."
  (error (make-cim-error type description)))

;; ignores only cim errors
(defmacro ignore-cim-errors (&body body)
  `(handler-case (progn ,@body)
     (cim-error () nil)))


