#language: pt

@test
Funcionalidade: Consultar Produto

    Como cliente da loja Automation, 
    desejo poder consultar o produto que eu quiser,
    de modo que quando eu clicar em buscar, retorne as informações do produto em questão.

    Cenario: Consultar Produto
        Dado que acesso o sistema
        Quando busco o produto "Faded Short Sleeve"
        Então deve apresentar as informações do produto pesquisado