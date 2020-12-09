(defun d2b (x)
    (if (> x 1)
        (+ (* (d2b (floor x 2)) 10) (mod x 2))
        x
    )
)

(defun b2d (x &optional(a 1))
    (if (>= x 10)
        (+ (* (mod x 10) a) (b2d (floor x 10) (* 2 a)))
        (* x a)
    )
)

(print "Enter decimal")
(print (d2b (read)))

(print "Enter binary")
(print (b2d (read)))