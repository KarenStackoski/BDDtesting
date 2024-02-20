require 'rspec'

class CheckoutPage
    include Capybara::DSL
    include RSpec::Matchers

    def assert_product_details(product)
        productTitle = find('.item-details h1')
        expect(productTitle.text).to eql product[:name]

        productPrice = find('.subtotal .sub-price')
        expect(productPrice.text).to eql product[:price]

        deliveryPrice = find('.delivery-price')
        expect(deliveryPrice.text).to eql product[:delivery]
    end

    def assert_total_price(price)
        price_element = find('.total-price')
        actual_price = price_element.text
        expect(actual_price).to eql price
    end

    def find_zipcode(zipcode)
        find('input[name=cep]').set(zipcode)
        click_on 'Buscar CEP'
    end

    def fill_adress(address)
        find('input[name=number]').set(address[:Numero])
        find('input[name=complement]').set(address[:Complemento])
    end

    def choice_payment_type(payment_type)
        find('label div', text: payment_type.upcase).click
    end

    def submit
        click_on "Confirmar pedido"
    end

    def set_cupom(cupom_code)
        find('input[placeholder="Código do cupom"]').set(cupom_code)
        click_on "Aplicar"
    end

    def notify(text)
        notice = find('.notice').text
        expect(notice).to eql text
    end
end