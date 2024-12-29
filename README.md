# Coder

A small library to provide NxM {en,de}coder <=> {,un}marshaller combinations.

A pair of Encoder and Marshaller makes an InCodec.
A pair of Decoder and Unmarshaller makes an OutCodec.
A pair of InCodec and OutCodec makes a Codec.

## Signatures and Units

### Encoder

The encoder provides an `encode` function that takes a value and an optional output port, and writes the value to it.

Example usage of simple JSON encoding (it requires the value to be encoded to be a `jsexpr?`):

```racket
(require "encoder-json.rkt")

(define-values/invoke-unit/infer encoder-json@)
(encode (list 1 2 3))
```

### Decoder

### Marshaller

The marshaller provides a `marshall` function that takes a value and converts it to a simple Racket value (usually, `jsexpr?`-compatible).

Example usage (`vector`s aren't `jsexpr?`):

```racket
(require "marshaller-vector.rkt")

(define-values/invoke-unit/infer marshaller-vector@)
(print (marshall (vector 1 2 3)))
```

### Unmarshaller

### InCodec

When you have an encoder and a marshaller, you can use an `incodec`.
You just need to `link` an `encoder` and a `marshaller`.

Example usage:

```racket
(require "incodec-sig.rkt")
(require "encoder-json.rkt")
(require "marshaller-vector.rkt")
(require "incodec-unit.rkt")

(define-values/invoke-unit/infer
  (export incodec^)
  (link encoder-json@ marshaller-vector@ incodec@))
(in-code (vector 1 2 3))
```

### OutCodec

### Codec

## Name conflicts

The `export` clause can be used to `prefix` or `rename`:

```racket
; using `prefix`:
(define-values/invoke-unit/infer
  (export (prefix snd- incodec^))
  (link encoder-json@ marshaller-vector@ incodec@))
(snd-in-code (vector 1 2 3))
; using `rename`:
(define-values/invoke-unit/infer
  (export (rename incodec^ (in-code-again in-code)))
  (link encoder-json@ marshaller-vector@ incodec@))
(in-code-again (vector 1 2 3))
```
