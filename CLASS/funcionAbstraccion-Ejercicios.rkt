;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname funcionAbstraccion-Ejercicios) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Punto 1
;;;;ANALISIS DE DISEÑO
;Ese Programa Resive como Entrada un lista y un operador, los operadores pueden ser
;even?: lista de numeros Pares
;odd?: lista de numero Impares
;integer? lista de numeros enteros

;;;;Contrato:  lista (algo → booleano) → lista

;;;;Encabezado: (define (programa  lista operador) (cond...))

;;;;Propósito:

;;;;Ejemplos:
;(programa (list 1  2 3 4 5) even?  ) debe retornar (list 2 4 )
;(programa (list 1  2 3 4 5)  odd?) debe retornar (list 1 3 5 )
;(programa (list 1  2.2 3.4 4 5)  integer? ) debe retornar (list 1 4 5)
;;;;Cuerpo:
(define (programa  lista operador)
  (cond
    [(empty? lista)empty]
    [(operador (first lista)) (append (list (first lista)) (programa (rest lista) operador) ) ]
    [else (programa  (rest lista) operador ) ])
  )


;;Pruebas

(programa (list 1  2 3 4 5) even?  )
(programa (list 1  2 3 4 5)  odd?)
(programa (list 1  2.2 3.4 4 5)  integer? )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Punto 2

;; copia : X -> (listof X)
;; crea una lista que contiene
;; obj n veces

;(define (copia n obj)
;  (cond
;    [(zero? n) empty]
;    [else (cons obj 
;                (copia (sub1 n) obj))]))

;; suma-n : numero -> numero
;; suma n a x usando unicamente(+ 1 ...) 

;(define (suma-n n x)
;  (cond
;    [(zero? n) x]
;    [else (+ 1
;             (suma-n (sub1 n) x))]))
;(suma-n 1 4)

;;;;;;;Encabezado: (define (union o n x)(cond...))

;;;;;;;Propósito: Construir en una función la abstracción de dos funciones, 
;por lo cual se deben unir las funciones en la función principal

;;;;;;;Ejemplos:
;(union "copia" 4  5) debe retornar (list 5 5 5 5 5)
;(union "coa" 4  5) debe retornar "Operacion invalida"
;(union "suma" 4 5) debe retornar 9
;(union "suma" "4" 5) debe retornar "Datos de entrada invalido"
;(union "suma" 2 "5") debe retornar "Datos de entrada invalido"

;;;;;;;Cuerpo:
(define (union o n x)
  (cond
    [(equal? o "copia")  (local ((define (copia n obj)
                                   (cond
                                     [(zero? n) empty]
                                     [else (cons obj (copia (sub1 n) obj))]))) (copia n x))]
    [(equal? o "suma") (local((define (suma-n n x)
                                (cond
                                  [(and(number? n)(zero? n)) x]
                                  [(and (number? x)(number? n))(+ 1(suma-n (sub1 n) x))]
                                  [else "Datos de entrada invalido"])))(suma-n n x))]
                                  
    [else "Operacion invalida"]  ) )

;;Pruebas

(union "copia" 4  5)
(union "coa" 4  5)
(union "suma" 4 5)
(union "suma" "4" 5)
(union "suma" 2 "5")