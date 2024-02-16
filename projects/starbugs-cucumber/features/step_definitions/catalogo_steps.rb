When('acesso a página principal da Starbugs') do
    @home.open
end

Then('eu devo ver uma lista de cafés disponíveis') do
    expect(@home.coffees.size).to be > 0
end

Given('que estou na página principal da Starbugs') do
    visit 'https://starbugs.vercel.app/'
end

#DATA TABLE
Given('desejo comprar o seguinte produto:') do |table|
    @product = table.rows_hash
end
   
When('inicio a compra do item') do
    @home.buy(@product[:name])
end
  
Then('devo ver a página de Checkout com os detalhes do produto') do
    @checkout.assert_product_details(@product)
end
  
Then('o valor total da compra deve ser de {string}') do |total_price|
    @checkout.assert_total_price(total_price)
end
  
Then('devo ver um popup dizendo que o produto está indisponivel') do
    @components.have_text('Produto indisponível')
end