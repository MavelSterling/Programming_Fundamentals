;; AUTORES:  Mavelyn Sterling, Sebastian Potes Blandon
;; PLAN: 3743, 2711
;; NOMBRE DE LA ACTIVIDAD: Actividad parte 2
;; EJERCICIO: 4

(define-struct vehiculo (combustible cantRuedas cantPuertas cantPasajeros))
;;vehiculo es una estrucutra que representa las caracteristicas de un vehiculo X. 
;;combustible: string; cantRuedas, cantPuertas cantPasajeros -> number.

;Contrato: 
;tipoVehiculo: vehiculo vehiculo-cantRuedas -> string.

(define carro (make-vehiculo "gas" 4 4 5))
(define moto (make-vehiculo "corriente" 2 0 2))
(define tractocamion (make-vehiculo "corriente" 22 2 2))
(define moto1 (make-vehiculo "energia solar" 2 0 2))

;Encabezado
(define (tipoVehiculo numLlantas)
(cond 
[(= (vehiculo-cantRuedas numLlantas) 2) "es una moto"]
[(= (vehiculo-cantRuedas numLlantas) 4) "es un carro"]
[(= (vehiculo-cantRuedas numLlantas) 22) "es un tractocamion"]
[else "No es un vehiculo"]
)
  )

;prueba
(tipoVehiculo carro)

(define (ecologico? combustible)
(cond 
[(string=? (vehiculo-combustible combustible) "energia solar") "es ecologico"]
[(string=? (vehiculo-combustible combustible) "electrico") "es ecologico"]
[else "No es ecologico"]
)
  )

;prueba
(ecologico? moto1)
(ecologico? carro)


;;;EJERCICIO 2

(define-struct trabajador (nombre sexo cargo diasTrabajado-mes))

(define trabajador1 (make-trabajador "Mavelyn" "mujer" "Servir tintos" 24))
(define trabajador2 (make-trabajador "Sebastian" "hombre" "Presidente" 8))
(define trabajador3 (make-trabajador "Patricio" "hombre" "limpiar cagaderos" 30))


(define (salario trabajador)
    (* (* (trabajador-diasTrabajado-mes trabajador) 9000) 8)
  )

;Prueba
(salario trabajador3)


;EJERCICIO 3

(define-struct cursoEstudiante (nota1 nota2 nota3))
(define ana (make-cursoEstudiante 3.5 2 2.8))
(define carlos  (make-cursoEstudiante 5 5 5))

(define (promedio estudiante)
     (/(+ (cursoEstudiante-nota1 estudiante) (cursoEstudiante-nota2 estudiante)
       (cursoEstudiante-nota3 estudiante)) 3)
  )

;Prueba

(promedio carlos)
(promedio ana)

(define (aprobo? estudiante)
  (cond
    [(>=  (promedio estudiante) 3) "Aprobo"]
    [(>  (promedio estudiante) 5) "Dato no valido"]
    [else "No aprobo"]
    )
  )

;Prueba
(aprobo? carlos)



;;EJERCICIO 4

(define-struct factura (producto mesero propina impuesto hora))

(define factura1 (make-factura "entrada" "mavelyn" 5000 4000 "noche"))
(define factura2 (make-factura"postre" "mavelyn" 8000 1200 "noche"))
(define factura3 (make-factura "licor" "carlos" 20000 6500 "tarde"))
(define factura4 (make-factura "postre" "sebas" 8000 1200 "mañana"))
(define factura5 (make-factura "licor" "mavelyn" 2000 7000 "noche"))

(define (registroVen f1 f2 f3 f4 f5)
  (cond
    [(string=? (factura-mesero f1) "mavelyn")(+ factura1-propina factura2-propina
                                                    factura5-propina)]
    )
  )
;prueba
(registroVen "factura1")
