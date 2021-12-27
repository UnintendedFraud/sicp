;;;; Observe that our model of evaluation allows for combinations
;;;; whose operators are compound expressions. Use this observation
;;;; to describe the behavior of the following procedure:

(defun a-plus-abs-b (a b)
	((if (> b 0) + -) a b))

(print (a-plus-abs-b 5 6))

;We want to add the absolute value of b. The if determines the operator
;that will be used in the sum. If b is positive, we just add with the +
;as normal. If b is negative, we add with the - so that double minus become
;a +.
