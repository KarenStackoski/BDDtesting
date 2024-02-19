Given('iniciei a compra do item {string}') do |product_name|
    @home.buy(product_name)
end
  
When('faco a busca do seguinte cep: {string}') do |zipcode|
    @checkout.find_zipcode(zipcode)
end
  
When('informo os demais dados do endereço:') do |table|
    @checkout.fill_adress(table.rows_hash)
end
  
When('escolho a forma de pagamento {string}') do |payment_type|
    @checkout.choice_payment_type(payment_type)
end
  
When('finalizo a compra') do
    @checkout.submit
end
  
Then('sou redirecionado para a página de confirmação de pedido') do
    @order.assert_order
end
  
Then('deve ser informado o seguinte prazo de entrega: {string}') do |delivery_time|
    @order.assert_delivery_time(delivery_time)
end