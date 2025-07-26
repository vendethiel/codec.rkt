#lang racket

(define-signature readcodec^
  ((contracted
    [codec-read (->* ()
                     ((or/c string? input-port?))
                     any)])))

(provide readcodec^)
