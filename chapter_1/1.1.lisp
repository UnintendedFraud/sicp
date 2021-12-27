;;; 1.1
;;; Below is a sequence of expressions. What is the result printed
;;; by the interpreter in response to each expression? Assume that
;;; the sequence is to be evaluated in the order in which it is presented.

;;; print 10
10

;;; print 12
(+ 5 3 4)

;;; print 8
(- 9 1)

;;; print 3
(/ 6 2)

;;; print 4
(+ (* 2 4) (- 4 6))


(defvar a 3) ;; 3
(defvar b (+ a 1)) ;; 4

;;; print 19
(+ a b (* a b))

;;; print nil
(= a b)

;;; print 4 (b)
(if (and (> b a) (< b (* a b)))
  b
  a
)


(cond ((= a 4) 6)
((= b 4) (+ 6 7 a))
(else 25))


(+ 2 (if (> b a) b a))
(* (cond ((> a b) a)
((< a b) b)
(else -1))
(+ a 1))