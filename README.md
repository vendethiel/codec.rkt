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

The decodes provides a `decode` function that takes a value and reads it from a specific format.

Example usage of simple JSON decoding:

```
(require "decoder-json.rkt")

(define-values/invoke-unit/infer decoder-json@)
(decode "[1,2,3]")
```

### Marshaller

The marshaller provides a `marshall` function that takes a value and converts it to a simple Racket value (usually, `jsexpr?`-compatible).

Example usage (`vector`s aren't `jsexpr?`):

```racket
(require "marshaller-vector.rkt")

(define-values/invoke-unit/infer marshaller-vector@)
(print (marshall (vector 1 2 3)))
```

### Unmarshaller

The unmarshaller provides a `unmarshall` function that takes a simple (usually, `jsexpr?`-compatible) Racket value and converts it to its original form.

Example usage (`list`s are `jsexpr?`):

```racket
(require "unmarshaller-vector.rkt")

(define-values/invoke-unit/infer unmarshaller-vector@)
(print unmarshall (list 1 2 3))
```

### ReadCodec

When you have an encoder and a marshaller, you can use a `readcodec`.
You just need to `link` an `unmarshaller` and a `decoder`.

Example usage:

```racket

(define-values/invoke-unit/infer
  (export readcodec^)
  (link decoder-json@ unmarshaller-vector@ readcodec@))
(print (codec-read "[1,2,3]"))
```

### WriteCodec

When you have an encoder and a marshaller, you can use a `writecodec`.
You just need to `link` an `encoder` and a `marshaller`.

Example usage:

```racket
(require "incodec-sig.rkt")
(require "encoder-json.rkt")
(require "marshaller-vector.rkt")
(require "writecodec-unit.rkt")

(define-values/invoke-unit/infer
  (export writecodec^)
  (link encoder-json@ marshaller-vector@ writecodec@))
(codec-write (vector 1 2 3))
```

### Codec

A codec is simply a combination of a `ReadCodec` and a `WriteCodec`.
It is not something that exists as a unit, but rather a way to get both in your code.

You only need to specify both in `export` and augment your `link` clause in the unit invocation:

```racket
(define-values/invoke-unit/infer
  (export readcodec^ writecodec^)
  (link decoder-json@ unmarshaller-vector@ readcodec@
        encoder-json@ marshaller-vector@ writecodec@))
```

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

**Note**: If you do *not* specify an `export` clause, all units are invoked in the current scoped, and thus the `encode`/`decode`/`marshall`/`unmarshall` names are leaked into your current scopes as well.
