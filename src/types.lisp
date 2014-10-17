

(in-package :climbe)



;; --------------- cim types -----------

;; the 8 types of integers supported by CIM
(deftype uint8 ()
  '(integer 0 255))
(deftype sint8 ()
  '(integer -128 127))
(deftype uint16 ()
  '(integer 0 65535))
(deftype sint16 ()
  '(integer -32768 32767))
(deftype uint32 ()
  '(integer 0 4294967295))
(deftype sint32 ()
  '(integer -2147483648 2147483647))
(deftype uint64 ()
  '(integer 0 18446744073709551615))
(deftype sint64 ()
  '(integer -9223372036854775808 9223372036854775807))

;; types of real numbers
(deftype real32 () 'single-float)
(deftype real64 () 'double-float)

;; characters. supposed to be a 16-bit UCS-2 char code
(deftype char16 () 'character)

;; also there are booleans and strings but we can use the ordinary Lisp types for these

;; datetimes are either a timestamp (cim-datetime) or an interval of time (cim-interval)
(defstruct cim-datetime
  (year 0 :type integer)
  (month 0 :type (integer 0 11))
  (day 0 :type (integer 0 31))
  (hour 0 :type (integer 0 23))
  (minute 0 :type (integer 0 59))
  (second 0 :type (integer 0 59))
  (milli 0 :type (integer 0 999))
  (utc 0 :type integer))

(defun cim-datetime-string (datetime)
  "Convert a CIM datetime to a string."
  (declare (cim-datetime datetime))
  (format nil "~4,'0D~2,'0D~2,'0D~2,'0D~2,'0D~2,'0D.~6,'0D~C~3,'0D"
	  (cim-datetime-year datetime)
	  (cim-datetime-month datetime)
	  (cim-datetime-day datetime)
	  (cim-datetime-hour datetime)
	  (cim-datetime-minute datetime)
	  (cim-datetime-second datetime)
	  (cim-datetime-milli datetime)
	  (if (minusp (cim-datetime-utc datetime)) #\- #\+)
	  (abs (cim-datetime-utc datetime))))

(defmethod print-object ((datetime cim-datetime) stream)
  (print-unreadable-object (datetime stream :type t)
    (format stream "~A" (cim-datetime-string datetime))))

(defun string-cim-datetime (string)
  "Parse a string to a CIM datetime."
  (declare (string string))
  (make-cim-datetime :year (parse-integer (subseq string 0 4))
		     :month (parse-integer (subseq string 4 6))
		     :day (parse-integer (subseq string 6 8))
		     :hour (parse-integer (subseq string 8 10))
		     :minute (parse-integer (subseq string 10 12))
		     :second (parse-integer (subseq string 12 14))
		     :milli (parse-integer (subseq string 15 21))
		     :utc (parse-integer (subseq string 21 25))))

(defstruct cim-interval
  (days 0 :type (integer 0 99999999))
  (hours 0 :type (integer 0 23))
  (minutes 0 :type (integer 0 59))
  (seconds 0 :type (integer 0 59))
  (micro 0 :type (integer 0 999999)))

(defun cim-interval-string (interval)
  "Convert a CIM interval to a string."
  (declare (cim-interval interval))
  (format nil "~8,'0D~2,'0D~2,'0D~2,'0D.~6,'0D:000"
	  (cim-interval-days interval)
	  (cim-interval-hours interval)
	  (cim-interval-minutes interval)
	  (cim-interval-seconds interval)
	  (cim-interval-micro interval)))

(defmethod print-object ((interval cim-interval) stream)
  (print-unreadable-object (interval stream :type t)
    (format stream "~A" (cim-interval-string interval))))

(defun string-cim-interval (string)
  "Parse a CIM interval from a string."
  (declare (string string))
  (make-cim-interval :days (parse-integer (subseq string 0 8))
		     :hours (parse-integer (subseq string 8 10))
		     :minutes (parse-integer (subseq string 10 12))
		     :seconds (parse-integer (subseq string 12 14))
		     :micro (parse-integer (subseq string 15 21))))

;; public CIM type (combines the two types)

(deftype datetime ()
  '(or cim-datetime cim-interval))

(defun string-datetime (string)
  "Convert a string to a datetime/interval."
  (declare (string string))
  (ecase (char string 21)
    (#\:
     ;; interval
     (string-cim-interval string))
    ((#\+ #\-)
     ;; datetime
     (string-cim-datetime string))))

(defun datetime-string (datetime-or-interval)
  "Convert a datetime/interval to a string."
  (declare (datetime datetime-or-interval))
  (etypecase datetime-or-interval
    (cim-datetime (cim-datetime-string datetime-or-interval))
    (cim-interval (cim-interval-string datetime-or-interval))))

;; a cim primitive type
(deftype cim-primitive ()
  '(or
    sint8 sint16 sint32 sint64
    uint8 uint16 uint32 uint64
    boolean
    character
    string
    real32 real64
    datetime))

