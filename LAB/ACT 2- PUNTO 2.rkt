;; AUTOR: MAVELYN STERLING
;; PLAN: 3743 - Ingeniería de sistemas
;; NOMBRE DE LA ACTIVIDAD: ACTIVIDAD EN CLASE 2
;; EJERCICIO: 2

;Contrato: fAltura x: number -> number
;Proposito:Establecer una función a fin que dé la altura de la planta en función del tiempo.
;Encabezado: 
;;(define (fAltura x )...)
;Ejemplo: (fAltura 2) debe dar 3
;Cuerpo:
(define (fAltura x)
    [+(* 0.5 x) 2])
;Pruebas:
(fAltura 2)
(fAltura 1)
