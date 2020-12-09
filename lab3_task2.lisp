(defun f (x) 
    (* 
        (exp (cos x)) 
        (cos (* 2 x))
    )
)
(defun integral-left (f a b n)
    (reduce '+ 
        (loop 
            for i from 0 to (- n 1) 
            for dx := (/ (- b a) n)
            collect (* (f (+ a (* i dx))) dx)
        )
    )
)
(defun integral-right (f a b n)
    (reduce '+ 
        (loop 
            for i from 1 to n 
            for dx := (/ (- b a) n)
            collect (* (f (+ a (* i dx))) dx)
        )
    )
)
(defun integral-center (f a b n)
    (reduce '+ 
        (loop 
            for i from 0 to (- n 1) 
            for dx := (/ (- b a) n)
            for a1 := (+ a (* dx i))
            for b1 := (+ a (* dx (+ i 1)))
            collect 
            (* 
                (/ 
                    (+ 
                        (f a1) 
                        (f b1) 
                    )
                    2
                ) 
                dx
            )
        )
    )
)
(defun integral-simpson (f a b n)
    (reduce '+ 
        (loop 
            for i from 0 to (- n 1) 
            for dx := (/ (- b a) n)
            for a1 := (+ a (* dx i))
            for b1 := (+ a (* dx (+ i 1)))
            collect 
            (*
                (/ (- b1 a1) 6)
                (+(+
                    (f a1)
                    (* 4 (/ (+ a1 b1) 2))
                    (f b1)
                ))
            )           
        )
    )
)

(print (format nil "Left ~D" (integral-left 'f 0 1 800)))
(print (format nil "Right ~D" (integral-right 'f 0 1 800)))
(print (format nil "Center ~D" (integral-center 'f 0 1 800)))
(print (format nil "Simpson ~D" (integral-simpson 'f 0 1 800)))