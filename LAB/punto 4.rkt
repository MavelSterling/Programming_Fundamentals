; NOMBRES: Mavelyn Sterling, Sebastian Potes Blandon

; PLAN: 3743, 2711


;Contrato:  pul:numb pie:numb yar:numb ro:numb mi:numb -> numb
;Proposito: Escribir un programa en el cual desarrolle las funciones para conversiones de medidas
;Encabezado:(define (pul_cm pul)...)
;Ejemplo: (pul_cm 2) debe dar 5.08
;Cuerpo:
   (define (pul_cm pul) (* pul 2.54))
   (define (pie_pul pie) (* pie 12))
   (define (yar_pie yar) (* yar 3))
   (define (ro_yar ro) (* ro 5.5))
   (define (mi_ro mi) (* mi 320))

   (define (pie_cm pie) (pul_cm (pie_pul pie)))
   (define (yar_cm yar) (pul_cm (pie_pul (yar_pie yar))))
   (define (ro_pul ro) (pie_pul (yar_pie (ro_yar ro))))
   (define (mi_pie mi) (yar_pie (ro_yar (mi_ro mi))))
;Pruebas:
(pul_cm 2)
(pie_pul 3)
(yar_pie 4)
(ro_yar 3)
(mi_ro 2)
(pie_cm 2)
(yar_cm 1)
(ro_pul 1)
(mi_pie 1)


