#lang racket/unit

(require "unmarshaller-sig.rkt")

(import)
(export unmarshaller^)

(define (unmarshall v)
  (list->vector v))
