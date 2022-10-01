;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Untitled) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (programa)
  (local
    (
     (define-struct estudiante (nom prom))
     (define curso empty)
     (define opcion 0)
     (define nombre 0)
     (define promedio 0)
     (define (adicionar)
       (begin
         (printf "digite nombre: ")
         (set! nombre (read))
         (printf "digite promedio: ")
         (set! promedio (read))
         (set! curso (cons (make-estudiante nombre promedio) curso))
        )
      )
     (define (mostrar)
       (write curso)
      )
     (define (menu)
       (begin
         (printf "***MENU***~n1. Adicionar ~n")
         (printf "2. Mostrar ~n")
         (printf "3. Salir ~n")
         (set! opcion (read))
         (cond 
           [(= opcion 1) (begin
                           (adicionar)
                           (menu))]
           [(= opcion 2) (begin
                           (mostrar)
                           (menu))]
           [(= opcion 3) (printf "Fin del programa")]
          )
        )
      )
     )
    (menu)))

(programa)