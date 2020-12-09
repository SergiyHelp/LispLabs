(defun task (name priority) (list :name name :priority priority))

(defvar l (list (task "task1" 4)(task "task2" 2)(task "task3" 1)(task "task3" 3) ))

(print l)

(sort l #'(lambda (a b) (< (getf a :priority) (getf b :priority))))

(print l)
