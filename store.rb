if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
current_path = File.dirname(__FILE__)

require_relative current_path + '/lib/product.rb'
require_relative current_path + '/lib/book.rb'
require_relative current_path + '/lib/film.rb'
require_relative current_path + '/lib/cd.rb'
require_relative current_path + '/lib/product_collection.rb'

total_value = 0

collection = ProductCollection.from_dir('data')
collection.to_a

puts greetings = 'Добро пожаловать в наш магазин!'

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
    puts "Вы выбрали #{selected_product}"
    total_value += selected_product.buy
    puts shopping_basket = "Всего товаров на сумму #{total_value} руб."
  end
end

puts valediction = "С Вас - #{total_value} руб. Спасибо за покупки!"


