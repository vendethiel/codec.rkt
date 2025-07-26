#lang racket

(require "decoder-sig.rkt"
         "unmarshaller-sig.rkt"
         "readcodec-sig.rkt")

(define-unit readcodec@
  (import decoder^ unmarshaller^)
  (export readcodec^)

  (define (codec-read [x (current-input-port)])
    (unmarshall (decode x))))

(provide readcodec@)
