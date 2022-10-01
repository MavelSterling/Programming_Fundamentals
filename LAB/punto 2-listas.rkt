;;PUNTO 2 a.

;; NOMBRES: Mavelyn Sterling, Sebastian Potes Blandon

;; PLAN: 3743, 2711


;;CONTRATO:
;subconjunto : lista lista -> booleano

;;ENCABEZADO:
;(define (subconjunto List1 List2) (cond...))

;;PROPOSITO:
;Desarrollar un programa que a partir de 2 conjuntos, determine si el primero es subconjunto del segundo

;;EJEMPLO:
;(subconjunto conjunto1 conjunto2) debe retornar "True"

;;CUERPO:
(define conjunto1 (list 1 2 3 4 5 6 7 ))
(define conjunto2 (list 1 2 3))


(define (subconjunto List1 List2)
  (cond
    [(empty? List1) "True"]
    [(empty? List2) "False"]
    [(eq? (first List1)(first List2))(subconjunto (rest List1) (rest List2))]
    [else (subconjunto List1(rest List2))]
    ))



;;PRUEBA:

(subconjunto conjunto1 conjunto2)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;PUNTO 2 b.

;;CONTRATO:
;iguales: lista lista -> booleano

;;ENCABEZADO:
;(define (iguales list3 list4)
;  (cond...))

;;PROPOSITO:
; Desarrollar un programa que a partir de 2 conjuntos, determine si son iguales

;;EJEMPLO:
;(iguales conjunto3 conjunto4) debe retornar "False"

;;CUERPO:
(define conjunto3 (list 1 2 3 4))
(define conjunto4 (list 5 6 7 8))

(define (iguales list3 list4)
  (cond
    [(and (empty? list3) (empty? list4)) "Conjuntos Vacíos"]
    [(or (empty? list4) (empty? list4)) "Hay un conjunto vacío"]
    [(equal? list3 list4) "True"]
    [else "False"]))

;;PRUEBA:

(iguales conjunto3 conjunto4)
(iguales conjunto1 conjunto2)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;PUNTO 2 c.

;;CONTRATO:
;interseccion: lista lista -> number

;;ENCABEZADO:
;(define (interseccion list5 list6)
;   (cond...))

;;PROPOSITO:
;A partir de 2 conjuntos determine el conjunto intersección entre ellos

;;EJEMPLO:
;(interseccion conjunto5 conjunto6) debe retornar '()



;;CUERPO:
(define conjunto5 (list 1 2 3))
(define conjunto6 (list 4 5 6 7 8))

(define (interseccion list5 list6)
  (cond
    [(empty? list5) empty]
    [(empty? list6) empty]
    [(member? (first list5) list6) (cons (first list5) (interseccion (rest list5) list6))]
    [else (interseccion (rest list5) list6)]
    ))


;;PRUEBA:
(interseccion conjunto5 conjunto6)
(interseccion conjunto3 conjunto4)
