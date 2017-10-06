class ProductInCart
  attr_accessor :price, :amount, :title, :author, :director, :year, :genre, :director, :product

  def initialize(product)
    @amount = 1
    @price = product.price
    @title = product.title
    if product.class.name == 'Film'
      @class = 'Film'
      @director = product.director
      @year = product.year

    elsif  product.class.name == 'Book'
      @class = 'Book'
      @author = product.author
      @genre = product.genre

    elsif  product.class.name == 'CD'
      @class = 'CD'
      @year = product.year
      @genre = product.genre
      @author = product.author
    end
  end

  def to_s
    price_and_amount = "Цена: #{price}руб. Шт.#{amount}"
    if @class == 'Film'
      "Фильм '#{title}'(#{year}), режиссёр - #{director}. #{price_and_amount}"
    elsif @class == 'Book'
      "Книга '#{title}', #{genre}, автор - #{author}. #{price_and_amount}"
    elsif @class == 'CD'
      "Альбом #{author} - '#{title}'(#{year}), #{genre}. #{price_and_amount}"
    end
  end


end

