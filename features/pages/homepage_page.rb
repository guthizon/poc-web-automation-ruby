class HomePage < SitePrism::Page

    # include RSpec::Matchers

    element :search_item, "#search_query_top"
    element :search_button, "button[name='submit_search']"
    element :product_name, "h5[itemprop='name']"
    element :product_price, ".product-price"
    element :product_image, "//*[@src='http://automationpractice.com/img/p/1/1-home_default.jpg']"

    def pesquisar_produto produto
        search_item.set produto
        search_button.click
    end

    def verificar_informacoes_produto
        expect(product_name).to exist
        expect(product_image).to exist
        expect(product_price.text).to include '16.51'

    end

    def product_image
        product_image
    end
end