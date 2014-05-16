

(defpackage :providers
  (:use :cl))

(in-package :providers)

#|

class ClassA {
  [Key]
  String Name;
};

class ClassB {
  [Key];
  String Name;
};

[Association]
class ClassAssoc {
  [Key]
  REF ClassA Prop1;
  [Key]
  REF ClassB Prop2;
};


|#

(climbe:in-namespace "root/cimv2")

(climbe:define-cim-class |ClassA| ()
  ((|Name| :string :key t))
  ())

(climbe:define-cim-class |ClassB| ()
  ((|Name| :string :key t))
  ())

(climbe:define-cim-class |ClassAssoc| ()
  ((|Prop1| (:ref |ClassA|) :key t)
   (|Prop2| (:ref |ClassA|) :key t))
  ()
  (:qualifiers :association t))

(defparameter *classa* (list (climbe:cim-instance "ClassA" (|Name| :string "Frank"))))
(defparameter *classb* (list (climbe:cim-instance "ClassB" (|Name| :string "James"))))
(defparameter *assocs* (list (climbe:cim-instance "ClassAssoc" 
					    (|Prop1| (:ref |ClassA|) (climbe::cim-instance-reference (climbe:cim-class-by-name :classa) (car *classa*)))
					    (|Prop2| (:ref |ClassB|) (climbe::cim-instance-reference (climbe:cim-class-by-name :classb) (car *classb*))))))

(defmethod climbe:enumerate-instances ((class |ClassA|))
  *classa*)

(defmethod climbe:enumerate-instances ((class |ClassB|))
  *classb*)

(defmethod climbe:enumerate-instances ((class |ClassAssoc|))
  *assocs*)

(defmethod climbe::associator-instances ((class |ClassAssoc|) instance)
  (let ((name (climbe::cim-name instance)))
    (cond
      ((string-equal name :classa)
       *classb*)
      ((string-equal name :classb)
       *classa*)
      (t (climbe:cim-error :cim-err-invalid-parameter name)))))

(defmethod climbe::reference-instances ((class |ClassAssoc|) instance)
  (let ((name (climbe::cim-name instance)))
    (cond
      ((string-equal name :classa)
       *assocs*)
      ((string-equal name :classb)
       *assocs*)
      (t (climbe:cim-error :cim-err-invalid-parameter name)))))




