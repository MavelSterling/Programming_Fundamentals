;; AUTOR: MAVELYN STERLING
;; PLAN: 3743 - Ingeniería de sistemas
;; NOMBRE DE LA ACTIVIDAD: ACTIVIDAD EN CLASE 2
;; EJERCICIO: 1. a.

;Contrato: fTrozos x: number -> number
;Proposito: Realizar un programa para obtener los valores al evaluar la siguiente función a trozo.
;Encabezado: 
;;(define (fTrozos x)...)
;Ejemplo: (fTrozos -2) debe dar 1
;Cuerpo:
(define (fTrozos x)
  (cond
  [(<= x 1) 1]
  [(and (< 1 x) (<= x 3)) x]
  [(and (< 3 x) (<= x 6)) (+(- x) 6)]
  [(< 6 x) 0]))
;Pruebas:
(fTrozos 1)
(fTrozos 2)
(fTrozos -4)
(fTrozos 0)
  
