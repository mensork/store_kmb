class Cart
  attr_reader :shopping_basket

  def initialize
    @shopping_basket = []
  end

  def add(product)
    chosen_product = ProductInCart.new(product)
    if product.amount == 0
    elsif in_basket?(chosen_product) == true
      @shopping_basket.each do |item|
        item.amount += 1 if chosen_product.title == item.title
      end
    else
      @shopping_basket << chosen_product
    end
  end

  def in_basket?(chosen_product)
    @shopping_basket.each do |item|
      return true if chosen_product.title == item.title
    end
  end

end