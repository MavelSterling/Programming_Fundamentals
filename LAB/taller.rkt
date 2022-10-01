;; AUTORES:  Mavelyn Sterling, Sebastian Potes Blandon
;; PLAN: 3743, 2711
;; NOMBRE DE LA ACTIVIDAD: Actividad parte 2
;; EJERCICIO: 2



;Funcion Auxiliar montoBase
;Contrato: montoBase  precioventa:num; cuotainic:numb -> numb
;Proposito: Calcular el montoBase a partir del precio de la casa y la cuota inicial a dar por el comprador
;Ejemplo: (montoBase 5000 1000) arrojaria 4000
;Cuerpo:

(define (montoBase precioventa cuotaini)
  (cond
    ((> precioventa cuotaini) (- precioventa cuotaini))
    (else "Monto erroneo")
    )
  )
;prueba
(montoBase 5000 1000)

;Funcion Auxiliar intereses
;Contrato: intereses  precioventa:num; cuotainic:numb -> numb
;Proposito: Calcular el interes a partir del monto, el intereses seran al 4% por mes por 30 años. Para esto se llamara la funcion auxiliar
;montoBase para saber el monto a financiar
;Ejemplo: (intereses 5000 1000) arrojaria 57600
;Cuerpo:

(define (intereses precioventa cuotaini)
  (* (montoBase precioventa cuotaini) (* 0.04 360))
  )
;prueba
(intereses 5000 1000)

;Funcion Principal costoTotal
;Contrato: intereses  precioventa:num; cuotainic:numb -> numb
;Proposito: Calcular el costo total a partir de los intereses, monto y cargos adicionales. El monto sera conocido por la funcion auxiliar
;montoBase, los intereses por la funcion auxiliar de intereses y los cargos adicionales totales son de $1000
;Ejemplo: (montoTotal 5000 1000) arrojaria 62600
;Cuerpo:
(define (costoTotal precioventa cuotaini)
  (+ (montoBase precioventa cuotaini) (intereses precioventa cuotaini) 1000)
  )

;prueba
(costoTotal 5000 1000)
(costoTotal 120000000 20000000)


;; AUTORES:  Mavelyn Sterling, Sebastian Potes Blandon
;; PLAN: 3743, 2711
;; NOMBRE DE LA ACTIVIDAD: Actividad parte 2
;; EJERCICIO: 3

;Contrato: calcula_IMC a:numb p:numb -> string
;Proposito: Escribir un programa que permita conocer el estado nutricional del
;usuario (su nivel de sobrepeso, infrapeso o normalidad) determinado a partir
;del cálculo de su IMC
;Encabezado: (define (calcula_IMC p a) ...)
;Ejemplo: (calcula_IMC 90 1.80) el resultado es peso normal

;Cuerpo: 

(define (calcula_IMC  p a)
  (cond 
    [(< (/ p (* a a)) 16.00) "Infrapeso"]
    [(< (/ p (* a a)) 18.49) "Infrapeso"]
    [(>= (/ p (* a a)) 18.50) "Peso normal"]
    [(< (/ p (* a a)) 24.99) "Peso normal"]
    [(>= (/ p (* a a)) 25.00) "Sobrepeso"]
    [(< (/ p (* a a)) 29.99) "Sobrepeso"]
    [(>= (/ p (* a a)) 30.00) "Obeso"]))
    

;Prueba:
(calcula_IMC 120 1.40)
(calcula_IMC 85 1.78)
(calcula_IMC 90 1.80)


;; AUTORES:  Mavelyn Sterling, Sebastian Potes Blandon
;; PLAN: 3743, 2711
;; NOMBRE DE LA ACTIVIDAD: Actividad parte 2
;; EJERCICIO: 4


;Contrato:  pul:numb pie:numb yar:numb ro:numb mi:numb -> numb
;Proposito: Escribir un programa en el cual desarrolle las funciones para conversiones de medidas
;Encabezado:(define (pul_cm pul)...)
;Ejemplo: (pul_cm 2) debe dar 5.08
;Cuerpo:
   (define (pul_cm pul) (* pul 2.54))
   (define (pie_pul pie) (* pie 12))
   (define (yar_pie yar) (* yar 3))
   (define (ro_yar ro) (* ro 5.5))
   (define (mi_ro mi) (* mi 320))

   (define (pie_cm pie) (pul_cm (pie_pul pie)))
   (define (yar_cm yar) (pul_cm (pie_pul (yar_pie yar))))
   (define (ro_pul ro) (pie_pul (yar_pie (ro_yar ro))))
   (define (mi_pie mi) (yar_pie (ro_yar (mi_ro mi))))
;Pruebas:
(pul_cm 2)
(pie_pul 3)
(yar_pie 4)
(ro_yar 3)
(mi_ro 2)
(pie_cm 2)
(yar_cm 1)
(ro_pul 1)
(mi_pie 1)


;; AUTORES:  Mavelyn Sterling, Sebastian Potes Blandon
;; PLAN: 3743, 2711
;; NOMBRE DE LA ACTIVIDAD: Actividad parte 2
;; EJERCICIO: 5

;Contrato:  precioBase peso: numb -> numb
;Proposito: Funcion que calcule el precioBase de la torta, dado un peso que se medira desde 0.5 a 6 libras.
;Encabezado:(define (precioBase peso) ...)
;Ejemplo: peso = 0.5 arroja 20000
;Cuerpo:

(define (precioBase peso)
  (cond
    ((= peso 0.5) 20000)
    ((and (>= peso 1) (<= peso 6)) (+ (* (- peso 0.5) 20000) 20000))
    (else "Dato no valido")
    )
  )
;Prueba
(precioBase 8)
(precioBase 0.5)

;Contrato:  precioTorta peso: numb; clase:string -> numb
;Proposito: Funcion que calcule el precioTorta a traves de la funcion auxiliar precioBase y dependiendo de la clasificaciones de la torta
;tenga un calculo diferente
;Encabezado:(define (precioTorta peso clase) ...)
;Ejemplo: peso = 0.5 clase = Genovesa arroja  21200
;Cuerpo:

(define (precioTorta peso clase)
  (cond
    ((and (string=? clase "Chocolate") (boolean=? true (integer? (/ peso 0.5))))  (+ (precioBase peso) (* 5000 peso)))
    ((and (string=? clase "Naranja") (boolean=? true (integer? (/ peso 0.5)))) (+ (precioBase peso) (* 1000 peso)))
    ((and (string=? clase "Genovesa") (boolean=? true (integer? (/ peso 0.5)))) (+ (precioBase peso) (* 2400 peso)))
    (else "Dato no valido")
    )
  )
;Prueba
(precioTorta 0.5 "Genovesa")

;Contrato:  precioBombon cantidad: numb; clase:string -> numb
;Proposito: Funcion que calcule el precioBombom a traves de la cantidad y dependiendo de la clasificaciones del bombon
;tenga un calculo diferente
;Encabezado:(define (precioBombon cantidad clase) ...)
;Ejemplo: peso = 2 clase = Frances arroja  3000
;Cuerpo:

(define (precioBombon cantidad clase)
  (cond 
    ((and (integer? cantidad) (string=? clase "Frances"))(* cantidad 1500))
    ((and (integer? cantidad) (string=? clase "Avellanas"))(* cantidad 6700))
    (else "Dato no valido")
    )
  )
;prueba
(precioBombon 2 "Frances")


;Contrato:  bono? bono: string; -> boolean
;Proposito: Funcion que su resultado sea booleano, si el cliente tiene o no bono.
;Encabezado:(define (bono? bono)) ...)
;Ejemplo: bono = "si" arroja true
;Cuerpo:


(define (bono? bono)
   (string=? bono "si")
    )

;Prueba
(bono? "no")
(bono? "si")

;FUNCION PRINCIPAL
;Contrato:  (precioFinal?  bono:"string" cantidad:numb clase:strin -> numb
;Proposito: La función principal venta recibirá como parámetros un identificador del producto a vender,
;la cantidad a vender y un booleano que indica si se tiene un bono de descuento. Determinara el precio final teniendo estos factores.
;Encabezado:(define (precioFinal? bono cantidad clase) ...)
;Ejemplo: bono = "no" cantidad = 1.2 clase = chimuelo arrojara no valido.
;Cuerpo:

(define (precioFinal? bono cantidad clase)
  (cond
    ((and (boolean=? true (bono? bono)) (string=? clase "Chocolate")) (*(precioTorta cantidad clase) 0.8))
    ((and (boolean=? true (bono? bono)) (string=? clase "Naranja")) (* (precioTorta cantidad clase) 0.7))
    ((and (boolean=? true (bono? bono)) (string=? clase "Genovesa")) (* (precioTorta cantidad clase) 0.7))
    ((and (boolean=? true (bono? bono)) (string=? clase "Frances")) (* (precioBombon cantidad clase) 0.95))
    ((and (boolean=? true (bono? bono)) (string=? clase "Avellanas")) (* (precioBombon cantidad clase) 0.95))
    ((and (boolean=? false (bono? bono)) (string=? clase "Chocolate")) (precioTorta cantidad clase))
    ((and (boolean=? false (bono? bono)) (string=? clase "Naranja")) (precioTorta cantidad clase))
    ((and (boolean=? false (bono? bono)) (string=? clase "Genovesa")) (precioTorta cantidad clase))
    ((and (boolean=? false (bono? bono)) (string=? clase "Frances")) (precioBombon cantidad clase))
    ((and (boolean=? false (bono? bono)) (string=? clase "Avellanas")) (precioBombon cantidad clase))
    (else "Dato no Valido")                                                                    
    )
  )
;Prueba

(precioFinal? "no" 1.2 "Chimuelo")


   

