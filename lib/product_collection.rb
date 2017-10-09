class ProductCollection
  attr_reader :film_files, :products

  def initialize(film_files, book_files, cd_files)
    @film_files = film_files
    @book_files = book_files
    @cd_files = cd_files
  end

  def self.from_dir(dir)
    film_files = Dir.glob("#{dir}/films/*.txt")
    book_files = Dir.glob("#{dir}/books/*.txt")
    cd_files = Dir.glob("#{dir}/cd/*.txt")
    self.new(film_files, book_files, cd_files)
  end

  def to_a
    @products = []
    @film_files.each do |file_name|
      @products << Film.from_file(file_name)
    end
    @book_files.each do |file_name|
      @products << Book.from_file(file_name)
    end
    @cd_files.each do |file_name|
      @products << CD.from_file(file_name)
    end
    @products
  end

  def show_list
    products.each_with_index do |product, index|
      puts "#{index + 1}. #{product} Осталось(#{product.amount})"
    end
  end

  def delete_product(product)
    @products.delete(product)
  end

  def empty?
    @products.empty?
  end

  def sort_by_price
    to_a.sort! do |x, y|
      x.price <=> y.price
    end
  end

  def sort_by_price_in_reverse
    to_a.sort! do |x, y|
      y.price <=> x.price
    end
  end

  def sort_by_amount
    to_a.sort! do |x, y|
      x.amount <=> y.amount
    end
  end

  def sort_by_amount_in_reverse
    to_a.sort! do |x, y|
      y.amount <=> x.amount
    end
  end

  def sort_by_title
    to_a.sort! do |x, y|
      x.title <=> y.title
    end
  end

  def sort_by_title_in_reverse
    to_a.sort! do |x, y|
      y.title <=> x.title
    end
  end
end