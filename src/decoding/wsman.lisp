

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
  nslist header body)

(defstruct header 
  to 
  resource-uri 
  reply-address 
  action 
  max-envelope-size 
  message-id 
  locale 
  selector-set 
  timeout)


;; ensure the prefix is set to wsman
(eval-when (:compile-toplevel :load-toplevel :execute)
  (setf *tag-prefix* "WSMAN"))

(deftag envelope () (header body)
  (make-envelope :header header 
                 :body body))

(deftag header () (to resourceuri replyto action maxenvelopesize locale? messageid? selectorset operationtimeout?)
  (make-header :to to
               :resource-uri resourceuri
               :reply-address replyto
               :action action
               :max-envelope-size maxenvelopesize
               :locale locale
               :message-id messageid
               :selector-set selectorset
               :timeout operationtimeout))

(deftag body () instances
  (mapcar (lambda (instance)             
            (destructuring-bind ((classname . ns) attributes &rest slots) instance
              (declare (ignore ns attributes))
              (make-cim-instance :classname classname
                                 :slots 
                                 (mapcar (lambda (slot)
                                           (destructuring-bind ((slot-name . ns) attributes &rest value) slot
                                             (declare (ignore ns attributes))
                                             (list (intern slot-name :keyword) (car value))))
                                         slots))))
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
  (make-cim-error :cim-failt text))

(deftag text () contents
  (car contents))


