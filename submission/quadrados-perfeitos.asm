; Constantes e variáveis
        @ /200
_1      K =1
_2      K =2
STOP_N  K =64       ; Quantidade de loops
N       K =0        ; Variável N da equação

; Área de memória onde vamos guardar os resultados.
; Endereço  | Valor
; 0x100     | 0^2
; 0x102     | 1^2
; 0x104     | 2^2
;       ...
; 0x1??     | 63^2
            @ /100
MEM_ANTERIOR K =0
MEM_ATUAL    K =0

; Programa principal
        @ /000
LOOP    LD MEM_ANTERIOR
        AD N
        AD N
        AD _1
        ; AC += 2*N + 1

SALVA   MM MEM_ATUAL

        LD SALVA
        AD _2
        MM SALVA
        ; SALVA += 2
        ; i.e., modifica instrução SALVA para apontar para
        ; próxima palavra da memória

        LD LOOP
        AD _2
        MM LOOP
        ; LOOP += 2
        ; i.e., modifica instrução LOOP para apontar para
        ; próxima palavra da memória

        LD N
        AD _1
        MM N
        ; N += 1

        SB STOP_N
        JZ EXIT
        JP LOOP
        ; se N == STOP_N sai do loop

EXIT   HM /000
