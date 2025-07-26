#lang racket

(define-signature writecodec^
  ((contracted
    [codec-write (->* (any/c)
                      (output-port?)
                      void?)])))

(provide writecodec^)
