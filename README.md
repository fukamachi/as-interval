# As Interval

This library provides an 'interval' feature for [cl-async](https://github.com/orthecreedence/cl-async).

<b>NOTE: This library had merged into [cl-async](https://github.com/orthecreedence/cl-async) v0.5.4.</b>

## Usage

```common-lisp
(as:with-event-loop ()
  (let ((event (asi:interval (lambda ()
                               (princ "Hi!"))
                             :time 3)))
    (as:delay (lambda () (asi:remove-interval event))
              :time 10)))
```

## API

### \[Function] (interval fn &key time event-cb)

Sets an interval callback. This returns an `interval-event` which can be used for `remove-interval`.

See also [as:delay](http://orthecreedence.github.io/cl-async/events#delay).

### \[Function] (with-interval (seconds) &body body)

Syntax wrapper around `interval` to make it a bit less annoying to type.

```common-lisp
(with-interval (5)
  (format t "Five seconds passed! See you soon!~%"))
```

### \[Function] (remove-interval interval-event)

Cancels repeated action which was set up using `interval`.

```common-lisp
(let ((event (interval (lambda () (format t "Hi!")) :time 3)))
  (remove-interval event))
```

## Copyright

Copyright (c) 2014 Eitaro Fukamachi (e.arrows@gmail.com)

## License

Licensed under the MIT License.

## See Also

* [cl-async](https://github.com/orthecreedence/cl-async)
