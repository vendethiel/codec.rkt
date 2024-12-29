#lang racket

(require "encoder-sig.rkt"
         "marshaller-sig.rkt"
         "incodec-sig.rkt")

; TODO (values in-code)?
(define-unit incodec@
  (import encoder^ marshaller^)
  (export incodec^)

  (define (in-code x [out (current-output-port)])
    (encode (marshall x) out)))

(provide incodec@)
