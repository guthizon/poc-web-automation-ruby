Dir[File.join(File.dirname(__FILE__), "..pages/*_page.rb")].each {|file| require file}

module Pages
    def homepage
        @homepage ||= HomePage.new
    end

    def tela_compra
        @compras ||= RealizarCompraPage.new
    end
end