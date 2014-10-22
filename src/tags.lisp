

(defpackage :ctags
  (:use :cl))

(in-package :ctags)

(defun find-one (predicate list &key key)
  "Find one and only one element of the list which matches the predicate.

Returns (VALUES match found)."
  (do ((list list (cdr list))
	   (match nil)
	   (found nil))
	  ((null list)
	   (values match found))	
	(let ((val (if key
				   (funcall key (car list))
				   (car list))))
	  (when (funcall predicate val)
		(if found
			(return-from find-one (values nil nil))
			(setf match val
				  found t))))))

(defun find-all (source list &key key test)
  "Find all the items in the SOURCE list from the LIST. Apply KEY and TEST to find as usual.

Returns (MATCH-LIST FOUND)"
  (values
   (mapcan (lambda (item)
			 (let ((val (find item list :key key :test test)))
			   (if val
				   (list val)
				   (return-from find-all (values nil nil)))))
		   source)
   t))


;; pattern = [x?|(y+,z*)] -> (one (one x) (every (some y) (multi z)))

;; (every x y) '(x y z) -> (x y)
(defun apply-tag (pattern form)
  (if (symbolp pattern)
	  (find-one (lambda (val)
				  (eql pattern val))
				form)
	  (let ((op (car pattern)))
		(ecase op
		  (:one
		   ;; (one &rest pats) -> matched form
		   (destructuring-bind (&rest pats) (cdr pattern)
			 ;; there should be one and only one matched tag
			 (multiple-value-bind (match found)
				 (find-one (lambda (pat)
							 (apply-tag pat form))
						   pats)
			   (if found
				   match
				   (error "pattern failed ~S ~S" pattern form)))))
		  (:every
		   ;; (every &rest pats)
		   (destructuring-bind (&rest pats) (cdr pattern)
			 ;; every pattern must match a form
			 (find-all pats form
					   :test (lambda (pat)



(defparameter *prefix* "")

(defmacro deftag (name attributes tag-form &body body)
  (let ((gtag (gensym "TAG"))
		(gname (gensym "NAME"))
		(gattrs (gensym "ATTRS"))
		(gcontents (gensym "CONTENTS")))
	`(defun ,(intern (concatenate 'string *prefix* (symbol-name name)))
		 (,gtag)
	   (destructuring-bind (,gname ,gattrs ,gcontents) ,gtag
		 (assert (string-equal ,gname ,(symbol-name name)))
		 (let (,@(mapcar (lambda (attr)
						   `(,attr (cadr (find ,(symbol-name attr) ,gattrs
											   :test #'string-equal
											   :key #'car))))
						 attributes))
		   ,@body)))))



										 