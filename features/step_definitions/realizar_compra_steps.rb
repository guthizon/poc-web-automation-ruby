@@tela_compra = RealizarCompraPage.new

Quando('clico para adicionar ao carrinho') do
    @@tela_compra.adicionar_produto_ao_carrinho
end

E('realizo o login na conta cadastrada') do
    @@tela_compra.realizar_login_conta
end
  
E('finalizo a compra') do
    @@tela_compra.finalizar_compra
end
  
Então('deve ser apresentada a mensagem {string}') do |mensagem|
    @@tela_compra.verificar_sucesso_compra mensagem
end