;; AUTOR: MAVELYN STERLING
;; PLAN: 3743 - Ingeniería de sistemas
;; NOMBRE DE LA ACTIVIDAD: ACTIVIDAD EN CLASE 2
;; EJERCICIO: 6

;Contrato: OrdCreciente x:number y:number z:number  -> string
;Proposito: Escribir un programa que al introducir tres números detecte si están en orden creciente.
;Encabezado: (define (OrdCreciente x y z)...)
;Ejemplo: (OrdCreciente 3 5 7) es Creciente
;Cuerpo:
(define (OrdCreciente x y z)
  (cond
    [(and (< x y) (< y z)) "Creciente"]
    [else "Son descendiente"]))
;Prueba:
(OrdCreciente 1 3 5)
(OrdCreciente 5 3 2)
