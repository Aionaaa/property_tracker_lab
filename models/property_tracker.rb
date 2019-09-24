require('pg')

class Property

  attr_accessor :address, :no_of_bedrooms, :year_built, :buy_or_let
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @address = options['address']
    @no_of_bedrooms = options['no_of_bedrooms'].to_i()
    @year_built = options['year_built'].to_i()
    @buy_or_let = options['buy_or_let']
  end










end
