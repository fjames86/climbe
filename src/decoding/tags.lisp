

(in-package #:climbe.decoding)

;; these functions are used in the deftag macro so lets define them all in 
;; a seperate file so they are available when we actually use the macro.

;; tag format: (tag-name tag-attributes &rest contents)
;; tag-name: name | (name . namespace)
;; tag-attributes: (name . value)

(defun tag-name (tag)
  (let ((n (first tag)))
    (if (consp n)
        (car n)
        n)))

(defun tag= (name tag)
  (when (listp tag)
    (let ((n (tag-name tag)))
      (string-equal name n))))

(defun find-tag (name tags)
  "Find the tag with the name provided. Expects TAGS to be an alist."
  (declare (type string name))
  (when (listp tags)
    (find-if (lambda (tag)
               (tag= name tag))
             tags)))

(defun find-tags (name tags)
  "Find all tags with a matching name."
  (mapcan (lambda (tag)	      
            (when (tag= name tag)
              (list tag)))
          tags))

(defun last-char (string)
  "Get the last character of the string."
  (declare (type string string))
  (char string (1- (length string))))

;; -------- various types of elements -----------

;; bind these to a list 
(defun element-list-p (symbol)
  "Elements that appear as a list of 0 or more end in a #\* character."
  (let ((char (last-char (symbol-name symbol))))
    (char= char #\*)))

;; bind to a list and validate it is non-empty
(defun element-nlist-p (symbol)
  "Elements that appear as a non-empty list of 1 or more end in a #\+ character."
  (char= (last-char (symbol-name symbol)) #\+))

;; bind to the element or nil and validate there is at most 1 
(defun element-maybe-p (symbol)
  "Elements that may or may not appear end with a #\? character."
  (char= (last-char (symbol-name symbol)) #\?))

;; -------------------------------------------------

(defun element-name (symbol)
  (let ((string (symbol-name symbol)))
    (if (member (last-char string) '(#\* #\+ #\?) :test #'char=)
        (subseq string 0 (1- (length string)))
        string)))

(defparameter *tag-prefix* "CIMXML")

(defmacro deftag (name attributes elements &body body)
  "Define a decoding handler. 

ATTRIBUTES should be a list of symbols that will be bound to the attrbiutes of the same string name.

ELEMENTS should be either a symbol, in which case it will be bound directly to the unprocessed content, or a 
list of symbols naming other tag-names. These will be bound to the symbol.

If an element name ends with a #\* character it will refer to a list of such elements and will be bound to a list instead. The resulting Lisp symbol will NOT have the #\* character at the end.

Note that all multually interacting DEFTAG forms must be present in the same compilation unit (i.e. file)
because they call each other so otherwise the function calls will not resolve."
  (let ((gtag (gensym "TAG"))
        (gname (gensym "NAME"))
        (gattrs (gensym "ATTRS"))
        (gcontent (gensym "CONTENT"))
        (gelements (mapcar (lambda (element)
                             (gensym (symbol-name element)))
                           (unless (symbolp elements)
                             elements))))
    `(defun ,(intern (format nil "DECODE-~A-~A" *tag-prefix* (symbol-name name)))
         (,gtag)
       (destructuring-bind (,gname ,gattrs &rest ,gcontent) ,gtag
         (declare (ignore ,gname))
         ,(unless attributes 
                  `(declare (ignore ,gattrs)))         
;;         (assert (string-equal ,gname ,(symbol-name name)))
         ;; extract the element tags
         (let (,@(mapcar (lambda (gelement element)
                           (let ((element-name (element-name element)))
                             `(,gelement ,(cond
					   ((element-list-p element)
					    ;; 0 or more such tags
					    `(find-tags ,element-name ,gcontent))
					   ((element-nlist-p element)
					    ;; at least 1 such tag
					    `(let ((tags (find-tags ,element-name ,gcontent)))
					       (if tags 
						   tags 
						   (error ,(format nil "No tags found for ~S." element-name)))))
					   (t ;;(element-maybe-p element)
					    ;; 0 or 1 such tags
					    `(let ((tags (find-tags ,element-name ,gcontent)))
					       (if (cdr tags)
						   (error ,(format nil "More than one tag ~S present" element-name))
						   (first tags))))))))
                         gelements
                         (unless (symbolp elements) elements)))
           ;; decode the elements 
           (let (,@(mapcar (lambda (gelement element)
                             (let ((element-name (element-name element)))
                               `(,(intern element-name) 
                                  (when ,gelement
                                    ,(cond
				      ((or (element-list-p element) (element-nlist-p element))
				       `(mapcar (function ,(intern (format nil
                                                           "DECODE-~A-~A" *tag-prefix*
                                                           element-name)))
						,gelement))
				      (t
				       `(,(intern (format nil
                                          "DECODE-~A-~A" *tag-prefix*
                                          element-name))
					  ,gelement)))))))
                           gelements
                           (unless (symbolp elements) elements))
                 ;; extract the attributes
                 ,@(mapcar (lambda (attr)
                             `(,attr (second (find-tag ,(symbol-name attr) ,gattrs))))
                           attributes)
                   ;; if binding to the entire content
                   ,@(when (symbolp elements)
                           `((,elements ,gcontent))))
	     ;; execute the body
	     ,@body))))))

