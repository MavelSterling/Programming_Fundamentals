;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname numerica) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;PROGRAMA NUMERICA?;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;DEFINICIONES;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ESTRUCTURAS;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;add;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Analisis y definicion de datos:
;;add es una estructura que representa a la operacion matematica suma
;;add esta compuesta por:
;;left: que almacena al operando del lado izquierdo o primer operando
;;right: que almacena al operando del lado derecho o segundo operando

;;Cuerpo:
(define-struct add (left right))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;dif;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Analisis y definicion de datos:
;;dif es una estructura que representa a la operacion matematica resta
;;dif esta compuesta por:
;;left: que almacena al operando del lado izquierdo o primer operando
;;right: que almacena al operando del lado derecho o segundo operando

;;Cuerpo:
(define-struct dif (left right))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;mul;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Analisis y definicion de datos:
;;mul es una estructura que representa a la operacion matematica multiplicacion
;;mul esta compuesta por:
;;left: que almacena al operando del lado izquierdo o primer operando
;;right: que almacena al operando del lado derecho o segundo operando

;;Cuerpo:
(define-struct mul (left right))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;div;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Analisis y definicion de datos:
;;div es una estructura que representa a la operacion matematica division
;;div esta compuesta por:
;;left: que almacena al operando del lado izquierdo o primer operando
;;right: que almacena al operando del lado derecho o segundo operando

;;Cuerpo:
(define-struct div (left right))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FIN DEFICINIONES;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FUNCIONES;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;numerica?;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;CONTRATO
;;numerica: struct -> boolean

;;PROPOSITO
;;numerica? es una funcion que recibe una estructura, evalua todos los elementos dentro de ella y si todos los elementos son de tipo numerico 
;;retorna un true de lo contrario retornara un false

;;ENCABEZADO
;;(define (numerica? x)
;;  (cond
;;    [(number? x) ...]
;;    [(symbol? x) ...]
;;    [(add? x) ...]
;;    [(dif? x) ...]
;;    [(mul? x) ...]
;;    [(div? x) ...]
;;    (else ...) 
;;    )
;;  )

;;EJEMPLOS
;;(numerica? (make-add 10 (make-dif 12 3))) ;;Retornara true
;;(numerica? (make-div (make-mul 12 'y) (make-add 12 (make-dif 'y 12)))) ;;Retornara false


;;CUERPO
(define (numerica? x)
  (cond
    [(number? x) true]
    [(or (string? x) (symbol? x) (list? x) (boolean? x)) false]
    [(add? x) (and (numerica? (add-left x)) (numerica? (add-right x)))]
    [(dif? x) (and (numerica? (dif-left x)) (numerica? (dif-right x)))]
    [(mul? x) (and (numerica? (mul-left x)) (numerica? (mul-right x)))]
    [(div? x) (and (numerica? (div-left x)) (numerica? (div-right x)))]
    (else x) 
    )
  )

;;PRUEBAS
(check-expect (numerica? (make-mul (make-add 3 2) (make-dif 4 10))) true)
(check-expect (numerica? (make-dif (make-add (make-dif 6 'y) 7) (make-dif 5 'y))) false)
(check-expect (numerica? (make-div (make-mul (make-add 1 (make-dif 5 9)) (make-dif (make-add 8 9) (make-mul 'y 8))) (make-mul (make-add (make-mul 7 10) 6) (make-dif (make-dif 10 3) (make-div 'y 1))))) false)
(check-expect (numerica? (make-add (make-add "uno" 10) 15)) false)
(check-expect (numerica? (make-dif 2 (make-div (make-mul 7 (list 2 4)) (make-add 7 (list 1 3))))) false)
(check-expect (numerica? (make-add (make-dif 1 false) (make-div (make-mul 2 3) true))) false)

(numerica? (make-add 1 (make-add 'y 2)))
(numerica? (make-add 1 (make-add 10 2)))