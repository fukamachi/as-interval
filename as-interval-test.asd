(in-package :cl-user)
(defpackage as-interval-test-asd
  (:use :cl :asdf))
(in-package :as-interval-test-asd)

(defsystem as-interval-test
  :depends-on (:as-interval
               :cl-test-more)
  :components ((:file "t/as-interval"))

  :defsystem-depends-on (:cl-test-more)
  :perform (test-op :after (op c)
                    (funcall (intern #. (string :run-test-system) :cl-test-more)
                             c)
                    (asdf:clear-system c)))
