#lang racket/unit

(require "marshaller-sig.rkt")

(import)
(export marshaller^)

(define (marshall v)
  (vector->list v))
