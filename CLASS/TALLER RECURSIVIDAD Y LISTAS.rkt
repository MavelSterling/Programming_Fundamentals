;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |TALLER RECURSIVIDAD Y LISTAS|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Punto1

(define (tamanoLista lda)
  (cond
    ((empty? lda) 0)
    (else (+ 1 (tamanoLista (rest lda))))
    )
  )

(tamanoLista (list 1 2 5 4)); arroja 4
(tamanoLista empty); arroja 0


(define (numpar lda)
  (cond
    ((empty? lda) 0)
    ((even? (first lda)) (+ 1 (numpar (rest lda))))
    (else (numpar (rest lda)))

   )
  )
(numpar (list 2 4 1)); arroja 2
(numpar (list 1 5 2 3)); arroja 1





(define (listapar lda)
  (cond
    ((empty? lda) empty)
    ((even? (first lda)) (cons (first lda) (listapar (rest lda))))
    (else (listapar (rest lda)))
    )
  )

(listapar (cons 6 (cons 8 (cons 9 (cons 4 (cons 1 empty))))))


(define (insertar lda x)
  (cond
  ((empty? lda) (cons x lda))
  (else (cons (first lda) (insertar (rest lda) x))) 
  )
  )

(insertar (cons 6 (cons 8 empty)) 10)

;Contrato;
;Ingresara una lista, cuando el contador sea igual a la posicion, se anexara el elemento en esa ubicacion, sino el contador se ira sumando en uno,
;hasta que contador=pos.  posInsertar lda: lista: num ele: num -> list: num

;Ejemplo: (posInsertar (cons 2 (cons 4 empty)) 10 2 1); arroja (list 10 2 4)


(define (posInsertar lda ele pos contador)
  (cond
    ((empty? lda) (cons ele lda))
    ((= contador pos)(cons ele (rest lda)))
    (else (cons (first lda)(posInsertar (rest lda) ele pos (+ 1 contador))))
    )
  )

(posInsertar (cons 2 (cons 4 empty)) 'hola 1 1)



(define (sumaDigitos numero)
  (cond
    ((= numero 0) 0)
    (else (+ (remainder numero 10) (sumaDigitos (- (/ numero 10) (/ (remainder numero 10) 10)))))
   )
  )


(sumaDigitos 152)


(define (elimina lda pos contador)
  (cond
    ((empty? lda) empty)
    ((equal? pos contador) (rest lda))
    (else (cons (first lda) (elimina (rest lda) pos (+ 1 contador))))
    )
  )

(elimina (cons 2 (cons 5 (cons 8 empty))) 4 1)

                                         