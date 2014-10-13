;;;; -*- mode: lisp -*-
;;;;
;;;; This is a Common Lisp implementation of a Common Information Model (CIM)
;;;; client and server. It contains a CIM-XML encoding/decoding support and
;;;; transport over WBEM. It uses the Common Lisp libraries Drakma and Hunchentoot
;;;; for HTTP/HTTPS transport.
;;;; See documentation under /notes for implementation details and /examples for
;;;; sample code.
;;;; 
;;;; Copyright (C) 2013, Frank James <frank.a.james@gmail.com>
;;;;
;;;; You are granted the rights to distribute and use this software
;;;; as governed by the terms of the Lisp Lesser General Public License
;;;; (http://opensource.franz.com/preamble.html), also known as the LLGPL.


(in-package :climbe)

(defun make-keyword (thing)
  "make an upcased keyword"
  (intern (string-upcase (string thing)) :keyword))

(defun mapkwlist (function kwlist)
  "Map over a kwlist"
  (do ((kwlist kwlist (cddr kwlist)))
	  ((null kwlist))
	(funcall function (car kwlist) (cadr kwlist))))

(defun mapcar-kwlist (function kwlist)
  "mapcar over kwlist"
  (let (ret)
	(mapkwlist (lambda (name val)
				 (push (funcall function name val) ret))
			   kwlist)
	(nreverse ret)))

(defun mapcan-kwlist (function kwlist)
  "mapcan over kwlist"
  (let (ret)
	(mapkwlist (lambda (name val)
				 (setf ret (nconc ret (funcall function name val))))
			   kwlist)
	ret))

(defun kwlist-alist (kwlist)
  "convert from a kwlist to an alist"
  (mapcar-kwlist (lambda (n v)
				   (cons n v))
				 kwlist))

(defun alist-kwlist (alist)
  "convert from an alist to a kwlist"
  (mapcan (lambda (pair)
			(list (car pair) (cdr pair)))
		  alist))
						   
(defun assoc-kwlist (name kwlist)
  "assoc for kwlists"
  (mapkwlist (lambda (n v)
			   (when (eql n name)
				 (return-from assoc-kwlist v)))
			 kwlist)
  nil)

(defun string-split (string char)
  (let ((index (position char string)))
	(if index
		(cons (subseq string 0 index)
			  (string-split (subseq string (1+ index)) char))
		(list string))))

(defmacro aif (test then &optional else)
  `(let ((it ,test))
	 (if it ,then ,else)))

(defmacro awhen (test &body body)
  `(let ((it ,test))
	 (when it
	   ,@body)))

(defmacro acond (&rest clauses)
  (when clauses
	`(aif ,(caar clauses)
		  (progn ,@(cdar clauses))
		  (acond ,@(cdr clauses)))))


(defmacro with-gensyms (syms &body body)
  `(let (,@(mapcar (lambda (sym)
		     `(,sym (gensym)))
		   syms))
     ,@body))

(defun assoc* (name list)
  (assoc name list :test #'string-equal))

(defun find* (name list)
  (find name list :test #'string-equal))

(defmacro dolist* ((itemvar listvar list) &body body)
  `(do ((,listvar ,list (cdr ,listvar)))
       ((null ,listvar))
     (let ((,itemvar (car ,listvar)))
       ,@body)))


(defun read-until-eof (stream)
  "Reads from the stream until all input is exhaustsed"
  (with-output-to-string (s)
    (loop for c = (read-char stream nil nil)
         while c
         do (princ c s))))


(defun listen-request (port)
  "Useful for testing input from other CIM clients"
  (let ((socket (usocket:socket-listen "127.0.0.1" port :reuse-address t)))
    (let ((stream (usocket:socket-accept socket)))
      (prog1 (read-until-eof (usocket:socket-stream stream))
        (usocket:socket-close socket)))))

(defun whitespace-char-p (char)
  "Is char a whitespace character?"
  (declare (type character char))
  (or (char= char #\space)
      (char= char #\tab)
      (char= char #\return)
      (char= char #\linefeed)))
