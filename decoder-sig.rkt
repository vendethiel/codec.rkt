#lang racket

(define-signature decoder^
  ((contracted
    [decode (->* ()
                 ((or/c string? input-port?))
                 any)])))

(provide decoder^)
