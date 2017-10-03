class Film < Product
  attr_accessor :title, :director, :year

  def initialize(params)
    super
    @title = params[:title]
    @director = params[:director]
    @year = params[:year]
  end

  def to_s
    "Фильм '#{title}'(#{year}), режиссёр - #{director}. #{super}"
  end

  def update(params)
    super
    @title = params[:title] if params[:title]
    @director = params[:director] if params[:director]
    @year = params[:year] if params[:year]
  end

  def self.from_file(file_name)
    self.new(set_param(file_name))
  end

  def self.set_param(file_name)
    array = File.readlines(file_name, 'r:UTF-8').map { |i| i.chomp }

    hash = {
      title: array[0],
      director: array[1],
      year: array[2],
      price: array[3].to_i,
      amount: array[4].to_i}
    hash
  end
end