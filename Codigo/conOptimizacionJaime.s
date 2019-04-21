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

;Cargamos las matrices
            
            lf  f0,A
            lf  f9,B
            lf  f4,A+16
            lf  f13,B+16
            addf f18, f0, f9
            addf f22, f4, f13
            lf  f1,A+4
            lf  f10,B+4
            multf f27, f18, f22
            
            
            lf  f5,A+20
            lf  f14,B+20
            lf  f3,A+12
            lf  f12,B+12
            addf f19, f1, f10
            addf f23, f5, f14
            lf  f7,A+28
            lf  f16,B+28
            multf f28, f19, f23

            
            lf  f8,A+32
            lf  f17,B+32
            lf  f6,A+24
            addf f26, f8, f17
            lf  f15,B+24
            multf f27, f27, f26
            addf f21, f3, f12
            addf f24, f6, f15
            addf f25, f7, f16
            multf f28, f28, f24
            multf f29, f21, f25
            lf  f2,A+8
            lf  f11,B+8
            addf f20, f2, f11
            addf f30, f27, f28         
            
            ;MEJORAR DESDE AQUI
            
            multf f29, f29, f20 
            addf f30, f30, f29


            multf f27, f20, f22
            multf f29, f23, f25
            multf f28, f19, f21
            multf f29, f29, f18
            
            multf f27, f27, f24
            subf f31, f31, f29
            multf f28, f28, f26


            subf f31, f31, f27
            
            subf f31, f31, f28
            
            
            addf f30, f30, f31

            ;Division 1 entre determinante

            lf f20, cero; Cargamos en el registro 20 el 0 para realizar la comprobacion

            lf   f22,unoFloat
            
            eqf f30, f20 ; Comprobamos si el determinante es 0
            bfpt end ; Finalizamos el programa si el determinante es 0
            
            divf f31, f22, f30
            
            ;Multiplicacion A por B PRIMERA FILA
            multf f18, f0, f9
            multf f19, f1, f12
            multf f20, f2, f15
            addf f18, f18, f19

            multf f21, f0, f10
            addf f18, f18, f20
            multf f22, f1, f13
            multf f23, f2, f16
            addf f19, f21, f22

            multf f24, f0, f11
            addf f19, f19, f23
            multf f25, f1, f14
            multf f26, f2, f17
            addf f20, f24, f25
            
            addf f20, f20, f26

            ;Multiplicacion A por B SEGUNDA FILA
            multf f21, f3, f9
            multf f22, f4, f12
            multf f23, f5, f15

            multf f24, f3, f10
            multf f25, f4, f13
            multf f26, f5, f16

            multf f27, f3, f11
            multf f28, f4, f14
            multf f29, f5, f17

            addf f21, f21, f22
            addf f21, f21, f23

            addf f22, f24, f25
            addf f22, f22, f26

            addf f23, f27, f28
            addf f23, f23, f29

            ;Multiplicacion A por B TERCERA FILA
            multf f24, f6, f9
            multf f25, f7, f12
            multf f26, f8, f15

            multf f27, f6, f10
            multf f28, f7, f13
            multf f29, f8, f16

            multf f30, f6, f11
            multf f0, f7, f14
            multf f1, f8, f17

            addf f24, f24, f25
            addf f24, f24, f26

            addf f25, f27, f28
            addf f25, f25, f29

            addf f26, f30, f0
            addf f26, f26, f1

            ;Multiplicacion de AxB por 1/Det[A+b]
            multf f18, f18, f31
            multf f19, f19, f31
            multf f20, f20, f31

            multf f21, f21, f31
            multf f22, f22, f31
            multf f23, f23, f31

            multf f24, f24, f31
            multf f25, f25, f31
            multf f26, f26, f31

            ;Cargar Matriz C
            lf  f0,C
            lf  f1,C+4
            lf  f2,C+8
            lf  f3,C+12
            lf  f4,C+16
            lf  f5,C+20
            lf  f6,C+24
            lf  f7,C+28
            lf  f8,C+32

            ;Cargar Alfa
            lf  f9,Alfa

            ;Multiplicar C por Alfa
            multf f0, f0, f9
            multf f1, f1, f9
            multf f2, f2, f9

            multf f3, f3, f9
            multf f4, f4, f9
            multf f5, f5, f9

            multf f6, f6, f9
            multf f7, f7, f9
            multf f8, f8, f9

            ;Sumar Matrices Resultantes
            addf f0, f0, f18
            addf f1, f1, f19
            addf f2, f2, f20

            addf f3, f3, f21
            addf f4, f4, f22
            addf f5, f5, f23

            addf f6, f6, f24
            addf f7, f7, f25
            addf f8, f8, f26

            ;Cargamos en M y almacenamos en el la suma de las matrices Resultantes
            sf M, f0
            sf M+4, f1
            sf M+8, f1
            sf M+12, f1
            sf M+16, f1
            sf M+20, f1
            sf M+24, f1
            sf M+28, f1
            sf M+32, f1

end:        trap 0
