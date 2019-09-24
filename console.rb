require('pry')
require_relative('models/property_tracker.rb')

property1 = Property.new({
  "address" => "10 Downing Street",
  "no_of_bedrooms" => 6,
  "year_built" => 1684,
  "buy_or_let" => "let"
  })

  property1.save()

  property2 = Property.new({
    "address" => "Buckingham Palace",
    "no_of_bedrooms" => 240,
    "year_built" => 1703,
    "buy_or_let" => "buy"
    })

    property2.save()

    properties = Property.all()

    binding.pry
    nil
