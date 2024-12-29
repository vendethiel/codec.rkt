#lang racket

(require json)
(require "encoder-sig.rkt")

; TODO check if it's a `jsexpr?`?
(define-unit/contract encoder-json@
  (import)
  (export (encoder^
            [encode (->* (any/c)
                         (output-port?)
                         void?)]))

  (define (encode x [out (current-output-port)])
    (write-json x)))

(provide encoder-json@)
