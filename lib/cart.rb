class Cart
  attr_reader :shopping_basket

  def initialize
    @shopping_basket = []
  end

  def add(product)
    @shopping_basket << product
  end

  def print_content #взято у Александра Белышева
    @shopping_basket.uniq.each do |product|
      count = @shopping_basket.count(product)
      sum_by_prod = count * product.price

      puts "#{product}, Кол-во #{count}, Сумма #{sum_by_prod}руб."
    end
  end

end