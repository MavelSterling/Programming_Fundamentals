;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname estudiante) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;ANALISIS Y DEFINICION DE DATOS:
(define-struct estudiante (cod plan nom ap doc))
;;Un estudiante representa a un estudiante de Univalle, con sus datos más importantes.

;;Tipo de dato estudiante
;;cod: representa el codigo estudiantil, numero
;;plan: codigo de plan del estudiante, numero
;;nom: nombre del estudiante, texto
;;ap: apellido del estudiante, texto
;;doc: documento de identidad nacional, texto


(define pepe (make-estudiante 1612345 2711 'Pepe 'Perez 99123456))

(define ana (make-estudiante 1478945 2711 'Ana 'Cleta 11123456789))

(estudiante-doc ana)
(estudiante-ap ana)

(estudiante-ap pepe)

(estudiante? 'hola)
(estudiante? 'estudiante)
(estudiante? 'estudiante)
(estudiante? 'ana)
(estudiante? ana)
(estudiante? (make-estudiante 1478523 3743 'Maria 'Perez 7532416))
