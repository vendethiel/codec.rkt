#lang racket

(define-signature incodec^
  ((contracted
    [in-code (->* (any/c)
                  (output-port?)
                  void?)])))

(provide incodec^)
