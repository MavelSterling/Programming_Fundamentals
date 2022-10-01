;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname sexo) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ZONA DE DEFINICIONES;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define arbol-g (list 'mark
                      (list 'pedro
                            (list 'jack
                                  (list 'paul empty empty)
                                  (list 'tabitha empty empty))
                            (list 'carmen
                                  (list 'dorian empty empty)
                                  (list 'ximena empty empty)))
                      (list 'nancy
                                  (list 'carlos
                                        (list 'piers empty empty)
                                        (list 'diana empty empty))
                                  (list 'celia
                                        (list 'tom empty empty)
                                        (list 'amanda empty empty)))))
(define f (list 'mark
                      (list 'pedro
                            empty
                            (list 'carmen
                                  (list 'dorian empty empty)
                                  empty))
                      (list 'nancy
                                  (list 'carlos
                                        (list 'piers empty empty)
                                        (list 'diana empty empty))
                                  (list 'celia
                                        (list 'tom empty empty)
                                        (list 'amanda empty empty)))))

(define arbol-p (list'oscar
                      (list 'alicia
                            (list 'mirian
                                  (list 'johanna
                                        (list 'a empty empty)
                                        (list 'b empty empty))
                                  (list 'ofelia
                                        (list 'c empty empty)
                                        (list 'd empty empty)))
                            (list 'ramiro
                                  (list 'hector
                                        (list 'e empty empty)
                                        (list 'f empty empty))
                                  (list 'fabio
                                        (list 'h empty empty)
                                        (list 'i empty empty))))
                                  
                      (list 'marcos
                            (list 'daniel
                                  (list 'hernan empty empty)
                                        
                                  (list 'jose
                                        (list 'k empty empty)
                                        (list 'l empty empty)))
                            (list 'candida
                                  (list 'maria
                                        (list 'm empty empty)
                                        (list 'n empty empty))
                                  (list 'tomas
                                        (list 'o empty empty)
                                        (list 'p empty empty))))))

(define c(list "'jose"
               empty
               (list 'maria empty empty)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FUNCION IZQUIERDA;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Contrato: 
;;izq: lista --> lista (izquierdo)

;;Proposito:
;;Esta Funcion resive como entrada un nodo y le saca su izquierda

;;Encabezado:
;(define (izq nodo)...)

;;Ejemplo
;;(izq arbol-g); debe retornar:(list 'pedro (list 'jack (list 'paul empty empty) (list 'tabitha empty empty))(list 'carmen (list 'dorian empty empty) (list 'ximena empty empty))) 

;;Cuerpo
(define (izq nodo)
  (first (rest nodo))
  )

;;Pruebas
(check-expect(izq arbol-g)(list'pedro(list 'jack (list 'paul empty empty) (list 'tabitha empty empty)) (list 'carmen (list 'dorian empty empty) (list 'ximena empty empty))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FUNCION DERECHA;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Contrato: 
;;der: lista --> lista (derecho)

;;Proposito:
;;Esta Funcion resive como entrada un nodo y le saca su derecha

;;Encabezado:
;;(define (der nodo)...)

;;Ejemplo
;;(der arbol-g);debe retornar:(list 'nancy (list 'carlos (list 'piers empty empty) (list 'diana empty empty))(list 'celia (list 'tom empty empty) (list 'amanda empty empty)))

;;Cuerpo:
(define (der nodo)
  (first(rest(rest nodo))))

;;Pruebos
(check-expect(der arbol-g)(list 'nancy (list 'carlos (list 'piers empty empty) (list 'diana empty empty))(list 'celia (list 'tom empty empty) (list 'amanda empty empty))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FUNCION BUSCAR;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Contrato:
;;buscar: lista symbol-->arbol

;;Proposito:
;;Esta funcion me permite buscar un elemento dentro de un arbol y crear un sub-arbol del mismo teniendo como raiz el elemento buscado 

;;Encabezado
;;(define (buscar arbol elemento)
;;  (cond
;;    [(empty? arbol) ...]
;;    [(equal? (first arbol) elemento) ...]
;;    [else 
;;     ...]))

;;Ejemplos:
;;(buscar arbol-g 'mark);debe retornar:(list'mark(list 'pedro(list 'jack (list 'paul empty empty) (list 'tabitha empty empty))(list 'carmen (list 'dorian empty empty) (list 'ximena empty empty)))(list'nancy(list 'carlos (list 'piers empty empty) (list 'diana empty empty)) (list 'celia (list 'tom empty empty) (list 'amanda empty empty))))

;;Cuerpo
(define (buscar arbol elemento)
  (cond
    [(empty? arbol) empty]
    [(equal? (first arbol) elemento) arbol]
    [else (append (buscar (izq arbol) elemento) (buscar (der arbol) elemento))]))

;;Pruebas
(check-expect(buscar arbol-g 'mark)(list'mark(list 'pedro(list 'jack (list 'paul empty empty) (list 'tabitha empty empty))(list 'carmen (list 'dorian empty empty) (list 'ximena empty empty)))(list'nancy(list 'carlos (list 'piers empty empty) (list 'diana empty empty)) (list 'celia (list 'tom empty empty) (list 'amanda empty empty)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;             
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FUNCION ARBOL-LISTA;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Contrato:
;;arbol-lista: arbol---> lista

;;Proposito 
;;Esta funcion resive como entrada un arbol compuesto por simbolos y saca cada uno de sus elementos y los pone en una lista 

;;Encabezado
;;(define (arbol-lista arbol)
;;  (cond
;;    [(empty? arbol)...]
;;    [(symbol? (first arbol))...]
;;    [else ...]
;;   )
;;  )

;;Ejemplos
;;(arbol-lista arbol-g);debe retornar; (list 'mark 'pedro 'jack 'paul 'tabitha 'carmen 'dorian 'ximena 'nancy 'carlos 'piers 'diana 'celia 'tom 'amanda))
;;(arbol-lista c);debe retornar: empty
;;Cuerpo
(define (arbol-lista arbol)
  (cond
    [(empty? arbol)empty]
    [(symbol? (first arbol)) (append(list (first arbol)) (arbol-lista(izq arbol)) (arbol-lista (der arbol)))]
    [else empty]
   )
  )

;;Pruebas
(check-expect(arbol-lista arbol-g)(list 'mark 'pedro 'jack 'paul 'tabitha 'carmen 'dorian 'ximena 'nancy 'carlos 'piers 'diana 'celia 'tom 'amanda))
(check-expect(arbol-lista c)empty)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FUNCION SACA;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Contrato:
;;saca: lista lista--->lista

;;Proposito:
;;Esta funcion resive una lista (compuesta por los elementos del arbol ingresado) y hace un llamando a la funcion buscar 
;;para sacar un lista con la izquierda y la derecha de cada elemento de la lista ingresada

;;Encabezado:
;;(define (saca lista arbol)
;;  (cond
;;  [(empty? lista)...]
;;  [else ...]
;;  ))

;;Ejemplo:
;;(saca (arbol-lista f)f) ;debe retornar:(list
;; (list
;;  'mark
;;  (list 'pedro empty (list 'carmen (list 'dorian empty empty) empty))
;;  (list 'nancy (list 'carlos (list 'piers empty empty) (list 'diana empty empty)) (list 'celia (list 'tom empty empty) (list 'amanda empty empty))))
;; (list 'pedro empty (list 'carmen (list 'dorian empty empty) empty))
;; (list 'carmen (list 'dorian empty empty) empty)
;; (list 'dorian empty empty)
;; (list 'nancy (list 'carlos (list 'piers empty empty) (list 'diana empty empty)) (list 'celia (list 'tom empty empty) (list 'amanda empty empty)))
;; (list 'carlos (list 'piers empty empty) (list 'diana empty empty))
;; (list 'piers empty empty)
;; (list 'diana empty empty)
;; (list 'celia (list 'tom empty empty) (list 'amanda empty empty))
;; (list 'tom empty empty)
;; (list 'amanda empty empty)))

;;Cuerpo
(define (saca lista arbol)
  (cond
  [(empty? lista)empty]
  [else (append(list(buscar arbol (first lista)))(saca (rest lista) arbol))]
  ))

;;Pruebas

(check-expect(saca (arbol-lista f)f)(list
 (list
  'mark
  (list 'pedro empty (list 'carmen (list 'dorian empty empty) empty))
  (list 'nancy (list 'carlos (list 'piers empty empty) (list 'diana empty empty)) (list 'celia (list 'tom empty empty) (list 'amanda empty empty))))
 (list 'pedro empty (list 'carmen (list 'dorian empty empty) empty))
 (list 'carmen (list 'dorian empty empty) empty)
 (list 'dorian empty empty)
 (list 'nancy (list 'carlos (list 'piers empty empty) (list 'diana empty empty)) (list 'celia (list 'tom empty empty) (list 'amanda empty empty)))
 (list 'carlos (list 'piers empty empty) (list 'diana empty empty))
 (list 'piers empty empty)
 (list 'diana empty empty)
 (list 'celia (list 'tom empty empty) (list 'amanda empty empty))
 (list 'tom empty empty)
 (list 'amanda empty empty)))
;;NOTA: PARA PODER REALIZAR LA PRUEBA DE ESTA FUNCION SE TUVO QUE HACER PRIMERO UN LLAMADO A LA FUNCION ARBOL-LISTA (f) DEDIBO AL PROPOSITO DE LA ESTÁ (saca)
 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FUNCION LLAMADO;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Contrato:
;;llamado:arbol-lista
;;Proposito:
;;Esta funcion se hace como complemento para que la funcion Saca se pueda realizar ya que esta funcion hace un llamado la funcion arbol-lista y luego hace un llamado
;;a la funcion saca con el resultado que se obtuvo con la funcion arbol-lista. Es decir como la funcion saca solo resive una lista como entrada y no un arbol 
;;crea la nesecidad de hacer una funcion q llame a ambas funciones al mismo tiempo (funcion arbol-lista y saca)
;;Encabezado:
;;(define (llamado arbol)...)
;;Ejemplo:
;;(llamado arbol-g);debe retornar:(list
;; (list
;;  'mark
;;  (list 'pedro (list 'jack (list 'paul empty empty) (list 'tabitha empty empty)) (list 'carmen (list 'dorian empty empty) (list 'ximena empty empty)))
;;  (list 'nancy (list 'carlos (list 'piers empty empty) (list 'diana empty empty)) (list 'celia (list 'tom empty empty) (list 'amanda empty empty))))
;; (list 'pedro (list 'jack (list 'paul empty empty) (list 'tabitha empty empty)) (list 'carmen (list 'dorian empty empty) (list 'ximena empty empty)))
;; (list 'jack (list 'paul empty empty) (list 'tabitha empty empty))
;; (list 'paul empty empty)
;; (list 'tabitha empty empty)
;; (list 'carmen (list 'dorian empty empty) (list 'ximena empty empty))
;; (list 'dorian empty empty)
;; (list 'ximena empty empty)
;; (list 'nancy (list 'carlos (list 'piers empty empty) (list 'diana empty empty)) (list 'celia (list 'tom empty empty) (list 'amanda empty empty)))
;; (list 'carlos (list 'piers empty empty) (list 'diana empty empty))
;; (list 'piers empty empty)
;; (list 'diana empty empty)
;; (list 'celia (list 'tom empty empty) (list 'amanda empty empty))
;; (list 'tom empty empty)
;; (list 'amanda empty empty)))

;;Cuerpo:
(define (llamado arbol)
  (saca(arbol-lista arbol)arbol))

;;Prueba
(check-expect(llamado arbol-g)(list
 (list
  'mark
  (list 'pedro (list 'jack (list 'paul empty empty) (list 'tabitha empty empty)) (list 'carmen (list 'dorian empty empty) (list 'ximena empty empty)))
  (list 'nancy (list 'carlos (list 'piers empty empty) (list 'diana empty empty)) (list 'celia (list 'tom empty empty) (list 'amanda empty empty))))
 (list 'pedro (list 'jack (list 'paul empty empty) (list 'tabitha empty empty)) (list 'carmen (list 'dorian empty empty) (list 'ximena empty empty)))
 (list 'jack (list 'paul empty empty) (list 'tabitha empty empty))
 (list 'paul empty empty)
 (list 'tabitha empty empty)
 (list 'carmen (list 'dorian empty empty) (list 'ximena empty empty))
 (list 'dorian empty empty)
 (list 'ximena empty empty)
 (list 'nancy (list 'carlos (list 'piers empty empty) (list 'diana empty empty)) (list 'celia (list 'tom empty empty) (list 'amanda empty empty)))
 (list 'carlos (list 'piers empty empty) (list 'diana empty empty))
 (list 'piers empty empty)
 (list 'diana empty empty)
 (list 'celia (list 'tom empty empty) (list 'amanda empty empty))
 (list 'tom empty empty)
 (list 'amanda empty empty)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;COMIENZO FUNCIONES SEXO FEMENINO;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FUNCION SACA-DERECHA;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Contrato
;;saca-derecha:lista-->lista

;;Proposito:
;;Esta funcion resive una lista que en su contenido se encutra otra lista y dentro de ella hay una de cada 
;;elemento del arbol con su izquierda y derecha lo hace la funcion es  sacar al primer elemento la derecha y lo guarda en una lista

;;Encabezado
;;(define(saca-derecha lista)
;;  (cond
;;    [(empty? lista)...]
;;    [(equal? (der(first lista)) empty) ... ]
;;    [else ...]
;;  ))

;;Ejemplo
;;(saca-derecha (llamado arbol-g));debe retornar: (list
;; (list 'nancy (list 'carlos (list 'piers empty empty) (list 'diana empty empty)) (list 'celia (list 'tom empty empty) (list 'amanda empty empty)))
;; (list 'carmen (list 'dorian empty empty) (list 'ximena empty empty))
;; (list 'tabitha empty empty)
;; (list 'ximena empty empty)
;; (list 'celia (list 'tom empty empty) (list 'amanda empty empty))
;; (list 'diana empty empty)
;; (list 'amanda empty empty))

;;Cuerpo
(define(saca-derecha lista)
  (cond
    [(empty? lista)empty]
    [(equal? (der(first lista)) empty) (saca-derecha (rest lista)) ]
    [else (append (list(der(first lista))) (saca-derecha(rest lista)))]
  ))
;;Pruebas
(check-expect(saca-derecha (llamado arbol-g))(list
 (list 'nancy (list 'carlos (list 'piers empty empty) (list 'diana empty empty)) (list 'celia (list 'tom empty empty) (list 'amanda empty empty)))
 (list 'carmen (list 'dorian empty empty) (list 'ximena empty empty))
 (list 'tabitha empty empty)
 (list 'ximena empty empty)
 (list 'celia (list 'tom empty empty) (list 'amanda empty empty))
 (list 'diana empty empty)
 (list 'amanda empty empty)))

;;NOTA: PARA LA PRUEBA DE ESTA FUNCION SE TUVO QUE HACER PRIMERO UN LLAMADO LA FUNCION llamado PARA PODER SACAR LA LISTA QUE RESIVE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FUCION LLAMADO2;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Contrato:
;;llamado2:lista-->lista

;;Proposito:
;;Esta funcion es un complemento de la funcion saca-derecha, su funcionamiento consiste en 
;;hacer un llamado a las funciones llamado y saca-derecha, para obtener como resultado un lista la que tiene como
;;contenido una lista con las mujeres que se encuentran en el arbo ingresado

;;Encabezado
;;(define (llamado2 arbol)...)

;;Ejemplo
;;(llamado2 arbol-g); debe retornar: (list
;; (list 'nancy (list 'carlos (list 'piers empty empty) (list 'diana empty empty)) (list 'celia (list 'tom empty empty) (list 'amanda empty empty)))
;; (list 'carmen (list 'dorian empty empty) (list 'ximena empty empty))
;; (list 'tabitha empty empty)
;; (list 'ximena empty empty)
;; (list 'celia (list 'tom empty empty) (list 'amanda empty empty))
;; (list 'diana empty empty)
;; (list 'amanda empty empty))

;;Cuerpo
(define (llamado2 arbol)
(saca-derecha (llamado arbol)))

;;Pruebas
(check-expect(llamado2 arbol-g)(list
 (list 'nancy (list 'carlos (list 'piers empty empty) (list 'diana empty empty)) (list 'celia (list 'tom empty empty) (list 'amanda empty empty)))
 (list 'carmen (list 'dorian empty empty) (list 'ximena empty empty))
 (list 'tabitha empty empty)
 (list 'ximena empty empty)
 (list 'celia (list 'tom empty empty) (list 'amanda empty empty))
 (list 'diana empty empty)
 (list 'amanda empty empty)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FUNCION MUJERES;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Contrato
;;mujeres: lista--> lista

;;Proposito: 
;;la funcion mujeres resive un lista que dentro de ella tiene una lista de lista en donde cada elemento es una mujer y le saca el primer elemento a cada elemento almacenandolo en una nueva lista

;;Encabezado
;;(define (mujeres lista)
;;  (cond
;;    [(empty? lista)...]
;;    [else ...]
;;    )
;;  )

;;Ejemplo
;;(mujeres(llamado2 arbol-g));debe retornar:(list 'nancy 'carmen 'tabitha 'ximena 'celia 'diana 'amanda)

;;Cuerpo
(define (mujeres lista)
  (cond
    [(empty? lista)empty]
    [else (append(list(first(first lista)))(mujeres(rest lista)))]
    )
  )

;;Pruebas
(check-expect(mujeres(llamado2 arbol-g))(list 'nancy 'carmen 'tabitha 'ximena 'celia 'diana 'amanda))

;;NOTA: PARA PODER HACER LAS PRUEBAS FUE NECESARIO LLAMAR A LA FUNCION llamado2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FUCION LLAMADO3;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Contrato:
;;llamado3: lista-->lista

;;Proposito:
;;Esta funcion hace una llamado a las funciones  llamado2 y mujeres y obtiene como resultado una lista con las mujeres contenidas
;;en el arbol ingresado 

;;Encabezado
;;(define(llamado3 arbol)...)

;;Ejemplo
;;(llamado3 arbol-g); debe retornar :(list 'nancy 'carmen 'tabitha 'ximena 'celia 'diana 'amanda)

;;Cuerpo
(define(llamado3 arbol)
  (mujeres(llamado2 arbol)))

;;Pruebas
(check-expect(llamado3 arbol-g)(list 'nancy 'carmen 'tabitha 'ximena 'celia 'diana 'amanda))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FIN DE SEXO FEMENINO;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;COMIENZO FUNCIONES SEXO MASCULINO;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FUNCION SACA-IZQUIERDA;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Contrato
;;saca-izquierda:lista-->lista

;;Proposito:
;;Esta funcion resive una lista y le saca al primer elemento la izquierda y lo guarda en una lista

;;Encabezado;:
;;(define(saca-izquierda lista)
;;  (cond
;;    [(empty? lista)...]
;;    [(equal? (izq(first lista))empty) ... ]
;;    [else ... ]
;;  ))

;;Ejemplos 
;;(saca-izquierda (llamado arbol-g)); debe retornar :(list
;; (list 'pedro (list 'jack (list 'paul empty empty) (list 'tabitha empty empty)) (list 'carmen (list 'dorian empty empty) (list 'ximena empty empty)))
;; (list 'jack (list 'paul empty empty) (list 'tabitha empty empty))
;; (list 'paul empty empty)
;; (list 'dorian empty empty)
;; (list 'carlos (list 'piers empty empty) (list 'diana empty empty))
;; (list 'piers empty empty)
;; (list 'tom empty empty))

;;Cuerpo
(define(saca-izquierda lista)
  (cond
    [(empty? lista)empty]
    [(equal? (izq(first lista))empty) (saca-izquierda(rest lista)) ]
    [else (append (list(izq(first lista))) (saca-izquierda(rest lista))) ]
  ))

;;Pruebas
(check-expect(saca-izquierda (llamado arbol-g))(list
 (list 'pedro (list 'jack (list 'paul empty empty) (list 'tabitha empty empty)) (list 'carmen (list 'dorian empty empty) (list 'ximena empty empty)))
 (list 'jack (list 'paul empty empty) (list 'tabitha empty empty))
 (list 'paul empty empty)
 (list 'dorian empty empty)
 (list 'carlos (list 'piers empty empty) (list 'diana empty empty))
 (list 'piers empty empty)
 (list 'tom empty empty)))
;;NOTA:PARA PODER REALIZAR LA PRUEBA ES NECESESARIO LLAMAR A LA FUNCION llamado DEBIDO A QUE ESTA FUNCION SACA LA LISTA CON LA FUNCIONA saca-izquierda

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FUCION LLAMADO5;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Contrato:
;;llamado5: lista-->lista

;;Proposito: Esta funcion es un complemento de la funcion saca-derecha, su funcionamiento consiste en 
;;hacer un llamado a las funciones llamado y saca-izquierda, para obtener como resultado un lista la que tiene como
;;contenido un lista con las hombres que se encuentran en el arbo ingresado

;;Encabezado
;;(define (llamado5 arbol)...)

;;Ejemplos
;;(llamado5 arbol-g) ; debe retornar:(list
;; (list 'pedro (list 'jack (list 'paul empty empty) (list 'tabitha empty empty)) (list 'carmen (list 'dorian empty empty) (list 'ximena empty empty)))
;; (list 'jack (list 'paul empty empty) (list 'tabitha empty empty))
;; (list 'paul empty empty)
;; (list 'dorian empty empty)
;; (list 'carlos (list 'piers empty empty) (list 'diana empty empty))
;; (list 'piers empty empty)
;; (list 'tom empty empty)))

;;Cuerpo
(define (llamado5 arbol)
(saca-izquierda (llamado arbol)))

;;Pruebas

(check-expect(llamado5 arbol-g)(list
 (list 'pedro (list 'jack (list 'paul empty empty) (list 'tabitha empty empty)) (list 'carmen (list 'dorian empty empty) (list 'ximena empty empty)))
 (list 'jack (list 'paul empty empty) (list 'tabitha empty empty))
 (list 'paul empty empty)
 (list 'dorian empty empty)
 (list 'carlos (list 'piers empty empty) (list 'diana empty empty))
 (list 'piers empty empty)
 (list 'tom empty empty)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FUNCION HOMBRES;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Contrato
;;hombres: lista--> lista

;;Proposito: 
;;la funcion hombres resive un lista que dentro de ella tiene una lista de lista en donde cada elemento es un hombres y
;;le saca el primer elemento a cada elemento almacenandolo en una nueva lista 

;;Encabezado
;;(define (hombres lista)
;;  (cond
;;    [(empty? lista)...]
;;    [else ...]
;;    )
;;  )

;;Ejemplo
;;(hombres(llamado5 arbol-g)); debe retornar: (list 'pedro 'jack 'paul 'dorian 'carlos 'piers 'tom)

;;Cuerpo
(define (hombres lista)
  (cond
    [(empty? lista)empty]
    [else (append(list(first(first lista)))(hombres(rest lista)))]
    )
  )

;;Prueba
(check-expect(hombres(llamado5 arbol-g))(list 'pedro 'jack 'paul 'dorian 'carlos 'piers 'tom))

;;NOTA: DEBIDO A QUE ESTA FUNCION ILSTA DENTRO DE UNA LISTA SE HACE UN LLAMADO A LA FUNCION llamado5 PARA OBTENERLA

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FUCION LLAMADO6;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Contrato:
;;llamado6: lista-->lista

;;Proposito:
;;Esta funcion hace una llamado a las funciones  llamado5 y hombres y obtiene como resultado una lista con los hombres contenidos
;;en la lista ingresada

;;Encabezado
;;(define(llamado6 lista)...)

;;Ejemplo
;;(llamado6 arbol-g);debe retornar: (list 'pedro 'jack 'paul 'dorian 'carlos 'piers 'tom)

;;Cuerpo
(define(llamado6 lista)
  (hombres (llamado5 lista)))

;;Pruebas
(check-expect(llamado6 arbol-g)(list 'pedro 'jack 'paul 'dorian 'carlos 'piers 'tom))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FIN DE SEXO MASCULINO;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FUNCION SEXO;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Contrato
;;sexo:simbolo lista--> lista

;;Proposito
;;Esta funcion resive un simbolo y un arbol(lista), su funcionamiento consistes en validar unas las entradas
;;y si todas esta se cumplen hace un llamado a las funciones llamado6 o llamada3 dependiendo el simbolo que le 
;;ingrese, si le ingresa 'f saca todas las mujere que estan dentro del arbol y si le ingresa, 'm saca todos los 
;;hombres que estan dentro del arbol

;;Encabezado
;;(define(sexo simbolo arbol)
;;  (cond
;;    [(equal? (empty? arbol) true)...]
;;    [(equal? (arbol-lista arbol)empty)...]  
;;    [(equal? (symbol? simbolo)false)...]
;;    [else (cond
;;             [(equal? simbolo 'm) ...]
;;             [(equal? simbolo 'f)...]
;;             [else ...]
;;            )]
;;  ))

;;Ejemplos:
;;(sexo 'm empty);debe retornar:"Arbol vacio"
;;(sexo 'f c;debe retornar:)"Verifique que el primer elemento de su arbol sea un simbolo"
;;(sexo "f" arbol-g);debe retornar:"Verifique que simbolo que ingreso sea el correcto (Femenino 'f o Masculino 'm)"
;;(sexo 'f arbol-g);debe retornar:(list 'nancy 'carmen 'tabitha 'ximena 'celia 'diana 'amanda)
;;(sexo 'm arbol-g);debe retornar:(list 'pedro 'jack 'paul 'dorian 'carlos 'piers 'tom)
;;(sexo 'a arbol-g);debe retornar:"operacion invalida"

;;Cuerpo
(define(sexo simbolo arbol)
  (cond
    [(equal? (empty? arbol) true)"Arbol vacio"]
    [(equal? (arbol-lista arbol)empty)"Verifique que el primer elemento de su arbol sea un simbolo"]  
    [(equal? (symbol? simbolo)false)"Verifique que simbolo que ingreso sea el correcto (Femenino 'f o Masculino 'm)"]
    [else (cond
             [(equal? simbolo 'm) (llamado6 arbol)]
             [(equal? simbolo 'f)(llamado3 arbol)]
             [else "operacion invalida"]
            )]
  ))

;;Pruebas
(check-expect(sexo 'm empty)"Arbol vacio")
(check-expect(sexo 'f c)"Verifique que el primer elemento de su arbol sea un simbolo")
(check-expect(sexo "f" arbol-g)"Verifique que simbolo que ingreso sea el correcto (Femenino 'f o Masculino 'm)")
(check-expect(sexo 'f arbol-g)(list 'nancy 'carmen 'tabitha 'ximena 'celia 'diana 'amanda))
(check-expect(sexo 'm arbol-g)(list 'pedro 'jack 'paul 'dorian 'carlos 'piers 'tom))
(check-expect(sexo 'a arbol-g)"operacion invalida")

(sexo 'f arbol-g)