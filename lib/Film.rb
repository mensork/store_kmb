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
end