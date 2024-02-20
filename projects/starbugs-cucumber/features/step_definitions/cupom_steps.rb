Given('que iniciei a compra do item:') do |table|
    @product = table.rows_hash

    @home.open
    @home.buy(@product['name'])
end
  
When('aplico o cupom: {string}') do |cupom_code|
    @checkout.set_cupom(cupom_code)
end
  
Then('o valor final deve ser atualizado para: {string}') do |final_price|
    @checkout.assert_total_price(final_price)
end

Then('deve haver a seguinte notificação: {string}') do |text|
    @checkout.notify(text)
end
  
Then('o valor final deve permanecer o mesmo') do
    @checkout.assert_total_price(@product[:total])
end