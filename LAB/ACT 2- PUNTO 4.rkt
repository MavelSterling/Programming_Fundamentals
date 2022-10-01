;; AUTOR: MAVELYN STERLING
;; PLAN: 3743 - Ingeniería de sistemas
;; NOMBRE DE LA ACTIVIDAD: ACTIVIDAD EN CLASE 2
;; EJERCICIO: 4

;Contrato: NombreDia z: number -> string
;Proposito: Escribir un programa que dado un número del 1 a 7 escriba el correspondiente nombre del día de la semana
;Encabezado: 
;;(define (NombreDia z)...)
;Ejemplo: (NombreDia 1 ) debe dar lunes
;Cuerpo:
(define (NombreDia z)
  (cond
    [(= z 1) "Lunes"]
    [(= z 2) "Martes"]
    [(= z 3) "Miércoles"]
    [(= z 4) "Jueves"]
    [(= z 5) "Viernes"]
    [(= z 6) "Sábado"]
    [(= z 7) "Domingo"]
    [else "NO ESTÁ EN EL RANGO"]))
;Pruebas:
(NombreDia 5)
(NombreDia 10)
