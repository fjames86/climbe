
(in-package #:cl-user)

(defpackage #:climbe
  (:use #:cl
        #:climbe.core
        #:climbe.cimom
        #:climbe.encoding
        #:climbe.decoding
        #:climbe.client
        #:climbe.server
		#:climbe.schema))

(in-package #:climbe)

;; export all the imported symbols
(dolist (package (mapcar #'find-package 
                         '(#:climbe.core #:climbe.cimom #:climbe.encoding 
                           #:climbe.decoding #:climbe.client #:climbe.server
						   #:climbe.schema)))
  (do-external-symbols (sym package)
    (export sym)))

