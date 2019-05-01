; Jaime De La Peña Ramos
; Javier Servate Hernández

            ; Declaraciones
            .data

; Datos iniciales base

A:          .float      1.500000,   2.750000,   3.257000
            .float      21.002000,  2.658000,   2.157000
            .float      56.251000,  3.154000,   3.255000

B:          .float      3.500000,   3.500000,   2.500000
            .float      4.500000,   4.500000,   6.500000
            .float      5.500000,   1.500000,   2.500000

C:          .float      15.000000,  17.000000,  14.000000
            .float      17.000000,  15.000000,  17.000000
            .float      14.000000,  17.000000,  15.000000

Alfa:      .float      1.235

M:          .float      0.0,  0.0,   0.0
            .float      0.0,  0.0,   0.0
            .float      0.0,  0.0,   0.0

cero:       .float       0.0
unoFloat:   .float       1.0

            .text

            ; Codigo de las operaciones
            .global main

main:

            ;SUMA MATRICES A + B Y CALCULO DETERMINANTE POR LAPLACE
            lf  f4,A+16
            lf  f13,B+16
            lf  f8,A+32
            addf f22, f4, f13; a22
						multf f29, f4, f13 ; EMPIEZA LAS OPERACIONES DE MULTIPLICACION A X B
            lf  f17,B+32
            lf  f5,A+20
						lf  f14,B+20
            addf f26, f8, f17 ; a33     
            lf  f7,A+28
            addf f23, f5, f14 ; a23
            multf f27, f22, f26 ; a22 x a33
            lf  f3,A+12
            lf  f16,B+28
            lf  f12,B+12
            addf f25, f7, f16 ; a32
            lf  f15,B+24
            multf f28, f23, f25 ; a23 x a32
					  lf  f6,A+24
            addf f21, f3, f12 ; a21
            lf  f0,A   
            multf f30, f21, f26 ; a21 x a33
						lf  f9,B
            addf f24, f6, f15 ; a31
            lf  f1,A+4
						multf f18, f0, f9 ; EMPIEZA LAS OPERACIONES DE MULTIPLICACION A X B
            lf  f10,B+4
            subf f27, f27, f28 ; a22 x a33 - a23 x a32
            multf f31, f23, f24 ; a23 x a31
            addf f26, f0, f9 ; a11
            lf  f2,A+8
            multf f26, f26, f27 ; PRIMER MENOR
            lf  f11,B+8
            
            addf f19, f1, f10 ; a12

            multf f21, f21, f25 ; a21 x a32
            subf f23, f30, f31 ; a21 x a33 - a23 x a31

            multf f22, f22, f24 ; a22 x a31
            addf f20, f2, f11 ; a13
            
            multf f19, f19, f23 ; SEGUNDO MENOR
            subf f24, f21, f22 ;  a21 x a32 - a22 x a31

            multf f20, f20, f24 ; TERCER MENOR

            subf f26, f26, f19 ; PRIMER MENOR - SEGUNDO MENOR

            lf f30, cero ; Cargar el 0
            lf f31, unoFloat; Cargar el 1

            
						multf f19, f1, f12 ; EMPIEZA LAS OPERACIONES DE MULTIPLICACION A X B
            addf f26, f26, f20 ; (PRIMER MENOR - SEGUNDO MENOR) + TERCER MENOR


            ;Division 1 entre determinante

            multf f22, f1, f13

            eqf f26, f30 ; Comprobamos si el determinante es 0
            bfpt end ; Finalizamos el programa si el determinante es 0
            
            
            divf f31, f31, f26 ; Division 1 / det A + B
            
            ; OPERACIONES DE MULTIPLICACION A X B
            
            multf f20, f2, f15
            addf f18, f18, f19
            multf f21, f0, f10
            addf f18, f18, f20


            
            multf f23, f2, f16
            addf f19, f21, f22
            multf f24, f0, f11
            addf f19, f19, f23
            multf f25, f1, f14
            multf f26, f2, f17
            addf f20, f24, f25
            multf f21, f3, f9 ; MULTIPLICACION A X B SEGUNDA FILA
            addf f20, f20, f26
            
            

            ;Multiplicacion A por B SEGUNDA FILA
            
            multf f22, f4, f12
            multf f23, f5, f15
            addf f21, f21, f22

            multf f24, f3, f10
            
            addf f21, f21, f23
            multf f26, f5, f16
            addf f22, f24, f29
            
            
            multf f29, f5, f17
            addf f22, f22, f26
            multf f27, f3, f11
            addf f23, f23, f29
            multf f28, f4, f14
            multf f24, f6, f9 ;Multiplicacion A x B TERCERA FILA
            addf f23, f27, f28
            

            ;Multiplicacion A por B TERCERA FILA

            
            multf f25, f7, f12
            multf f26, f8, f15
            addf f24, f24, f25
            

            multf f27, f6, f10
            multf f28, f7, f13
            addf f24, f24, f26
            multf f29, f8, f16
            addf f25, f27, f28

            multf f30, f6, f11
            addf f25, f25, f29
            multf f1, f8, f17
            multf f0, f7, f14
            addf f26, f30, f1
            multf f18, f18, f31 ;Multiplicacion de AxB por 1/Det[A+b]
            addf f26, f26, f0
            

            ;Multiplicacion de AxB por 1/Det[A+b]
            multf f19, f19, f31
            multf f20, f20, f31
            lf  f9,Alfa
            lf  f0,C
            multf f21, f21, f31
            multf f22, f22, f31
            lf  f1,C+4
            lf  f2,C+8
            multf f23, f23, f31
            multf f24, f24, f31
            lf  f3,C+12
            lf  f4,C+16
            multf f25, f25, f31
            multf f26, f26, f31
            lf  f5,C+20
            lf  f6,C+24
            multf f0, f0, f9 ;Multiplicar C por Alfa
            multf f1, f1, f9 ;Multiplicar C por Alfa
            lf  f7,C+28
            lf  f8,C+32
            
            ;Multiplicar C por Alfa
            multf f2, f2, f9
            
            addf f0, f0, f18
            
            sf M, f0
            addf f1, f1, f19
            
            
            multf f3, f3, f9
            addf f2, f2, f20
            multf f4, f4, f9
            sf M+4, f1
            addf f3, f3, f21
            sf M+8, f2

            multf f5, f5, f9
            addf f4, f4, f22
            multf f6, f6, f9
            sf M+12, f3
            addf f5, f5, f23
            sf M+16, f4
            
            multf f7, f7, f9
            sf M+20, f5
            addf f6, f6, f24
            multf f8, f8, f9
            addf f7, f7, f25
            sf M+24, f6
            sf M+28, f7
            addf f8, f8, f26
            sf M+32, f8

end:        trap 0     
