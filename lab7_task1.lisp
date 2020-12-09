(defun delimiterp (c) (or (char= c #\Space) (char= c #\,)))
(defun split-sequence (string &key (delimiterp #'delimiterp))
  (loop :for beg = (position-if-not delimiterp string)
    :then (position-if-not delimiterp string :start (1+ end))
    :for end = (and beg (position-if delimiterp string :start beg))
    :when beg :collect (subseq string beg end)
    :while end))

(defvar a "this is the first line of text")
(defvar b "and yet another one is here in text")

(with-open-file (str "data.txt" :direction :output :if-exists :supersede) (format str "~D~%" a))
(with-open-file (str "data.txt" :direction :output :if-exists :append) (format str "~D" b))

(with-open-file (str "data.txt" ) (setf a1 (split-sequence (read-line str)))(setf b1 (split-sequence (read-line str))))

(loop for i in a1 do (format T "~D " i)) (format T "~%")
(loop for i in b1 do (format T "~D " i)) (format T "~%")

(loop for i from 0 to (- (length a1) 1) by 2 do 
    (setf (nth i a1) (nth (+ i 1) b1)))

(format T "~%Formated text:~%")
(loop for i in a1 do (format T "~D " i)) (format T "~%")
(loop for i in b1 do (format T "~D " i)) (format T "~%")
(format T "~%")

(with-open-file (str1 "data2.txt" :direction :output :if-exists :supersede) (format str1 "~D~%" a1))
(with-open-file (str1 "data2.txt" :direction :output :if-exists :append) (format str1 "~D" b1))