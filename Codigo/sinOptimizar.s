; Jaime De La Peña Ramos
; Javier Servate Hernández

            ; Declaraciones
            .data

; Datos iniciales base

A:			.float		1.500000,	2.750000,	3.257000
			.float		21.002000,	2.658000,	2.157000
			.float		56.251000,	3.154000,	3.255000

B:			.float		3.500000,	3.500000,	2.500000
			.float		4.500000,	4.500000,	6.500000
			.float		5.500000,	1.500000,	2.500000

C:			.float		15.000000,	17.000000,	14.000000
			.float		17.000000,	15.000000,	17.000000
			.float		14.000000,	17.000000,	15.000000

Alpha: 		.float		1.235

M: 			.float		0.0,0.0,0.0
			.float		0.0,0.0,0.0
			.float		0.0,0.0,0.0

uno:		.byte 		1
			.text

            ; Codigo de las operaciones
			.global main

main:

;Cargamos los datos
            lf  f0,A
            lf  f1,A+4
            lf  f2,A+8
            lf  f3,A+12
            lf  f4,A+16
            lf  f5,A+20
            lf  f6,A+24
            lf  f7,A+28
            lf  f8,A+32

            lf  f9,B
            lf  f10,B+4
            lf  f11,B+8
            lf  f12,B+12
            lf  f13,B+16
            lf  f14,B+20
            lf  f15,B+24
            lf  f16,B+28
            lf  f17,B+32 

            lb  r1,uno

            ;A + B -> Fila 1
            addf f18, f0, f9
            addf f19, f1, f10
            addf f20, f2, f11

            ;A + B -> Fila 2
            addf f21, f3, f12
            addf f22, f4, f13
            addf f23, f5, f14

            ;A + B -> Fila 3
            addf f24, f6, f15
            addf f25, f7, f16
            addf f26, f8, f17



end:		trap 0
