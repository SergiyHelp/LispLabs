(defun is-all-digits-odd (x)
    (if (< x 10)
        (= (mod x 2) 1)
        (and (= (mod x 2) 1) (is-all-digits-odd (floor x 10)))
    )
)

(defun count-odd (a b)
    (if (< a b)
        (+ 
            (count-odd (+ a 1) b)
            (if (is-all-digits-odd a) (prog1 1 (print a)) 0)
        )
        0
    )
)
(defvar a (read))
(defvar b (read))
(print (count-odd a b))