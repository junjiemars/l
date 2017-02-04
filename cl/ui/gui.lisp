

(defparameter *size* 400)

(defun gui ()
  (ltk:with-ltk ()
    (let* ((vals (list 2 3 4))
           (canvas (ltk:make-canvas nil :width *size* :height *size*))
           (spinbox
            (make-instance 'ltk:spinbox
                            :width 3
                            :command
                            (lambda (val)
                              (sierpinski canvas
                                          (parse-integer val)))
                            :master nil
                            :values vals
                            :text (first vals))))
      (ltk:wm-title ltk:*tk* "Sierpinski")
      (ltk:configure canvas :background :white)
      (ltk:pack canvas)
      (ltk:pack spinbox)
      (sierpinski canvas (first vals)))))


(defun sierpinski (canvas level)
   (ltk:clear canvas)
   (labels ((square (x y size)
              (let ((rectangle
                     (ltk:create-rectangle canvas x y
                                           (+ x size) (+ y size))))
                (ltk:itemconfigure canvas rectangle :fill :red)
                (ltk:itemconfigure canvas rectangle :outline :red)))
            (recurse (x y size level)
              (let ((step (* 1/3 size)))
                (square (+ x step) (+ y step) step)
                (when (plusp level)
                  (dolist (next-x (list x (+ x step) (+ x step step)))
                    (dolist
                        (next-y (list y (+ y step) (+ y step step)))
                      (recurse next-x next-y step (1- level))))))))
     (recurse 0 0 *size* level)))





