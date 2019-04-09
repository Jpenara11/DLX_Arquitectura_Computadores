; Jaime De La Peña Ramos
; Javier Servate Hernández

            .data
; Datos iniciales base

A:			.float		1.500000,	2.750000,	3.257000
			.float		21.002000,	2.658000,	2.157000
			.float		56.251000,	3.154000,	3.255000

B:			.float		3.500000,	3.500000,	2.500000
			.float		4.500000,	4.500000,	6.500000
			.float		5.500000,	1.500000,	2.500000

C:			.float		15.000000,	17.000000,	14.000000,
			.float		17.000000,	15.000000,	17.000000,
			.float		14.000000,	17.000000,	15.000000,

Alpha: 		.float		1.235

M: 			.float		0.0,0.0,0.0
			.float		0.0,0.0,0.0
			.float		0.0,0.0,0.0

uno:		.float 		1
cero:		.float 		0
menosuno:		.float		-1


			.text
; Codigo de las operaciones

			.global main
main:
			
			; Poner aqui todo el codigo

end:		trap 0
