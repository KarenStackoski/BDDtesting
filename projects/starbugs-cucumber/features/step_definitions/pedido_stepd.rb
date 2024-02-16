Given('iniciei a compra do item {string}') do |product_name|
    @home.buy(product_name)
end
  
When('faco a busca do seguinte cep: {string}') do |zipcode|
    @checkout.find_zipcode(zipcode)
end
  
When('informo os demais dados do endereço:') do |table|
    @checkout.fill_adress(table.rows_hash)
end
  
When('escolho a forma de pagamento {string}') do |string|
    pending # Write code here that turns the phrase above into concrete actions
end
  
When('finalizo a compra') do
    pending # Write code here that turns the phrase above into concrete actions
end
  
Then('sou redirecionado para a página de confirmação de pedido') do
    pending # Write code here that turns the phrase above into concrete actions
end
  
Then('deve ser informado um prazo de entrega entre {int} e {int} minutos') do |int, int2|
  # Then('deve ser informado um prazo de entrega entre {int} e {float} minutos') do |int, float|
  # Then('deve ser informado um prazo de entrega entre {float} e {int} minutos') do |float, int|
  # Then('deve ser informado um prazo de entrega entre {float} e {float} minutos') do |float, float2|
    pending # Write code here that turns the phrase above into concrete actions
end