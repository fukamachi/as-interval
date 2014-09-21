(in-package :cl-user)
(defpackage as-interval
  (:nicknames :asi)
  (:use :cl)
  (:import-from :cl-async
                :delay
                :remove-event)
  (:export :interval
           :with-interval
           :remove-interval
           :interval-event))
(in-package :as-interval)

(defstruct (interval-event (:conc-name #.(string :interval-)))
  async-event)

(defun interval (fn &key time event-cb)
  (let (event)
    (labels ((main ()
               (funcall fn)
               (when (interval-async-event event)
                 (setf (interval-async-event event)
                       (as:delay #'main :time time :event-cb event-cb)))))
      (setq event
            (make-interval-event
             :async-event (as:delay #'main :time time :event-cb event-cb)))
      event)))

(defmacro with-interval ((seconds) &body body)
  `(interval (lambda () ,@body) :time ,seconds))

(defun remove-interval (event)
  (when (interval-async-event event)
    (as:remove-event (interval-async-event event))
    (setf (interval-async-event event) nil)))
