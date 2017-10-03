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

products = []


movie = Film.new(price: 500, amount: 10, title: 'Леон', director: 'Люк Бессон', year: '1995')
products << movie
book = Book.new(price: 790, amount: 8, title: 'Идиот', author: 'Достоевский Ф.М.', genre: 'роман')
products << book


book.update(amount: 12, title: 'Не такой уж и идиот')

puts book