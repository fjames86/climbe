

(in-package :climbe)

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




