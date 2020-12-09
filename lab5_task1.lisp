(defun reverce-fraction (x)
    (/ (denominator x) (numerator x)))

(defun divide-fractions(a b)
    (* a (reverce-fraction b)))

(defun main (l)
    (if (null l)
        ()
        (append (list (divide-fractions (car l) (car (cdr l)))) (main (cdr (cdr l))))))

(print (main '(1/2 3/4 5/6 7/8)))