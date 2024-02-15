When('acesso a página principal da Starbugs') do
    visit 'https://starbugs.vercel.app/'
end

Then('eu devo ver uma lista de cafés disponíveis') do
    products = all('.coffee-item')
    expect(products.size).to be > 0
end

Given('que estou na página principal da Starbugs') do
    visit 'https://starbugs.vercel.app/'
end

#DATA TABLE
Given('desejo comprar o seguinte produto:') do |table|
    @product_name = table.hashes[0][:product]
    @product_price = table.hashes[0][:price]
    @delivery_price = table.hashes[0][:delivery]
end
   
When('inicio a compra do item') do
    product = find('.coffee-item', text: @product_name)
    product.find('.buy-coffee').click
end
  
Then('devo ver a página de Checkout com os detalhes do produto') do
    productTitle = find('.item-details h1')
    expect(productTitle.text).to eql @product_name

    productPrice = find('.subtotal .sub-price')
    expect(productPrice.text).to eql @product_price

    deliveryPrice = find('.delivery-price')
    expect(deliveryPrice.text).to eql @delivery_price
end
  
Then('o valor total da compra deve ser de {string}') do |total_price|
    price = find('.total-price')
    expect(price.text).to eql total_price
end
  
Then('devo ver um popup dizendo que o produto está indisponivel') do
    responseText = find('.swal2-html-container')
    expect(responseText.text).to eql 'Produto indisponível'
end