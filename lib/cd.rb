class CD < Product
  attr_accessor :title, :author, :genre, :year, :price, :amount

  def initialize(params)
    super
    @title = params[:title]
    @author = params[:author]
    @genre = params[:genre]
    @year = params[:year]
  end

  def to_s
    "Альбом '#{title}'(#{year}) - #{author} , #{genre}. #{super}"
  end

  def update(params)
    super
    @title = params[:title] if params[:title]
    @author = params[:author] if params[:author]
    @genre = params[:genre] if params[:genre]
    @year = params[:year] if params[:year]
  end

  def self.from_file(file_name)
    self.new(set_param(file_name))
  end

  def self.set_param(file_name)
    array = File.readlines(file_name, encoding: 'UTF-8').map { |i| i.chomp }

    hash = {
      title: array[0],
      author: array[1],
      genre: array[2],
      year: array[3].to_i,
      price: array[4].to_i,
      amount: array[5].to_i}
    hash
  end

  def buy
    super
  end
end