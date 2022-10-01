;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname reemplazar) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;PROGRAMA REEMPLAZAR;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;sustituir;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;CONTRATO
;;sustituir: struct number -> number

;;PROPOSITO
;;La funcion sustituir es la encargada de cambiar o sustiruir la variable

;;ENCABEZADO
;;(define (sustituir str x)
;;  (cond
;;    [(symbol? str) ...]
;;    (else ...)
;;    )
;;  )

;;EJEMPLOS
;;(sustituir 'y 10)
;;(sustituir 'a 20)
;;(sustituir 'x 5)
;;(sustituir 'W 15)

;;CUERPO
(define (sustituir str x)
  (cond
    [(symbol? str) (let [(str x)] x)]
    (else str)
    )
  )

;;PRUEBAS
(check-expect (sustituir 'a 5) 5)
(check-expect (sustituir 'B 6) 6)
(check-expect (sustituir 'y 15) 15)
(check-expect (sustituir 'X 35) 35)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;reemplazar;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;CONTRATO
;;reemplazar: struct number -> number

;;PROPOSITO
;;La funcion reemplazar es la encargada de cambiar el valor de la variable por el numero que el usurio ingresa,
;;la funcion reemplazar tambien se encarga de realizar la operacion matematica que se solicita.

;;ENCABEZADO
;;(define (reemplazar x y)
;;  (cond
;;    [(add? x) ...]
;;    [(dif? x) ...]
;;    [(mul? x) ...]
;;    [(div? x) ...]
;;    (else ...) 
;;    )
;;  )

;;EJEMPLOS
;;(reemplazar (make-dif 5 'x) 13)
;;(reemplazar (make-div (make-add 10 4) 'y) 2)
;;(reemplazar (make-mul (make-add (make-div 2 'x) 'x) (make-add 'x 'x)) 6)

;;CUERPO
(define (reemplazar x y)
  (cond
    [(add? x) (+ (reemplazar (sustituir (add-left x) y) y) (reemplazar (sustituir (add-right x) y) y))]
    [(dif? x) (- (reemplazar (sustituir (dif-left x) y) y) (reemplazar (sustituir (dif-right x) y) y))]
    [(mul? x) (* (reemplazar (sustituir (mul-left x) y) y) (reemplazar (sustituir (mul-right x) y) y))]
    [(div? x) (/ (reemplazar (sustituir (div-left x) y) y) (reemplazar (sustituir (div-right x) y) y))]
    (else x) 
    )
  )

;;PRUEBAS
(check-expect (reemplazar (make-mul (make-add 3 2) (make-dif 4 'y)) 8) -20)
(check-expect (reemplazar (make-div (make-add (make-dif 6 'y) 7) (make-dif 5 'y)) 9) -1)
(check-expect (reemplazar (make-dif (make-mul (make-div 3 'y) 'y) (make-add 'y 'y)) 5) -7)
(reemplazar (make-add 1 (make-add 'y 2)) 5)