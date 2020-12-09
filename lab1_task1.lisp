(print "Enter base a")
(defvar a (read))
(print "Enter power k")
(defvar k (read))

(defun sqrt1 (a k n)
    (if (= n 0) 
        0.7
        (if (> n 0)
            (* 
                (/ 1 k) 
                (+ 
                    (* 
                        (- k 1) 
                        (sqrt1 a k (- n 1)) 
                    ) 
                    (/ 
                        a
                        (expt (sqrt1 a k (- n 1)) (- k 1)) 
                    )
                )
            )
            0
        )
    )
)

(print (sqrt1 a k 10))