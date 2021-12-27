;;;; Ben Bitdiddle has invented a test to determine whether the interpreter
;;;; he is faced with is using applicativeorder evaluation or normal-order
;;;; evaluation. He defines the following two procedures:
;;;; 
;;;; (define (p) (p))
;;;; (define (test x y)
;;;; (if (= x 0) 0 y))
;;;; 
;;;; Then he evaluates the expression:
;;;; 
;;;; (test 0 (p))
;;;; 
;;;; What behavior will Ben observe with an interpreter that uses applicative-order
;;;; evaluation? What behavior will he observe with an interpreter that uses normal-order
;;;; evaluation? Explain your answer. (Assume that the evaluation rule for the special
;;;; form if is the same whether the interpreter is using normal or applicative order:
;;;; the predicate expression is evaluated first, and the result determines whether
;;;; to evaluate the consequent or the alternative expression.)

In normal order application, test will evaluate 0 first and return 0 as a result.
In applicative order application, test will evaluate (p) first, which will create
an infinite loop as it return itself.