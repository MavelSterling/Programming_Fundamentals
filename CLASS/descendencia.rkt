;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname descendencia) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define arbol-v  empty)
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
(define arbol-p (list 'oscar
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FUNCION IZQUIERDA;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Contrato: 
;;izq: lista --> lista (izquierdo)

;;Proposito:
;;Esta Funcion resive como entrada un nodo y le saca su izquierda

;;Encabezado:
;(define (izq nodo)...)

;;Ejemplo
;;(izq arbol-g);debe retornar:(list 'pedro (list 'jack (list 'paul empty empty) (list 'tabitha empty empty)) (list 'carmen (list 'dorian empty empty) (list 'ximena empty empty)))
;;(izq arbol-p);debe retornar:(list 'alicia(list 'mirian (list 'johanna (list 'a empty empty) (list 'b empty empty)) (list 'ofelia (list 'c empty empty) (list 'd empty empty)))(list 'ramiro (list 'hector (list 'e empty empty) (list 'f empty empty)) (list 'fabio (list 'h empty empty) (list 'i empty empty))))

;;Cuerpo
(define (izq nodo)
  (first (rest nodo))
  )

;;Pruebas
(check-expect(izq arbol-g)(list 'pedro (list 'jack (list 'paul empty empty) (list 'tabitha empty empty)) (list 'carmen (list 'dorian empty empty) (list 'ximena empty empty))))
(check-expect(izq arbol-p)(list 'alicia(list 'mirian (list 'johanna (list 'a empty empty) (list 'b empty empty)) (list 'ofelia (list 'c empty empty) (list 'd empty empty)))(list 'ramiro (list 'hector (list 'e empty empty) (list 'f empty empty)) (list 'fabio (list 'h empty empty) (list 'i empty empty)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FUNCION DERECHA;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Contrato: 
;;der: lista --> lista (derecho)

;;Proposito:
;;Esta Funcion resive como entrada un nodo y le saca su derecha

;;Encabezado:
;;(define (der nodo)...)

;;Ejemplos:
;;(der arbol-g);debe retornar:(list 'nancy (list 'carlos (list 'piers empty empty) (list 'diana empty empty)) (list 'celia (list 'tom empty empty) (list 'amanda empty empty)))
;;(der arbol-p);debe retornar:(list'marcos(list 'daniel (list 'hernan empty empty) (list 'jose (list 'k empty empty) (list 'l empty empty)))(list 'candida (list 'maria (list 'm empty empty) (list 'n empty empty)) (list 'tomas (list 'o empty empty) (list 'p empty empty))))

;;Cuerpo:
(define (der nodo)
  (first(rest(rest nodo))))

;;Pruebas
(check-expect(der arbol-g)(list 'nancy (list 'carlos (list 'piers empty empty) (list 'diana empty empty)) (list 'celia (list 'tom empty empty) (list 'amanda empty empty))))
(check-expect(der arbol-p)(list'marcos(list 'daniel (list 'hernan empty empty) (list 'jose (list 'k empty empty) (list 'l empty empty)))(list 'candida (list 'maria (list 'm empty empty) (list 'n empty empty)) (list 'tomas (list 'o empty empty) (list 'p empty empty)))))



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
;;(buscar arbol-g 'mark);debe retornar:(list 'mark (list 'pedro (list 'jack (list 'paul empty empty) (list 'tabitha empty empty)) (list 'carmen (list 'dorian empty empty) (list 'ximena empty empty)))(list 'nancy (list 'carlos (list 'piers empty empty) (list 'diana empty empty)) (list 'celia (list 'tom empty empty) (list 'amanda empty empty))))
;;(buscar arbol-g 'pedro);debe retornar:(list 'pedro (list 'jack (list 'paul empty empty) (list 'tabitha empty empty)) (list 'carmen (list 'dorian empty empty) (list 'ximena empty empty)))
;;(buscar arbol-g 'jack);debe retornar:(list 'jack (list 'paul empty empty) (list 'tabitha empty empty))
;;(buscar arbol-g 'carmen);debe retornar:(list 'carmen (list 'dorian empty empty) (list 'ximena empty empty))
;;(buscar arbol-g 'paul);debe retornar:(list 'paul empty empty)
;;(buscar arbol-g 'tabitha);debe retornar:(list 'tabitha empty empty)
;;(buscar arbol-g 'dorian);debe retornar:(list 'dorian empty empty)
;;(buscar arbol-g 'ximena);debe retornar:(list 'ximena empty empty)

;;Cuerpo
(define (buscar arbol elemento)
  (cond
    [(empty? arbol) empty]
    [(equal? (first arbol) elemento) arbol]
    [else (append (buscar (izq arbol) elemento) (buscar (der arbol) elemento))]))

;;Pruebas 
(check-expect(buscar arbol-g 'mark)(list 'mark(list 'pedro (list 'jack (list 'paul empty empty) (list 'tabitha empty empty)) (list 'carmen (list 'dorian empty empty) (list 'ximena empty empty)))(list 'nancy (list 'carlos (list 'piers empty empty) (list 'diana empty empty)) (list 'celia (list 'tom empty empty) (list 'amanda empty empty)))))
(check-expect(buscar arbol-g 'pedro)(list 'pedro (list 'jack (list 'paul empty empty) (list 'tabitha empty empty)) (list 'carmen (list 'dorian empty empty) (list 'ximena empty empty))))
(check-expect(buscar arbol-g 'jack)(list 'jack (list 'paul empty empty) (list 'tabitha empty empty)))
(check-expect(buscar arbol-g 'carmen)(list 'carmen (list 'dorian empty empty) (list 'ximena empty empty)))
(check-expect(buscar arbol-g 'paul)(list 'paul empty empty))
(check-expect(buscar arbol-g 'tabitha)(list 'tabitha empty empty))
(check-expect(buscar arbol-g 'dorian)(list 'dorian empty empty))
(check-expect(buscar arbol-g 'ximena)(list 'ximena empty empty))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FUNCION VALIDACION;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Contrato:
;;validacion: lista symbol-->boolean

;;Proposito:
;;Esta funcion resive como entradas una lista y un simbolo y lo que hace es busca se simbolo dentro de la lista obteniendo
;;como respuesta un boolenano (si esta (true) sino esta (false))

;;Encabezado
;;(define (validacion arbol elemento)
;;  (cond
;;    [(empty? arbol) ...]
;;    [(equal? (first arbol) elemento)...]
;;    [else ...]
;;    )
;;  )

;;Ejemplos:
;;(validacion arbol-g 'juan);debe retornar:false
;;(validacion arbol-p 'amanda);debe retornar:false
;;(validacion arbol-g 'tom);debe retornar:true
;;(validacion arbol-p 'a);debe retornar:true

;;Cuerpo
(define (validacion arbol elemento)
  (cond
    [(empty? arbol) false]
    [(equal? (first arbol) elemento) true]
    [else (or (validacion (izq arbol) elemento) (validacion (der arbol) elemento))]
    )
  )

;;Pruebas 
(check-expect(validacion arbol-g 'juan)false)
(check-expect(validacion arbol-p 'amanda)false)
(check-expect(validacion arbol-g 'tom)true)
(check-expect(validacion arbol-p 'a)true)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FUNCION IZQUIERDA;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Contrato:
;;izquierda: lista symbol-->booleano

;;Proposito:
;;Esta funcion resive la parte izquierda de una arbol y determina si el elemento de entrada esta contedido en esa parte devolviendo como respuesta un tre o false

;;Encabezado:
;;(define (izquierda arbol elemento)...)

;;Ejemplos
;;(izquierda arbol-g 'tom);debe retornar:false
;;(izquierda arbol-g 'diana);debe retornar:false
;;(izquierda arbol-g 'tabitha);debe retornar:true
;;(izquierda arbol-g 'dorian);debe retornar:true

;;Cuerpo
(define (izquierda arbol elemento)
  (validacion(izq arbol) elemento)
  )

;;Pruebas
(check-expect(izquierda arbol-g 'tom)false)
(check-expect(izquierda arbol-g 'diana)false)
(check-expect(izquierda arbol-g 'tabitha)true)
(check-expect(izquierda arbol-g 'dorian)true)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FUNCION DERECHA;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Contrato:
;;derecha: lista symbol-->booleano

;;Proposito:
;;Esta funcion resive la parte derecha de una arbol y determina si el elemento de entrada esta contedido en esa parte devolviendo como respuesta un tre o false

;;Encabezado:
;;(define (derecha arbol elemento)...)

;;Ejemplo:
;;(derecha arbol-g 'tom);debe retornar:true
;;(derecha arbol-g 'diana);debe retornar:true
;;(derecha arbol-g 'tabitha);debe retornar:false
;;(derecha arbol-g 'dorian);debe retornar:false

;;Cuerpo
(define (derecha arbol elemento)
  (validacion(der arbol) elemento)
  )

;;Prueba
(check-expect(derecha arbol-g 'tom)true)
(check-expect(derecha arbol-g 'diana)true)
(check-expect(derecha arbol-g 'tabitha)false)
(check-expect(derecha arbol-g 'dorian)false)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FUNCION IZQUIERDA-O-DERECHA;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Contrato:
;;izq-o-der:lista symbol symbol--lista

;;Proposito:
;;Esta funcion resive un arbol un elemento1 y un elemento2, su funcionmiento consiste en buscar el elemento1 dentro de una arbol, despues que lo localiza
;;crea un sub-arbol que tiene como raiz el elemento1 y busca el elemento2 por la izquierda y por la derecha del nuevo arbol y si lo encuentra saca la lista del lado de donde lo encontro
;;y añade el primer elemento del resultado al final de la misma 

;;Encabezado
;;(define (izq-o-der arbol elemento1 elemento2)
;;  (cond
;;    [(equal? (izquierda (buscar arbol elemento1)elemento2) true)...]
;;    [(equal? (derecha(buscar arbol elemento1)elemento2)true)...]
;;   )
;;  )

;;Ejemplos 
;;(izq-o-der arbol-g 'pedro 'ximena);debe retornar:(list 'carmen (list 'dorian empty empty) (list 'ximena empty empty) 'carmen)
;;(izq-o-der arbol-g 'nancy 'tom);debe retornar:(list 'celia (list 'tom empty empty) (list 'amanda empty empty) 'celia)

;;Cuerpo
(define (izq-o-der arbol elemento1 elemento2)
  (cond
    [(equal? (izquierda (buscar arbol elemento1)elemento2) true)(append(izq (buscar arbol elemento1))(list(first(izq (buscar arbol elemento1)))))]
    [(equal? (derecha(buscar arbol elemento1)elemento2)true)(append (der(buscar arbol elemento1))(list(first(der (buscar arbol elemento1)))))]
   )
  )

;;Pruebas
(check-expect(izq-o-der arbol-g 'pedro 'ximena)(list 'carmen (list 'dorian empty empty) (list 'ximena empty empty) 'carmen))
(check-expect(izq-o-der arbol-g 'nancy 'tom)(list 'celia (list 'tom empty empty) (list 'amanda empty empty) 'celia))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FUNCION FILTRO;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Contrato:
;;filtro: lista symbol symbol-->lista

;;Proposito
;;Esta funcion resive como entradas un arbol un elemento1 y un elemento2, su funcionamiento consiste en hacer una llamado recursico a la Funcion
;;IZQ-o-DER hasta que el primer elemento que se obtiene de la lista de la funcion IZQ-O-DER sea igual al elemento, en cada uno de sus llamado 
;;almacena el primer elemento de la lista que obtiene de IZQ-O-DER dando como resultado la lista de los elementos que se encuentran entre el elemento1
;;y el elemento2 sin elemento1 dentro de la lista 

;;Encabezado
;;(define(filtro arbol elemento1 elemento2)
;;  (cond
;;    [(equal? (first(izq-o-der arbol elemento1 elemento2))elemento2)...]
;;    [else ...]
;;    )
;;  )

;;Ejemplos
;;(filtro arbol-g 'carmen 'ximena);debe retornar:(list 'ximena)
;;(filtro arbol-g 'mark 'ximena);debe retornar:(list 'pedro 'carmen 'ximena)
;;(filtro arbol-g 'pedro 'ximena);debe retornar:(list 'carmen 'ximena)
;;(filtro arbol-g 'mark 'paul);debe retornar:(list 'pedro 'jack 'paul)
;;(filtro arbol-g 'pedro 'tabitha);debe retornar:(list 'jack 'tabitha)
;;(filtro arbol-g 'mark 'amanda);debe retornar:(list 'nancy 'celia 'amanda)
;;(filtro arbol-g 'nancy 'piers);debe retornar:(list 'carlos 'piers)
;;(filtro arbol-p 'oscar 'f);debe retornar:(list 'alicia 'ramiro 'hector 'f)
;;(filtro arbol-p 'candida 'p);debe retornar:(list 'tomas 'p)

;;Cuerpo
(define(filtro arbol elemento1 elemento2)
  (cond
    [(equal? (first(izq-o-der arbol elemento1 elemento2))elemento2) (append (list elemento2))]
    [else (append(list(first(izq-o-der arbol elemento1 elemento2)))(filtro(izq-o-der arbol elemento1 elemento2)(first(izq-o-der arbol elemento1 elemento2))elemento2))]
    )
  )

;;Pruebas
(check-expect(filtro arbol-g 'carmen 'ximena)(list 'ximena))
(check-expect(filtro arbol-g 'mark 'ximena)(list 'pedro 'carmen 'ximena))
(check-expect(filtro arbol-g 'pedro 'ximena)(list 'carmen 'ximena))
(check-expect(filtro arbol-g 'mark 'paul)(list 'pedro 'jack 'paul))
(check-expect(filtro arbol-g 'pedro 'tabitha)(list 'jack 'tabitha))
(check-expect(filtro arbol-g 'mark 'amanda)(list 'nancy 'celia 'amanda))
(check-expect(filtro arbol-g 'nancy 'piers)(list 'carlos 'piers))
(check-expect(filtro arbol-p 'oscar 'f)(list 'alicia 'ramiro 'hector 'f))
(check-expect(filtro arbol-p 'candida 'p)(list 'tomas 'p))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;DESCENDENCIA;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Contrato:
;;descendencia: symbol symbol lista -->lista

;;Proposito:
;;Esta funci0on resive un elemento1 un elemento2 y una lista (ambos elementos deben de ser symbolos y la lista no debe esatr vacia)
;;su funcionamiento consiste en validar las entradas que resive y si esta se cumplen hace un llamado
;;llamado a la funcion Filtro para sacar los elementos entre el elemento1 y el elemento2 y a la lista resultante le agrega el 
;;elemento1

;;Encabezado:
;;(define (descendencia elemento1 elemento2 arbol)
;;  (cond
;;     [(equal? (empty? arbol) true)...]
;;     [(equal?(and (symbol? elemento1) (symbol? elemento2)) false) ...] 
;;     [(equal?(validacion arbol elemento1)false) ...]
;;     [(equal?(validacion arbol elemento2)false) ...]
;;     [(equal?(validacion(buscar arbol elemento1) elemento2) false)...]
;;     [else ...]
;;    )
;;  )

;;Ejemplos
;;(descendencia "dorian" "mark" arbol-g);debe retornar:"Error de tipo del elemento1 o elemento2"
;;(descendencia 'oscar 'carmen arbol-g);debe retornar:"Elemento1 no encontrado en el arbol ingresado"
;;(descendencia 'mark 'p arbol-g);debe retornar:"Elemento2 no encontrado en el arbol ingresado"
;;(descendencia 'dorian 'mark arbol-g);debe retornar:"Elemento2 no encontrado en la descendencia del Elemento1"
;;(descendencia 'mark 'dorian arbol-g);debe retornar:(list 'mark 'pedro 'carmen 'dorian)

;;Cuerpo
(define (descendencia elemento1 elemento2 arbol)
  (cond
     [(equal? (empty? arbol) true)"Arbol vacio"]
     [(equal?(and (symbol? elemento1) (symbol? elemento2)) false) "Error de tipo del elemento1 o elemento2"] 
     [(equal?(validacion arbol elemento1)false) "Elemento1 no encontrado en el arbol ingresado"]
     [(equal?(validacion arbol elemento2)false) "Elemento2 no encontrado en el arbol ingresado"]
     [(equal?(validacion(buscar arbol elemento1) elemento2) false) "Elemento2 no encontrado en la descendencia del Elemento1"]
     [else (append (list elemento1)(filtro arbol elemento1 elemento2))]
    )
  )

;;Pruebas
(check-expect(descendencia 'mark 'dorian arbol-v)"Arbol vacio")
(check-expect(descendencia "dorian" "mark" arbol-g)"Error de tipo del elemento1 o elemento2")
(check-expect(descendencia 'oscar 'carmen arbol-g)"Elemento1 no encontrado en el arbol ingresado")
(check-expect(descendencia 'mark 'p arbol-g)"Elemento2 no encontrado en el arbol ingresado")
(check-expect(descendencia 'dorian 'mark arbol-g)"Elemento2 no encontrado en la descendencia del Elemento1")
(check-expect(descendencia 'mark 'dorian arbol-g)(list 'mark 'pedro 'carmen 'dorian))

(descendencia 'mark 'dorian arbol-g)
