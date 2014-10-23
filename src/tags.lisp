

(in-package :climbe)

(defun find-tag (name tags)
  "Find the tag with the name provided. Expects TAGS to be an alist."
  (declare (type string name))
  (find name tags :key #'first :test #'string-equal))

(defun find-tags (name tags)
  "Find all tags with a matching name."
  (mapcan (lambda (tag)
            (when (string-equal name (first tag))
              (list tag)))
          tags))

(defun last-char (string)
  (declare (type string string))
  (char string (1- (length string))))

(defun element-list-p (symbol)
  (let ((char (last-char (symbol-name symbol))))
    (char= char #\*)))

(defun element-name (symbol)
  (let ((string (symbol-name symbol)))
    (if (char= (last-char string) #\*)
        (subseq string 0 (1- (length string)))
        string)))


(defmacro deftag (name attributes elements &body body)
  "Define a decoding handler. 

ATTRIBUTES should be a list of symbols that will be bound to the attrbiutes of the same string name.

ELEMENTS should be either a symbol, in which case it will be bound directly to the unprocessed content, or a 
list of symbols naming other tag-names. These will be bound to the symbol.

If an element name ends with a #\* character it will refer to a list of such elements and will be bound to a list instead. The resulting Lisp symbol will NOT have the #\* character at the end."
  (let ((gtag (gensym "TAG"))
        (gname (gensym "NAME"))
        (gattrs (gensym "ATTRS"))
        (gcontent (gensym "CONTENT"))
        (gelements (mapcar (lambda (element)
                             (gensym (symbol-name element)))
                           (unless (symbolp elements)
                             elements))))
    `(defun ,(intern (concatenate 'string "DECODE-CIMXML-" (symbol-name name)))
         (,gtag)
       (destructuring-bind (,gname ,gattrs &rest ,gcontent) ,gtag
         ,(unless attributes 
                  `(declare (ignore ,gattrs)))
         (assert (string-equal ,gname ,(symbol-name name)))
         ;; extract the element tags
         (let (,@(mapcar (lambda (gelement element)
                           (let ((element-name (element-name element)))
                             `(,gelement ,(if (element-list-p element)
                                              `(find-tags ,element-name ,gcontent)
                                              `(find-tag ,element-name ,gcontent)))))
                         gelements
                         (unless (symbolp elements) elements)))
           ;; decode the elements 
           (let (,@(mapcar (lambda (gelement element)
                             (let ((element-name (element-name element)))
                               `(,(intern element-name) 
                                  (when ,gelement
                                    ,(if (element-list-p element)
                                         `(mapcar (function ,(intern (concatenate 'string 
                                                                                  "DECODE-CIMXML-" 
                                                                                  element-name)))
                                                  ,gelement)
                                         `(,(intern (concatenate 'string 
                                                                 "DECODE-CIMXML-" 
                                                                 element-name))
                                            ,gelement))))))
                           gelements
                           (unless (symbolp elements) elements))
                 ;; extract the attributes
                 ,@(mapcar (lambda (attr)
                             `(,attr (second (find-tag ,(symbol-name attr) ,gattrs))))
                           attributes)
                   ;; if binding to the entire content
                   ,@(when (symbolp elements)
                           `((,elements ,gcontent))))
               ,@body))))))

