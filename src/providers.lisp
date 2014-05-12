

(defpackage :providers
  (:use :cl))

(in-package :providers)


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
  (list (climbe:cim-instance "Person"
			     (|Name| :string "Frank")
			     (|Age| :uint32 27))))


;; -------------

#|
#namespace "root/mynspace"
class Frank : Person {
 Boolean Bored;
 
 String SayName([In] String Name, [Out] String Thing);
};
|#

(climbe:in-namespace "root/mynspace")

(climbe:define-cim-class |Frank| (|Person|)
  ((|Bored| :boolean :description "Is Frank bored?"))
  ((|SayName| :string ((|Name| :string :in t) (|Thing| :string :out t))))
  (:qualifiers :description "Frank class"))

(defmethod climbe:enumerate-instances ((cim |Frank|))
  (list (climbe:cim-instance "Frank"
			     (|Bored| :boolean t)
			     (|Name| :string "Frank")
			     (|Age| :unit32 31))))


;; ----------

(climbe:in-namespace "root/assoc")

(climbe:define-cim-class |CIM_Base| ()
  ((|Name| :string :key t :description "key propoerty"))
  ()
  (:qualifiers :description "Base class" :abstract t))

(climbe:define-cim-class |CIM_MyClass| (|CIM_Base|)
  ((|Age| :uint32 :description "age"))
  ((|Mymethod| :string () :description "my method")))

(climbe:define-cim-class |CIM_Assoc| ()
  ((|Source| (:ref |CIM_MyClass|))
   (|Dest| (:ref |CIM_MyClass|)))
  ())

