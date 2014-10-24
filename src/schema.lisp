
(in-package :climbe)

(defun load-schema (file)
  "Load a definition from a CIMXML encoded file."
  (let ((declarations
	 (decode-cimxml-cim (decode-xml-file file))))
    (dolist (declaration declarations)
      (assert (cim-declaration-p declaration))
      (let ((ns (and (cim-declaration-namespace declaration)
		     (find-namespace (cim-declaration-namespace declaration)))))
	;; add the qualifiers 
	(dolist (q (cim-declaration-qualifiers declaration))
	  (%defqualifier (intern (cim-name q)) q))
	
	;; add the classes
	(dolist (class (cim-declaration-classes declaration))
	  (add-class-to-namespace class (or ns *namespace*) :super-classes nil)))))

  nil)




;; two approaches:
;; 1. decode the xml using the normal technology to generate the standard climbe objects
;; Write functions which operate on these to generate Lisp forms 
;; 2. write a new set of tag decoders which are used to generate the Lisp forms directly in 
;; the decoding routines
;; Clearly option 1 is better?

