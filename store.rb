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

book = Book.from_file(current_path + '/data/books/01.txt')
film = Film.from_file(current_path + '/data/films/01.txt')

begin
  prod = Product.from_file(current_path + '/data/films/01.txt')
rescue NotImplementedError => error
  puts error.message
end
puts book
puts film



=begin
choice = nil
until (1..(Product.types.size + 1)).include?(choice)
  puts 'Выберете из списка, какой товар добавить в магазин'
  Product.types.each_with_index do |item, index|
    puts "#{index + 1}. #{item}"
  end
  choice = STDIN.gets.to_i
end

product = Post.create(choice - 1)
=end