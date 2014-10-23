

(defpackage :climbe.test.decoding
  (:use :cl :climbe))

(in-package :climbe.test.decoding)

(defun test-content1 ()
  (climbe::decode-cim "<?xml version=\"1.0\" encoding=\"utf-8\" ?>
<CIM CIMVERSION=\"2.0\" DTDVERSION=\"2.0\"><MESSAGE ID=\"1\" PROTOCOLVERSION=\"2.0\"><SIMPLERSP><IMETHODRESPONSE NAME=\"EnumerateClassNames\"><IRETURNVALUE><CLASSNAME NAME=\"MyClass1\" /><CLASSNAME NAME=\"MyClass2\" /></IRETURNVALUE></IMETHODRESPONSE></SIMPLERSP></MESSAGE></CIM>
"))

(defun test-content2 ()
  (let ((str    (climbe::encode-enumerate-instances "MyLittleClass" :namespace "root/cimv2")))
    (princ str)
    (climbe::decode-cim str)))

(defun test-content3 ()
  (let ((str (climbe::encode-get-instance (climbe::make-cim-instance  :classname "MyLittleClass"
                                                                      :slots '(("xxx" "yyy" string)))
                                          :namespace "root/cimv2" )))
    (princ str)
    (climbe::decode-cim str)))



