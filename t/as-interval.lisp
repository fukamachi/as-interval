(in-package :cl-user)
(defpackage as-interval-test
  (:use :cl
        :as-interval
        :cl-test-more))
(in-package :as-interval-test)

(plan 1)

(diag "Running a test... this takes 10 seconds...")
(is-print (as:with-event-loop ()
            (let ((event (interval
                          (lambda ()
                            (princ "Hi!"))
                          :time 3)))
              (as:delay (lambda () (remove-interval event))
                        :time 10)))
          "Hi!Hi!Hi!")

(finalize)
