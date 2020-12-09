(defun ln (x &optional(n 1))
    (if (< n 10)
        (+
            (* 
                (/ (expt -1 (+ n 1)) n) 
                (expt (- x 1) n)
            )
            (ln x (+ n 1))
        )
        0
    )
)

(defun y (x) 
    (if (and (< 0 x) (<= x 2))
        (+ (ln x) (ln (/ x 2)))
        (ln (- (/ x 2) 1))
    )
)

(defun cycle (i)
    (if (< i 2)
       (prog1
            (print (y i))
            (cycle (+ i 0.5))
       ) 
    )
)
(cycle -1)