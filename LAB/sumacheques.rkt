;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname sumacheques) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct cheque (num banco monto))

;(define uncheque (make-cheque 258 'Colpatria 200000))
;(define otrocheque (make-cheque 789 'Bogota 300000))
;(define chequediferente (make-cheque 465 'Popular 10000))

;(acumula uncheque otrocheque) -> 500000
;(acumula uncheque chequediferente) -> 210000
;(acumula chequediferente otrocheque) -> 310000

(define (acumula ch1 ch2)
  (+ (cheque-monto ch1)
     (cheque-monto ch2)))


(define uncheque (make-cheque 258 'Colpatria 200000))
(define otrocheque (make-cheque 789 'Bogota 300000))
(define chequediferente (make-cheque 465 'Popular 10000))

(acumula uncheque otrocheque); -> 500000
(acumula uncheque chequediferente); -> 210000
(acumula chequediferente otrocheque); -> 310000




