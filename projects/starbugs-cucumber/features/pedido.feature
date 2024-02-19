Feature: Pedidos
    Como um usuário da Starbugs, eu espero realizar o pedido no meu café e recebê-lo em meu endereço

    Scenario: compra bem sucedida
        Given que estou na página principal da Starbugs
            And iniciei a compra do item "Expresso Tradicional"
        When faco a busca do seguinte cep: "04534011"
            And informo os demais dados do endereço:
                | Numero      | 1000    |
                | Complemento | Apto 22 |
            And escolho a forma de pagamento "Cartão de Débito"
            And finalizo a compra
        Then sou redirecionado para a página de confirmação de pedido
            And deve ser informado o seguinte prazo de entrega: "20 min - 30 min"