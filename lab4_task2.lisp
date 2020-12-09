;; PLANE

(defun plane (type-name weight)
    (list 
        :type type-name
        :max-load weight
        :loaded-containers 0
        :time-stay 0
        :in-port T))
(defun to-string (p) 
    (format T "Type ~s~%Loaded ~s~% ~s~%~%" 
        (type-name p)
        (loaded-containers p)
        (if (in-port p) 
            (format nil "In port for ~s" (time-stay p))
            (format nil "In sky  for ~s" (time-stay p))
    ))
)

(defun light-plane () (plane "Light Plane" 80))
(defun heavy-plane () (plane "Heavy Plane" 140))

(defun type-name (p) (getf p :type))
(defun set-type-name (p v) (setf (getf p :type) v))

(defun max-load (p) (getf p :max-load))
(defun set-max-load (p v) (setf (getf p :max-load) v))

(defun loaded-containers (p) (getf p :loaded-containers))
(defun set-loaded-containers (p v) (setf (getf p :loaded-containers) v))

(defun time-stay (p) (getf p :time-stay))
(defun set-time-stay (p v) (setf (getf p :time-stay) v))

(defun in-port (p) (getf p :in-port))
(defun set-in-port (p v) (setf (getf p :in-port) v))

(defun ready-to-rice (p) (and (is-full p) (in-port p)))
(defun ready-to-ground (p) (and (= (time-stay p) *fly-time*) (not (in-port p))))
(defun free-space (p) (- (max-load p) (loaded-containers p)))
(defun is-full (p) (= 0 (free-space p)))

(defun rise (p) 
    (push (time-stay p) *port-log* )
    (set-in-port p nil)
    (set-time-stay p 0))

(defun ground (p)
    (push (time-stay p) *sky-log* )
    (set-in-port p T)
    (set-time-stay p 0))

(defun be (p) (set-time-stay p (+ 1 (time-stay p))))
;; CONTAINERS

(defun add-containers (count)
    (set '*containers* (+ *containers* count)))

(defun remove-containers (count)
    (set '*containers* (- *containers* count)))

;; PROGRAM

(defun load-containers (p)
    (let ((c (min *containers* (free-space p))))
        (remove-containers c)
        (set-loaded-containers p (+ (loaded-containers p) c))))

(defun play-minute () 
    (add-containers 2)
    (mapcar #'load-containers (remove-if-not #'in-port *planes*))
    (mapcar #'rise (remove-if-not #'ready-to-rice *planes*))
    (mapcar #'be *planes*)
    (mapcar #'ground (remove-if-not #'ready-to-ground *planes*))
    )

(defvar *planes* (list (light-plane) (light-plane) (light-plane) (heavy-plane) (heavy-plane)))
(defvar *containers* 0 )
(defvar *port-log* ())
(defvar *sky-log* ())
(defvar *fly-time* 60)

(loop for i from 1 to 1000 do (play-minute))

(format T "Containers ~s~%~%" *containers*)
(mapcar #'to-string *planes*)
(print *port-log*)