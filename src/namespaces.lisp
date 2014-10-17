

(in-package :climbe)


;; ----- namespaces ------

(defstruct cim-namespace
  name parent children classes qualifiers)

(defmethod cim-name ((namespace cim-namespace))
  (cim-namespace-name namespace))

(defmethod print-object ((ns cim-namespace) stream)
  (format stream "#S(CIM-NAMESPACE :NAME ~S :CHILDREN ~S)"
	  (cim-namespace-name ns)
	  (mapcar #'cim-namespace-name (cim-namespace-children ns))))

(defparameter *namespaces* (make-cim-namespace :name "root")
  "Root node of the tree of namespaces.")

(defun parse-namespace (name)
  "Parse a namespace string of form \\server\root\cimv2 to the individual components.

The \\server component is optional, and is typically only used when communicating with remote machines over a network.

Namespace nodes are delimited with the #\/ character only (backslashes are not allowed)."
  (declare (string name))
  (flet ((scan-server (name)
	   (declare (optimize (debug 3)))
	   (multiple-value-bind (start end starts ends) 
	       (cl-ppcre:scan "(//[\\.\\w]+)?" name)
	     (declare (ignore start end)
		      (optimize (debug 3)))
	     (if (and starts ends (aref starts 0))
		 (values (subseq name (+ (aref starts 0) 2) (aref ends 0))
			 (aref ends 0))
		 (values nil 0))))
	 (scan-namespace (name)
	   (multiple-value-bind (start end starts ends)
	       (cl-ppcre:scan "/?(\\w+)" name)
	     (declare (ignore start))
	     (if (and starts ends (aref starts 0))
		 (values (subseq name (aref starts 0) (aref ends 0))
			 end)
		 (values nil 0)))))
    (multiple-value-bind (server pos) (scan-server name)
      (do ((p pos)
	   (ns-list nil))
	  ((null p) (values (nreverse ns-list) server))
	(multiple-value-bind (n end) (scan-namespace (subseq name p))
	  (if n
	      (setf p (+ p end)
		    ns-list (cons n ns-list))
	      (setf p nil)))))))

(defun find-namespace (name)
  "Find a namespace given the stringy name."
  (declare (string name))
  (do ((ns *namespaces*)
       (ns-list (cdr (parse-namespace name)) (cdr ns-list)))
      ((null ns-list) ns)
    (let ((n (find (car ns-list) (cim-namespace-children ns)
		   :test #'string-equal
		   :key #'cim-namespace-name)))
      (if n
	  (setf ns n)
	  (error "Namespace ~S not found" name)))))

(defun ensure-namespace (name)
  "Ensure the namespace exists, creating it and its nodes if they don't yet exist."
  (declare (string name))
  (do ((ns *namespaces* (or (find (car ns-list) (cim-namespace-children ns)
				  :test #'string-equal
				  :key #'cim-namespace-name)
			    (let ((new (make-cim-namespace :name (car ns-list)
							   :parent ns)))
			      (push new (cim-namespace-children ns))
			      new)))
       (ns-list (cdr (parse-namespace name)) (cdr ns-list)))
      ((null ns-list) ns)))

(defun namespace-tree (&optional (root *namespaces*))
  "Convert namespaces to a tree for more easy inspection."
  (labels ((tree (ns)
	     (cons (cim-namespace-name ns)
		   (mapcar #'tree
			   (cim-namespace-children ns)))))
    (tree root)))

(defun namespace-list (namespace)
  "Get the list of namespaces from the root node down to this namespace."
  (declare (type cim-namespace namespace))
  (let ((parent (cim-namespace-parent namespace)))
    (if parent
	(nconc (namespace-list parent) (list namespace))
	(list namespace))))

;; current namespace
(defparameter *namespace* (find-namespace "root")
  "Current namespace to use when defining or searching.")

(defmacro in-namespace (namespace)
  "Enter namespace, creating if it doesn't exist."
  `(eval-when (:compile-toplevel :load-toplevel :execute)
     (setf *namespace* (ensure-namespace ,namespace))))

(defmacro with-namespace ((namespace) &body body)
  "Execute body with locally modified namespace."
  `(let ((*namespace (find-namespace ,namespace)))
     ,@body))

