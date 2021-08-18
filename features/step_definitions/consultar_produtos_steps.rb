$item = ''

Dado('que acesso o sistema') do
    visit '/'
end

Quando('busco o produto {string}') do |produto|
    homepage.pesquisar_produto produto
    $item = produto
end

Então('deve apresentar as informações do produto pesquisado') do
    page.find(:xpath, "//*[@src='http://automationpractice.com/img/p/1/1-home_default.jpg']")
    expect(homepage.product_name.text).to include $item
    expect(homepage.product_price.text).to include '16.51'
end
