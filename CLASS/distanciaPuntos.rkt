;1. ANALISIS Y DEFINICION DE DATOS
(define-struct punto (x y))
; NUNCA HAGA ESTO: (define-struct posn (x y))
;Porque esta estructura ya está difinida por el lenguaje. Simplemente usela.
;;Un punto es una pareja X y Y que representan un punto en el plano cartesiano

;CONTRATO
;distancia: punto punto -> number
;OTRA OPCION: distancia1: posn posn -> number

;PROPOSITO
;Calcular la distancia entre dos puntos a partir de estructuras punto.

;ENCABEZADO
;(define (distancia p1 p2)...)
;(define (distancia1 p1 p2)...)

;EJEMPLOS
; (define puntoA (make-posn 0 0))
; (define puntoB (make-posn 0 5))
; (define puntoC (make-posn 3 0))
; (define puntoD (make-posn 4 3))
; 
; (distancia1 puntoA puntoB) ; ->5
; (distancia1 puntoA puntoC) ; ->3
; (distancia1 puntoA puntoD) ; ->5
; 
; (define puntoE (make-punto 0 0))
; (define puntoF (make-punto 0 5))
; (define puntoG (make-punto 3 0))
; (define puntoH (make-punto 4 3))
; 
; (distancia puntoE puntoF) ; ->5
; (distancia puntoE puntoG) ; ->3
; (distancia puntoE puntoH) ; ->5
; 

;CUERPO
(define (distancia p1 p2)
  (sqrt (+ 
         (expt (- (punto-x p2) (punto-x p1)) 2)
         (expt (- (punto-y p2) (punto-y p1)) 2)
         )
        ))

(define (distancia1 p1 p2)
  (sqrt (+ 
         (expt (- (posn-x p2) (posn-x p1)) 2)
         (expt (- (posn-y p2) (posn-y p1)) 2)
         )
        ))


;PRUEBAS
(define puntoA (make-posn 0 0))
(define puntoB (make-posn 0 5))
(define puntoC (make-posn 3 0))
(define puntoD (make-posn 4 3))

(distancia1 puntoA puntoB) ; ->5
(distancia1 puntoA puntoC) ; ->3
(distancia1 puntoA puntoD) ; ->5

(define puntoE (make-punto 0 0))
(define puntoF (make-punto 0 5))
(define puntoG (make-punto 3 0))
(define puntoH (make-punto 4 3))

(distancia puntoE puntoF) ; ->5
(distancia puntoE puntoG) ; ->3
(distancia puntoE puntoH) ; ->5




