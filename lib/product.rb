class Product
  attr_accessor :price, :amount

  def initialize(params)
    @price = params[:price]
    @amount = params[:amount]
  end

  def to_s
    "Цена: #{price}руб. Осталось(#{amount})"
  end

  def update(params)
    @price = params[:price] if params[:price]
    @amount = params[:amount] if params[:amount]
  end

  def self.from_file(file_name)
    raise NotImplementedError
  end

  def buy
    if amount == 0
      puts 'Товар закончился!'
      0
    else
      puts 'Товар в корзине!'
      self.amount -= 1
      price
    end
  end
end

