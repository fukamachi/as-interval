#|
  This file is a part of as-interval project.
  Copyright (c) 2014 Eitaro Fukamachi (e.arrows@gmail.com)
|#

#|
  Author: Eitaro Fukamachi (e.arrows@gmail.com)
|#

(in-package :cl-user)
(defpackage as-interval-asd
  (:use :cl :asdf))
(in-package :as-interval-asd)

(defsystem as-interval
  :version "0.0.1"
  :author "Eitaro Fukamachi"
  :license "BSD 2-Clause"
  :depends-on (:cl-async)
  :components ((:file "src/as-interval"))
  :in-order-to ((test-op (test-op as-interval-test))))
