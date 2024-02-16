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
        price = find('.total-price')
        expect(price.text).to eql price
    end

    def find_zipcode(zipcode)
        find('input[name=cep]').set(zipcode)
        click_on 'Buscar CEP'
    end

    def fill_adress(address)
        find('input[name=number]').set(address[:Numero])
        find('input[name=complement]').set(address[:Complemento])
    end
end