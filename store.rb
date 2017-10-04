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
require_relative current_path + '/lib/product_collection.rb'

collection = ProductCollection.from_dir('data')




# choice = nil
# until (1..(Product.types.size + 1)).include?(choice)
#   puts 'Выберете из списка, какой товар добавить в магазин'
#   Product.types.each_with_index do |item, index|
#     puts "#{index + 1}. #{item}"
#   end
#   choice = STDIN.gets.to_i
# end
#
# product = Post.create(choice - 1)
