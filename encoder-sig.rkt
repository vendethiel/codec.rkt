#lang racket

(define-signature encoder^
  ((contracted
    [encode (->* (any/c)
                 (output-port?)
                 void?)])))

(provide encoder^)
