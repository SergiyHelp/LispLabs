(defun max- (l)
    (if (or (<= 0 (car (cdr l))) (null (cdr l)))
        (car l)
        (max- (cdr l))))


(defun min+ (l)
    (if (or (>= 0 (car (cdr l))) (null (cdr l)))
        (car l)
        (min+ (cdr l))))

(defvar nums (list -4 1 -3 0 2 5 -6 1 2 0 -1 4))

(defvar m- (max- (sort (copy-list nums) #'<)))

(defvar m+ (min+ (sort (copy-list nums) #'>)))


(print nums)
(format T "~%max negative value ~D" m+)
(format T "~%index ~D" (position m+ nums))
(format T "~%min positive value ~D" m-)
(format T "~%index ~D" (position m- nums))