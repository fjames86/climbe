
;;;;
;;;; Example showing how to call WMI via the WinRM service 
;;;; Frank James 2014
;;;;

;;; The target machine must be windows server 2012.
;;; The WinRM service MUST be running and accepting "Negotiate" requests.
;;; The service can be listening on either HTTP or HTTPS, you can set 
;;; the *wsman-uri* to the location of the listener.
;;;

(defpackage #:climbe.test.winrm
  (:use #:cl #:climbe))

(in-package #:climbe.test.winrm)

;; set the following to your appropriate values:
;; *wsman-uri* to the URI of the WinRM listener, e.g. "https://my.host:5985/wsman"
;; *wsman-username* to your username, e.g. "administrator"
;; *wsman-password* to your password, e.g. "password"


(defun enumerate-logical-disks ()
  "enumerate all logical disks"
  (call-wsman-enumerate-instances "Win32_LogicalDisk" 
				  :namespace "root/cimv2"))

(defun enumerate-instances (class-name namespace)
  "eumerate all instances of the class in the namespace"
  (call-wsman-enumerate-instances class-name 
				  :namespace namespace))
(defun enumerate-classes (namespace)
  "enumerate all the classes in the namespace"
  (call-wsman-enumerate-classes :namespace namespace))


