#language: pt

Funcionalidade: Realizar Compra

    Como cliente da loja Automation,
    desejo poder consultar o produto que eu quiser,
    de modo que quando eu consiga adicionar o produto ao carrinho e realizar a compra.

    Cenario: Realizar Compra
        Dado que acesso o sistema
        Quando busco o produto "Faded Short Sleeve"
        Então deve apresentar as informações do produto pesquisado
        Quando clico para adicionar ao carrinho
        E realizo o login na conta cadastrada
        E finalizo a compra
        Então deve ser apresentada a mensagem "Your order on My Store is complete"