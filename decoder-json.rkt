#lang racket

(require json)
(require "decoder-sig.rkt")

(define-unit/contract decoder-json@
  (import)
  (export (decoder^
           [decode (->* ()
                        ((or/c string? input-port?))
                        any)]))

  (define (decode [x (current-input-port)])
    (if (string? x)
      (string->jsexpr x)
      (read-json x))))

(provide decoder-json@)
