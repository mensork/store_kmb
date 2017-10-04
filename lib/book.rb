class Book < Product
  attr_accessor :title, :author, :genre, :price, :amount

  def initialize(params)
    super
    @title = params[:title]
    @author = params[:author]
    @genre = params[:genre]
  end

  def to_s
    "Книга '#{title}', #{genre}, автор - #{author}. #{super}"
  end

  def update(params)
    super
    @title = params[:title] if params[:title]
    @author = params[:author] if params[:author]
    @genre = params[:genre] if params[:genre]
  end

  def self.from_file(file_name)
    self.new(set_param(file_name))
  end

  def self.set_param(file_name)
    array = File.readlines(file_name, encoding: 'UTF-8').map {|i| i.chomp}

    hash = {
      title: array[0],
      genre: array[1],
      author: array[2],
      price: array[3].to_i,
      amount: array[4].to_i}
    hash
  end
end