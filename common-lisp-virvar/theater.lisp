;;;; theater.lisp

(in-package #:theater)

(defparameter seats-count 1000)

(defun generate-left (count)
  (let ((left '()))
    (dotimes (i count)
      (setf left (cons i left)))
    left))

(defun seat ()
  (let ((seats (make-array seats-count :initial-element nil))
        (left (generate-left seats-count)))
    (dotimes (i (length seats))
      (let ((position (if (or (elt seats i) (= 0 i))
                          (nth (random (length left)) left)
                          i)))
        (setf (elt seats position) i)
        (setf left (remove position left :count 1))))
    seats))

(defun test (attempts)
  (let ((matches 0))
    (dotimes (i attempts)
      (let ((seats (seat)))
        (if (= (elt seats (1- (length seats)))
               (1- (length seats)))
            (setf matches (1+ matches)))))
    (/ matches attempts)))

(print (test 100))
