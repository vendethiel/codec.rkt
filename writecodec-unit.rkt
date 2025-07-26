#lang racket

(require "encoder-sig.rkt"
         "marshaller-sig.rkt"
         "writecodec-sig.rkt")

; TODO (values codec-write)?
(define-unit writecodec@
  (import encoder^ marshaller^)
  (export writecodec^)

  (define (codec-write x [out (current-output-port)])
    (encode (marshall x) out)))

(provide writecodec@)
