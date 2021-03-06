

(in-package #:climbe.decoding)


;; in order to properly decode the wsman messages we need to be able to understand the 
;; SOAP message format (envelopes). This requires that we can parse the namespaced xml

(defun parse-wsman (stream)
  "Parse some xml from the stream"
  (cxml:parse-stream stream (cxml-xmls:make-xmls-builder)))

(defun parse-wsman-string (string)
  "Parse some xml form the string"
  (let ((octets (babel:string-to-octets string)))
    (flexi-streams:with-input-from-sequence (stream octets)
      (parse-wsman stream))))

(defun decode-wsman (stream)
  "Decode a WS-Man messsage from the stream."
  (decode-wsman-envelope (parse-wsman stream)))






;; structures we use to put the wsman contents into 
(defstruct envelope 
  header body)

(defstruct header 
  to 
  resource-uri 
  reply-address 
  action 
  message-id)



;; ensure the prefix is set to wsman
(eval-when (:compile-toplevel :load-toplevel :execute)
  (setf *tag-prefix* "WSMAN"))

(deftag envelope () (header body)
  (make-envelope :header header 
                 :body body))

(deftag header () (to resourceuri replyto action messageid)
  (make-header :to to
               :resource-uri resourceuri
               :reply-address replyto
               :action action
               :message-id messageid))

(deftag body () instances
  (mapcar (lambda (instance)
	    (let ((tname (car instance)))
	      (cond
		((and (stringp tname) (string-equal tname "CLASS"))
		 ;; a CIM-XML encoded class. we get this from get-class
		 ;; calls to WinRM 
		 (decode-cimxml-class instance))
		((and (listp tname) (string-equal (car tname) "PullResponse"))
		 ;; (pull-resonse nil (enumeration-context) (items))
		 (let ((items (cddr (find "Items" (cddr instance) :key #'caar :test #'string-equal))))
		   items))
		(t
		 ;; WS-Man instances should look like this
		 (destructuring-bind ((classname . ns) attributes &rest slots) instance
		   (declare (ignore ns attributes))
		   (make-cim-instance :name classname
				      :slots 
				      (mapcar (lambda (slot)
						(destructuring-bind ((slot-name . ns) attributes &rest value) slot
						  (declare (ignore ns attributes))						      
						  (list (intern slot-name :keyword) 
							(decode-heuristically (car value))
							nil)))
					      slots)))))))
	      instances))
                                        

(deftag to () uri
  (puri:parse-uri (car uri)))
  
(deftag resourceuri () uri
  (puri:parse-uri (car uri)))

(deftag replyto () (address)
  address)

(deftag address () uri
  (puri:parse-uri (car uri)))

(deftag action () uri
  (puri:parse-uri (car uri)))

(deftag maxenvelopesize () size
  (parse-integer (car size)))

(deftag locale (lang) contents
  (declare (ignore contents))
  lang)

(deftag messageid () uuid
  (car uuid))

(deftag selectorset () (selector*)
  selector)

(deftag selector (name) value
  (list name (car value)))

(deftag operationtimeout () timeout
  (car timeout))

(deftag fault () (text)
  (make-cim-error :failed text))

(deftag text () contents
  (car contents))



