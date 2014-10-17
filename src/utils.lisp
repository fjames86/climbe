
(in-package :climbe)

;; general utilities we need

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

(defun adjoin* (item list &key key test test-not)
  "Like ADJOIN but will replace if matches the test."
  (declare (list list)
	   ((or function null) key test test-not))
  (do ((%list list (cdr %list))
       (ret nil))
      ((null %list) (cons item ret))
    (let ((top (if key (funcall key (car %list)) (car %list))))
      (if (or (and test (funcall test item top))
	      (and test-not (not (funcall test-not item top)))
	      (eql item top))
	  (return-from adjoin* (append ret (list item) (cdr %list)))
	  (push (car %list) ret)))))

(defmacro pushnew* (item list &key key test test-not)
  "Like PUSHNEW except will also replace the object if the test matches."
  (let ((gitem (gensym "ITEM"))
	(glist (gensym "LIST")))
    `(let* ((,gitem ,item)
	    (,glist (adjoin* ,gitem ,list :key ,key :test ,test :test-not ,test-not)))
       (setf ,list ,glist))))
