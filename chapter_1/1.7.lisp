;;;; Thee good-enough? test used in computing square roots will not
;;;; be very effective for finding the square roots of very small numbers.
;;;; Also, in real computers, arithmetic operations are almost always
;;;; performed with limited precision. This makes our test inadequate for very large
;;;; numbers. Explain these statements, with examples showing how the test fails
;;;; for small and large numbers.

(defun square (x) (* x x))

(defun good-enough? (guess x)
  (< (abs (- (square guess) x)) 0.001)
)

(defun average (x y)
  (/ (+ x y) 2)
)

(defun improve (guess x)
  (average guess (/ x guess))
)

(defun sqrt-iter (guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)
  )
)

(defun sqrt2 (x)
  (sqrt-iter 1.0 x)
)

;; == Large numbers ==

;; (print (sqrt 1000000000))
;; result is 31622.77

;; (print (sqrt2 1000000000))
;; infinite loop with the correct guess 31622.777

;; For big numbers (e.g. above), due to rounding errors by the machine,
;; the improve function reaches a point where the improved guess is actually
;; the same guess, triggering an infinite loop. The bigger the number is, the
;; bigger the rounding errors will be in absolute value, meaning comparing the
;; absolute difference from our (squared) result with the original value will never work.

;; == Small numbers ==

;; (print (sqrt 0.000001))
;; result is 0.001

;; (print (sqrt2 0.000001))
;; result is 0.03126...

;; (print (sqrt2 0.0001))
;; result is 0.032308...

;; For small numbers, the same logic as big numbers applied, but the other way around.
;; The algorithm stops early because the absolute value difference between the squared
;; value of our guess and the original value will always be smaller than our
;; arbitrary comparison value we use to stop the loop. Therefore we will stop early
;; and return the wrong result, as shown as the example above.
;; It looks like we stop around 0.03... which happen to be the square root of our
;; comparison value: 0.001. It makes sense.


;;;; An alternative strategy for implementing good-enough? is to watch
;;;; how guess changes from one iteration to the next and to
;;;; stop when the change is a very small fraction of the guess.
;;;; Design a square-root procedure that uses this kind of end
;;;; test. Does this work better for small and large numbers?

(defvar tmpPrev)
(defvar previousGuess 0.0)

(defun good-enough2? (guess)
  (setq tmpPrev previousGuess)
  (setq previousGuess guess)
  (< (abs (- guess tmpPrev)) 0.001)
)

(defun sqrt-iter2 (guess x)
  (if (good-enough2? guess)
    guess
    (sqrt-iter2 (improve guess x) x)
  )
)

(defun sqrt3 (x)
  (sqrt-iter2 1.0 x)
)

;; == Large numbers ==

;; (print (sqrt 1000000000))
;; result is 31622.77

;; (print (sqrt3 1000000000))
;; Correct guess 31622.777

;; Stopping the loop when the guess does not change much fixed our
;; infinite loop issue we had doing the absolute difference method

;; == Small numbers ==

;; (print (sqrt 0.000001))
;; result is 0.001

;; (print (sqrt3 0.000001))
;; result is 0.001296, which rounding error aside is correct

;; (print (sqrt 0.0001))
;; result is 0.01

;; (print (sqrt3 0.0001))
;; result is 0.010000714, which is also correct

;; It seems that the issue is also fixed for small numbers.

;; Conclusion
;; Refining our guess by only looking at the current and previous guess,
;; we are able to remove the machine rounding errors from the equation
;; to some degree. Any issue we would have now would most likely be on
;; the algorithm itself and not some edge case, which is usually what we
;; want.