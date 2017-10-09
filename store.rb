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
require_relative 'lib/cart'

total_value = 0

collection = ProductCollection.from_dir('data')
collection.to_a
cart = Cart.new
system 'cls'
puts 'Добро пожаловать в наш магазин!'

choice = nil
until choice == 0 do
  puts
  puts 'Что хотите купить?'
  collection.show_list
  puts '0. Выход'
  choice = STDIN.gets.to_i

  if (1..collection.products.size).include?(choice)
    selected_product = collection.products[choice - 1]

    puts
    cart.add(selected_product)
    total_value += selected_product.buy
    puts 'Товар добавлен в корзину!'

    collection.delete_product(selected_product) if selected_product.amount == 0 #взято у Александра Белышева
    break if collection.empty? #взято у Александра Белышева

    puts
    puts 'В корзине:'
    cart.print_content

    puts
    puts "Всего товаров на сумму #{total_value} руб."

  else
    puts 'Такого номера нет в списке'
  end
end
puts
puts 'Вы купили:'
cart.print_content
puts "С Вас - #{total_value} руб. Спасибо за покупки!"


