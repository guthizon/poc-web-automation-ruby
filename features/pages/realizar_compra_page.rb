class RealizarCompraPage < SitePrism::Page

    include RSpec::Matchers

    element :button_add_to_cart, "button[name='Submit']"
    element :button_proceed_shipping, "button[name='processAddress']"
    element :button_proceed_carrier, "button[name='processCarrier']"
    @@button_proceed_checkout = 'Proceed to checkout'
    element :login, '#email'
    element :password, '#passwd'
    element :button_login, '#SubmitLogin'
    element :agree_terms, '#uniform-cgv'
    @@button_payment_check = '.cheque'
    @@button_confirm_order = '//*[contains(text(),"I confirm my order")]'
    @@message_sucess_order = '//*[@class="alert alert-success"]'
    @@select_product = "//*[@src='http://automationpractice.com/img/p/1/1-home_default.jpg']"

    def pesquisar_produto produto
        search_item.set produto
        search_button.click
    end

    def verificar_informacoes_produto
        expect(product_name).to exist
        expect(product_image).to exist
        expect(product_price.text).to include '16.51'
    end

    def adicionar_produto_ao_carrinho
        find(:xpath, @@select_product).click
        button_add_to_cart.click
        find("a", :text => @@button_proceed_checkout).click
        expect(page).to have_current_path('http://automationpractice.com/index.php?controller=order', url:true)
        find("a", :text => @@button_proceed_checkout).click
    end

    def realizar_login_conta
        login.set 'gthizon@gmail.com'
        password.set 'kamila'
        button_login.click
    end

    def finalizar_compra
        button_proceed_shipping.click
        agree_terms.click
        button_proceed_carrier.click
        find(@@button_payment_check).click
        find(:xpath, @@button_confirm_order).click
    end
    
    def verificar_sucesso_compra mensagem
        expect(find(:xpath, @@message_sucess_order).text).to include mensagem
    end


end