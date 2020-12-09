(defun mul (a b)
    (if (or (null a) (null b))
        0
        (+ (* (car a) (car b)) (mul (cdr a) (cdr b)))))

(defun sqr-len (a)
    (if (null a)
        0
        (+ (expt (car a) 2) (sqr-len (cdr a)))))

(defun len (a) (sqrt (sqr-len a)))

(defun cos-v (a b) (/ (mul a b) (* (len a) (len b))))

(defvar a (list 1 2 3))
(defvar b (list 5 3 3))


(print "scalar multiplication")
(print (mul a b))
(print "cos of angle")
(print (cos-v a b))