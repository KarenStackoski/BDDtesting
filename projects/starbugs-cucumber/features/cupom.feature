Feature: Uso de Cupons
    Testando a implementação de uso de cupons de desconto

    Scenario: Aplicar desconto de 20%
        Given que iniciei a compra do item:
            | name    | Café com Leite|
            | price   | R$ 19,99      |
            | delivery| R$ 10,00      |
            | total   | R$ 29,99      |
        When aplico o cupom: "MEUCAFE"
        Then o valor final deve ser atualizado para: "R$ 25,99"

    Scenario: Cupom expirado
        Given que iniciei a compra do item:
            | name    | Café com Leite|
            | price   | R$ 19,99      |
            | delivery| R$ 10,00      |
            | total   | R$ 29,99      |
        When aplico o cupom: "PROMO20"
        Then deve haver a seguinte notificação: "Cupom expirado!"
            And o valor final deve permanecer o mesmo
    
    Scenario: Cupom inválido
        Given que iniciei a compra do item:
            | name    | Café com Leite|
            | price   | R$ 19,99      |
            | delivery| R$ 10,00      |
            | total   | R$ 29,99      |
        When aplico o cupom: "PROMO100"
        Then deve haver a seguinte notificação: "Cupom inválido!"
            And o valor final deve permanecer o mesmo
