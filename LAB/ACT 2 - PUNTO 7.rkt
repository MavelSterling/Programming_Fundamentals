;; AUTOR: MAVELYN STERLING
;; PLAN: 3743 - Ingeniería de sistemas
;; NOMBRE DE LA ACTIVIDAD: ACTIVIDAD EN CLASE 2
;; EJERCICIO: 7

;Contrato: NumCal a:string m:number -> number
;Proposito: Conocer la cantidad de cal que consume el cuerpo de una persona enferma con 70 kg, durante todo el tiempo que realice la misma actividad
;Encabezado: ((NumCal  a  m )...)
;Ejmeplo: (NumCal "Dormir"  1) son 1,08
;Cuepo:
(define ( NumCal a m)
  (cond
    [(string=? a "Dormir")( * m 1.08)]
    [(string=? a "Sentado en reposo") (* m (/ 5 3))]
    [else "No está definido"]))
;Pruebas:
(NumCal "Dormir" 1)
(NumCal "Sentado en reposo" 3)
(NumCal "Saltar" 1)


