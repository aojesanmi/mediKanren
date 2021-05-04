#lang racket/base
(provide KGX-syn)

(require json "../base.rkt" (except-in racket/match ==))


(define edge-keys '(subject object predicate id source_database))

;(define in-edge (open-input-file "../data/KGX_NN_data_2021-03-11_edges.jsonl"))


(define-relation/table KGX-syn
  'path "KGX-syn"
  'attribute-names edge-keys
  'attribute-types '(string string string string string)
  'indexes '((object subject))
  #|'source-stream (value/syntax
                  (let loop ()
                    (lambda ()
                      (define line (read-line (open-input-file "../data/KGX_NN_data_2021-03-11_edges.jsonl")))
                      (cond ((eof-object? line) '())
                            (else
                             (define row-edge (string->jsexpr line))
                             (cons (map (lambda (k) (hash-ref row-edge k)) edge-keys)
                                   (loop)))))))|#
  )