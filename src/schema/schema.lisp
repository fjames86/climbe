
(in-package #:climbe.schema)

;; start by encoding the climbe objects into Lisp forms 


(defun make-lisp-name (cim-name)
  "Generate a Lisp symbol from a CIM name."
  (declare (type string cim-name))
  (intern (string-upcase cim-name)))

(defun encode-lisp-class (cim-class)
  "Generate the DEFCIM-CLASS form needed to generate this class."
  (declare (type cim-class cim-class))
  `(defcim-class ,(make-lisp-name (cim-name cim-class))
       (,@(let ((sc (cim-class-superclass cim-class)))
            (when sc 
              `(,(make-lisp-name sc)))))
     ,(mapcar (lambda (slot)
                (encode-lisp-slot slot))
              (cim-class-slots cim-class))
     ;; options
     (:cim-name ,(cim-name cim-class))
     (:qualifiers ,@(encode-lisp-qualifiers (cim-qualifiers cim-class)))))

(defun encode-lisp-slot (slot)
  "Encode a CIM-SLOT into the Lisp form which would be entered into a DEFCIM-CLASS form."
  (destructuring-bind (slot-name slot-value slot-type &optional qualifiers) slot
    `(,(make-lisp-name slot-name)
       ,slot-type 
       :cim-name ,slot-name 
       :qualifiers (,@(encode-lisp-qualifiers qualifiers))
       :initform ,slot-value)))
       

(defun encode-lisp-qualifiers (qlist)
  "QLIST is alist of name-qualifier pairs. we can to convert this to a keyword list"
  (mapcan (lambda (pair)
            (destructuring-bind (q . val) pair
              (if (eq (cim-qualifier-type q) 'boolean)
                  (list (cim-qualifier-symbol (cim-qualifier-name q)))
                  (list (list (cim-qualifier-symbol (cim-qualifier-name q))
                              val)))))
          qlist))


(defun encode-lisp-method (method class-symbol)
  "Generate a Lisp form which can be used as a template for the input method. 

CLASS-SYBMOL should be the Lisp symbol naming the CIM class to which this method belongs."
  (declare (type cim-method method)
           (type symbol class-symbol))
  `(defcim-method ,(make-lisp-name (cim-name method))
       ((instance ,class-symbol)
        ,@(mapcar (lambda (pair)
                    (destructuring-bind (symbol . parameter) pair
                      `(,symbol
                        ,(cim-parameter-type parameter)
                        ,(cim-name parameter)
                        ,@(encode-lisp-qualifiers (cim-parameter-qualifiers parameter)))))
                  (cim-method-parameters method)))
       ((:cim-name ,(cim-name method))
        (:qualifiers ,@(encode-lisp-qualifiers (cim-method-qualifiers method))))))

(defun encode-lisp-qualifier (qualifier)
  "Encode a qualifier definition form for a user-defined qualifier."
  `(%defqualifier ,(cim-qualifier-symbol (cim-name qualifier))
                  (make-cim-qualifier :name ,(cim-name qualifier)
                                      :type ,(cim-qualifier-type qualifier)
                                      :qualifiers (list ,@(encode-lisp-qualifiers 
                                                           (cim-qualifier-qualifiers qualifier)))
                                      :scope (list ,@(cim-qualifier-scope qualifier))
                                      :flavour (list ,@(cim-qualifier-flavour qualifier))
                                      :default ,(cim-qualifier-default qualifier))))

                   
(defun compile-schema (xml-file &optional lisp-file)
  "Load a definition from a CIMXML encoded file and generate the equalivalent Lisp forms"
  (declare (type pathname xml-file))

  ;; if a lisp-file is not specified then make a default one
  (unless lisp-file
    (setf lisp-file 
          (make-pathname :type "lisp" 
                         :name (pathname-name xml-file) 
                         :directory (pathname-directory xml-file))))

  (let ((declarations
         (decode-cimxml-cim (decode-xml-file xml-file))))

    (with-open-file (f lisp-file :direction :output :if-exists :supersede)
      (dolist (declaration declarations)
        (assert (cim-declaration-p declaration))

        ;; add the qualifiers 
        (dolist (q (cim-declaration-qualifiers declaration))
          ;; encode the lisp file as a Lisp form
          (pprint (encode-lisp-qualifier q) f))
        
        ;; add the classes
        (dolist (class (cim-declaration-classes declaration))
	  (when (cim-class-p class)
	    (pprint (encode-lisp-class class) f)
        
	    ;; encode the methods of the class
	    (dolist (method (cim-class-methods class))
	      (pprint (encode-lisp-method method (make-lisp-name (cim-name class)))
		      f)))))))

  nil)

(defun compile-schema* (pathspec)
  (dolist (xml-file (directory pathspec))    
    (print xml-file)
    (compile-schema xml-file)))

