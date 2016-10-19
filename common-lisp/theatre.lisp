;;;; -*- mode: lisp -*-

(defpackage #:theatre
  (:use
   #:cl
   #:cl-bazon
   #:bordeaux-threads
   #:iter
   #:metabang-bind)
  (:export))

(in-package #:theatre)

(defun random1 (max)
  (1+ (random max)))

(defun make-seats (capacity)
  (iter (with seats = (make-hash-table))
        (for i from 1 to capacity)
        (setf (gethash i seats) i)
        (finally (return seats))))

(defun random-seat (seats)
  (iter (with random-seat-number = (random1 (hash-table-count seats)))
        (for (seat v) in-hashtable seats)
        (for i from 1)
        (when (= i random-seat-number)
          (return seat))))

(defun theatre-simulation (capacity)
  (bind ((seats (make-seats capacity))
         (first-visitor-seat (random-seat seats)))
    (remhash first-visitor-seat seats)
    (iter (for visitor from 2 below capacity)
          (for candidate-seat = (gethash visitor seats))
          (if (and candidate-seat (= visitor candidate-seat))
              (remhash visitor seats)
              (remhash (random-seat seats) seats)))
    (iter (for (k v) in-hashtable seats)
          (return (= k capacity)))))

(defun theatre-count (capacity iterations)
  (/ (iter (for simulation-number from 1 to iterations)
           (when (theatre-simulation capacity)
             (counting t)))
     iterations))
