(defun range (s)
    (loop for n from 1 to s collect n)
)

(defun map-list (f list)
    (if (null list)
        ()
        (append (list (funcall f (car list))) (map-list f (cdr list)))
    )
)

(defun map-list-i (f list &optional(i 1) )
    (if (null list)
        ()
        (append (list (funcall f (car list) i)) (map-list-i f (cdr list) (+ i 1)))
    )
)

(defun pentanumbers (count)
    (map-list 
        (lambda (x) 
            (* (* 0.5 x) (- (* 3 x) 1)) 
        )
        (range count)
    )
)

(defun task-a (list)
    (map-list-i 
        (lambda (x i) 
            (if (= (mod i 2) 0) (* x 2) x)
        )
        list
    ) 
)

(defun task-b (list)
    (/
        (apply '+ list)
        (list-length list)
    ) 
)

(defun task-c (list)
    (let
        (
            (a (loop for n from 0 to (- (/ (list-length list) 2) 1) collect (nth n list)))
            (b (loop for n from (/ (list-length list) 2) to (- (list-length list) 1) collect (nth n list)))
        )
        (list a (append (last a) (cdr b)))
    )
)

(defvar count 10)

(format T "pentanumbers: ( ~{~0$  ~})~%" (pentanumbers count))
(format T "task A: ( ~{~0$  ~})~%" (task-a (pentanumbers count)))
(format T "task B: ~0$~%" (task-b (pentanumbers count)))
(format T "task C: ( ~{~1$  ~})~%" (task-c (pentanumbers count)))