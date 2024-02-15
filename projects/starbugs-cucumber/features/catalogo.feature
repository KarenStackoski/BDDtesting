Feature: Catálogo de cafés
    Como um usuário do site da Starbugs, eu quero ver o catálogo de cafés na página principal
    Para que eu possa escolher e saber mais sobre os produtos disponíveis

Scenario: Acessar o catálogo de cafés na página principal

    When acesso a página principal da Starbugs
    Then eu devo ver uma lista de cafés disponíveis

@temp
Scenario: Iniciar a compra de um café

    Given que estou na página principal da Starbugs
        And desejo comprar o seguinte produto:
        | product         | price   | delivery |
        | Expresso Gelado | R$ 9,99 | R$ 10,00 |        
    When inicio a compra do item
    Then devo ver a página de Checkout com os detalhes do produto 
        And o valor total da compra deve ser de "R$ 19,99"

Scenario: Café indisponível

    Given que estou na página principal da Starbugs
        And desejo comprar o café "Expresso Cremoso"
    When inicio a compra do item
    Then devo ver um popup dizendo que o produto está indisponivel