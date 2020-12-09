(defun *c (n1 n2)
    (let ((a (realpart n1)) (b (imagpart n1)) (c (realpart n2)) (d (imagpart n2)))
        (complex (- (* a c) (* b d))  (- (* a d) (* b c)))
    )
)

(defun main (l)
    (if (null l)
        ()
        (append (list (*c (car l) (car (cdr l)))) (main (cdr (cdr l))))))

(print (main '(#C(1 2) #C(0 1) #C(3 4) #C(2 2))))