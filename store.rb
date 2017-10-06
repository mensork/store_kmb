if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'
require_relative 'lib/cd'
require_relative 'lib/product_collection'
require_relative 'lib/product_in_cart'
require_relative 'lib/cart'

total_value = 0

collection = ProductCollection.from_dir('data')
collection.to_a
cart = Cart.new
system "cls"
puts 'Добро пожаловать в наш магазин!'

choice = nil
until choice == 'x' do
  puts
  puts 'Что хотите купить?'
  collection.show_list
  puts 'x. Выход'
  choice = STDIN.gets.chomp

  if (1..collection.products.size).include?(choice.to_i)
    selected_product = collection.products[choice.to_i - 1]
    puts
    cart.add(selected_product)
    total_value += selected_product.buy
    puts
    puts 'В корзине:'
    puts cart.shopping_basket
    puts
    puts "Всего товаров на сумму #{total_value} руб."
  end
end
puts 'Вы купили:'
puts cart.shopping_basket
puts "С Вас - #{total_value} руб. Спасибо за покупки!"


