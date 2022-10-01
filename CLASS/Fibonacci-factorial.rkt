;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |mayo 11-clase|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;Ejemplo Fibonacci- BASE

(define(f n)
  (cond
    ((= n 0) 0)
    ((= n 1) 1)
    (else (+ (f (- n 1)) 
             (f (- n 2))))))

(f 10)

;Ejemplo factorial - BASE

(define (factorial n)
  (cond
    [(= n 0) 1]
    [else 
     (* n (factorial (- n 1)))]
    ))

(factorial 2)

;EJEMPLO-EJERCICIO

(define (sumatoria n)
  (cond
    [(= n 0) n] ;Caso base
   [else (+ n (sumatoria (- n 1)))] ;Caso recursivo
   )
  )

(sumatoria 5);15
(sumatoria 0);