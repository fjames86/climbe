
(in-package #:cl-user)

(in-package #:climbe.utils)

;; general utilities we need

(defun kwassoc (item kwlist &key key test test-not)
  "Like assoc but with keyword lists."
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

(defmacro defconstant* (name value &optional doc)
  "Define constants which are not EQL (such as strings etc.)."
  `(defconstant ,name (if (boundp ',name) (symbol-value ',name) ,value)
     ,@(when doc (list doc))))

;; copied from s-xml
(defun encode-xml-string (string &key (start 0) end)
  "Write the characters of string to stream using basic XML conventions"
  (with-output-to-string (stream)
	(loop for offset upfrom start below (or end (length string))
	   for char = (char string offset)
	   do (case char
			(#\& (write-string "&amp;" stream))
			(#\< (write-string "&lt;" stream))
			(#\> (write-string "&gt;" stream))
			(#\" (write-string "&quot;" stream))
			((#\newline #\return #\tab) (write-char char stream))
			(t (if (and (<= 32 (char-code char))
						(<= (char-code char) 126))
				   (write-char char stream)
				   (progn
					 (write-string "&#x" stream)
					 (write (char-code char) :stream stream :base 16)
					 (write-char #\; stream))))))))
