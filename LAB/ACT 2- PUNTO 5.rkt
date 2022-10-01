;; AUTOR: MAVELYN STERLING
;; PLAN: 3743 - Ingeniería de sistemas
;; NOMBRE DE LA ACTIVIDAD: ACTIVIDAD EN CLASE 2
;; EJERCICIO: 5

;Contrato: DesAlmacen x:number -> number
;Proposito: Determinar la cantidad que pagará una persona por su compra, si su compra supera los $10000 se le hace descuento
;Encabezado: (define (DesAlmacen x)...)
;Ejemplo: (DesAlmacen 30000) debe dar 24000
;Cuerpo:
(define (DesAlmacen x)
  (cond
    [(> x 10000) (* x 0.8)]
    [(<= x 10000) x]))
;Prueba:
(DesAlmacen 30000)
(DesAlmacen 5000)
(DesAlmacen 40000)
