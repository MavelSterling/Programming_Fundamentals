;; AUTOR: MAVELYN STERLING
;; PLAN: 3743 - Ingeniería de sistemas
;; NOMBRE DE LA ACTIVIDAD: ACTIVIDAD EN CLASE 2
;; EJERCICIO: 1. b.

;Contrato: fTrozos x: number -> number
;Proposito: Realizar un programa para obtener los valores al evaluar la siguiente función a trozo.
;Encabezado: 
;;(define (fTrozos x)...)
;Ejemplo: (fTrozos -2) debe dar 8
;Cuerpo:
(define (fTrozos x)
  (cond
    [(> x 0) (+(* x 2) 4)]
    [(< x 0) (- 4 (* 2 x))]
    [else "No valido"]))
;Pruebas:
(fTrozos 1)
(fTrozos -2)
