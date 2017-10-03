if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
current_path = File.dirname(__FILE__)
require_relative current_path + '/lib/product.rb'
require_relative current_path +  '/lib/book.rb'
require_relative current_path + '/lib/movie.rb'

