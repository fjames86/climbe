

(defpackage :climbe-providers
  (:use :cl))

(in-package :climbe-providers)


#|
#namespace "root/mynspace"
class Person {
  String Name;
  Uint32 Age;

  String SayHello();
};
|#

(climbe:in-namespace "root/mynspace")

(defun sayhello ()
  "hello")

(climbe:define-cim-class |Person| ()
  ((|Name| :string)
   (|Age| :uint32))
  ((|SayHello| :string () :function #'sayhello)))


(defmethod climbe:enumerate-instances ((class |Person|))
  (list (climbe:make-cim-instance "Person"
								  (list (climbe:make-cim-slot '|Name| :string "Frank")
										(climbe:make-cim-slot '|Age| :uint32 27)))))

								  

