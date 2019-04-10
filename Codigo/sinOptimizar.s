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

            lf  f6,B
            lf  f7,B+4
            lf  f8,B+8
            lf  f9,B+12
            lf  f10,B+16
            lf  f11,B+20

            lf  f12,C
            lf  f13,C+4
            lf  f14,C+8
            lf  f15,C+12
            lf  f16,C+16
            lf  f17,C+20

            lf  f18,alpha

            lb  r1,uno

end:		trap 0
