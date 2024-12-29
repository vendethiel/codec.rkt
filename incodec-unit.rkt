#lang racket

(require "encoder-sig.rkt")
(require "marshaller-sig.rkt")
(require "incodec-sig.rkt")

(define-unit incodec@
  (import encoder^ marshaller^)
  (export incodec^)

  (define (in-code x [out (current-output-port)])
    (encode (marshall x) out)))

(provide incodec@)
