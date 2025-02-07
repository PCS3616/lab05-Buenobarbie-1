; Variáveis e constantes
        @ /100
X       K /0
Y       K /0
Z       K /0        ; Z = X + Y
ZCONV   K /0
CONV    K /3030     ; Para converter dígitos ASCII
_256    K /0100     ; Para pegar o byte menos significativo
_10     K =10       ; Para verificar carry decimal

; Programa principal
        @  /000
        GD /000     ; Lê X
        SB CONV
        MM X
        GD /000     ; Lê dois espaços
        GD /000     ; Lê Y
        SB CONV
        MM Y
        ; Lê X e Y do teclado, convertendo o ASCII
        ; Aqui, AC = Y

        AD X
        MM Z
        ; Z = X + Y (precisamos checar se teve carry decimal)

        ML _256
        DV _256
        SB _10
        JN IMPRIME
        ; Isola o byte menos significativo e verifica se temos carry decimal

        ; Se chegar aqui, tivemos carry decimal
        LD Z
        SB _10
        AD _256
        MM Z

        ; Converte Z para ASCII e imprime no monitor
IMPRIME LD Z
        AD CONV
        MM ZCONV
        PD /100
        HM /000
