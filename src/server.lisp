

(in-package :climbe)


(defvar *cim-acceptor* nil)


;; subclass the hunchentoot acceptor
(defclass cim-acceptor (hunchentoot:acceptor)
  ())

(defclass cim-ssl-acceptor (hunchentoot:ssl-acceptor)
  ())


;; specialize the dispatch methods 
(defmethod hunchentoot:acceptor-dispatch-request ((acceptor cim-acceptor) request)
  (handle-cim-request acceptor request))

(defmethod hunchentoot:acceptor-dispatch-request ((acceptor cim-ssl-acceptor) request)
  (handle-cim-request acceptor request))


(defun handle-cim-request (acceptor request)
  "Do the actions specified in the request and send output back to the acceptor."
  (declare (type cim-request request))
  



(defun acceptor-handler (acceptor request)
  (let* ((encoded (let ((data (hunchentoot:raw-post-data)))
					(cond
					  ((stringp data) data)
					  ((vectorp data) (map 'string #'code-char data))
					  (t (error "Don't understand ~S" data)))))
		 (headers (hunchentoot:headers-in*))
		 (message (decode-content encoded :encoding (slot-value acceptor 'encoding))))
    (declare (ignorable headers))

    (setf (hunchentoot:content-type*) "text/xml"
		  (hunchentoot:header-out :cimoperation) "MethodResponse")
    
    ;; check authorization
    (let ((ahandler (slot-value acceptor 'auth-handler)))
      (multiple-value-bind (username password) (hunchentoot:authorization request)
		(cond
		  ((null message)
		   ;; an error occured during xml decoding or decoding into a message
		   (destructuring-bind (message code) (cim-error-by-name :cim-err-failed)
			 (setf (hunchentoot:header-out :cimstatuscode) code
				   (hunchentoot:header-out :cimstatuscodedescription) message))
		   (cim-encode
			(make-cim-message
			 (make-cim-response
			  (let ((methname (cdr (assoc :cimmethod headers))))
				(if methname methname "Error"))
			  nil nil
			  :errorinstance
			  (make-condition 'cim-error-t
							  :description "Error parsing content"
							  :code 1)))))
		  ((or (null ahandler) (and username password (funcall ahandler username password)))
		   (let ((return-result (handle-cim-call message :encoding (slot-value acceptor 'encoding))))
			 return-result))
		  (t
		   (setf (hunchentoot:return-code*) hunchentoot:+http-forbidden+)
		   ""))))))


;; start the server
(defun start-cim-server (&key port (encoding :cimxml)
			   ssl-certificate-file ssl-privatekey-file
			   ssl-privatekey-password
			   auth-handler)
  "Start the CIM server on PORT. It will serve any url, not just /CIMOM etc.

If both SSL-CERTIFICATE-FILE and SSL-PRIVATEKEY-FILE are provided, starts
an ssl server. See the hunchentoot documentation for the meaning of these parameters.

If basic authentication is required, AUTH-HANDLER must be set to a function
accepting 2 parameters, the username and password provided by the request. It
should return non-nil on successful authentication.

Encoding must be either :CIMXML or :WSMAN. WS-Man encoding is not currently supported.
"

  (unless port
    (if (and ssl-certificate-file ssl-privatekey-file)
	(setf port *cim-default-ssl-port*)
	(setf port *cim-default-port*)))
  
  (if (assoc port *cim-acceptors*)
      ;; already have a server on this port, error
      (error "Server already running. Stop it first"))

  (ecase encoding
    (:cimxml nil)
    (:wsman (error "WS-Man encoding is not currently supported")))
  
  ;; start the server 
  (let ((acceptor
		 (if (and ssl-certificate-file ssl-privatekey-file)
			 ;; ssl
			 (make-instance
			  'cim-ssl-acceptor
			  :encoding encoding
			  :port port
			  :ssl-certificate-file ssl-certificate-file
			  :ssl-privatekey-file ssl-privatekey-file
			  :ssl-privatekey-password ssl-privatekey-password
			  :auth-handler auth-handler)
			 
			 (make-instance
			  'cim-acceptor
			  :encoding encoding
			  :port port
			  :auth-handler auth-handler))))

    (hunchentoot:start acceptor)
    (push (cons port acceptor) *cim-acceptors*)
    acceptor))

;; stop the server 

(defun stop-cim-server (&optional port)
  "Stop the CIM server"
  (cond
    ((null *cim-acceptors*) (error "No server running"))
    ((null port) (hunchentoot:stop (cdr (pop *cim-acceptors*))))
    (t (let ((acc (assoc port *cim-acceptors*)))
		 (if acc
			 (hunchentoot:stop (cdr acc))
			 (error "No acceptor on that port"))
		 (setf *cim-acceptors*
			   (remove port *cim-acceptors* :key #'car))
		 port))))
