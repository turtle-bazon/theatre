;;;; -*- mode: lisp -*-

(defsystem :theatre
    :name "theatre"
    :author "Azamat S. Kalimoulline <turtle@bazon.ru>"
    :licence "GPLV3"
    :version "0.0.1.0"
    :description "Theatre Simulation"
    :depends-on (cl-bazon
                 bordeaux-threads
                 iterate
                 metabang-bind)
    :components ((:file "theatre")))
