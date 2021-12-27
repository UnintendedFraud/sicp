;;;; Define a procedure that takes three numbers as arguments
;;;; and returns the sum of the squares of the two larger numbers.

(defun square (x) (* x x))

(defun sum (a b c)
  (cond
    ((and (> b a) (> c a)) (+ (square b) (square c)))
    ((and (> a b) (> c b)) (+ (square a) (square c)))
    (+ (square a) (square b))
  )
)