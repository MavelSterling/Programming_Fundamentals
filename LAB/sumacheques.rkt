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




