
(defun mean (a b)
    (/ (+ a b) 2)
)

(defun if-chain (l)
    (if (eval (car l))
        (car (cdr l))
        (if (null (cdr (cdr (cdr l))))
            (car (cdr (cdr l)))
            (if-chain (cdr (cdr l)))
        )
    )
)

(defun is-close (a b) 
    (< (abs (- b a)) 0.0001)
)

(defun different-sign (a b) 
    (or
        (and (>= a 0) (< b 0))
        (and (< a 0) (>= b 0))
    )
)

(defun bisect (f a b)
    (if (< b a) 
            "Range Error: b must be greather than a"
        (if (not (different-sign (f a) (f b)))
            "Cannot find value"
            (if (or (= (f (mean a b)) 0) (is-close a b))
                (mean a b)
                (if (different-sign (f a) (f (mean a b)))    
                    (bisect f a (mean a b))
                    (bisect f (mean a b) b)
                )
            )
        )
    )
)
(defun brutte (f a b)
    (if (> a b)
        "Cannot find answer"
        (if (< (abs (f a)) 0.005)
            a
            (brutte 'f (+ a 0.001) b)
        )
    )
)

(defun f (x)
    (-(- 2 x) (log x))
)

(print (brutte 'f 1 10) )
(print (bisect 'f 1 10) )

(defun mapindex (l f &optional(i 1))
    (if (null l)
        l
        (cons (f (car l) i) (mapindex (cdr l) 'f (+ i 1)))
    )
)

