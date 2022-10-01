;; AUTOR: MAVELYN STERLING
;; PLAN: 3743 - Ingeniería de sistemas
;; NOMBRE DE LA ACTIVIDAD: ACTIVIDAD EN CLASE 2
;; EJERCICIO: 3

;Contrato: SalarioSemana y:number -> number
;Proposito: Calcular el salario semanal de un obrero de acuerdo con las horas trabajadas
;Ejemplo: (SalarioSemana 30) el resultado es 480000
;Cuerpo:
(define (SalSemana y)
  (cond
    [(<= y 40) (* y 16000)]
    [(> y 40) (+(* y 16000) (* (- y 40) 20000))])
  )
;Pruebas:
(SalSemana 30)
(SalSemana 45)
(SalSemana 50)
