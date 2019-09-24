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

  def save()
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "
    INSERT INTO property_tracker
    (address, no_of_bedrooms, year_built, buy_or_let)
    VALUES
    ($1, $2, $3, $4)
    RETURNING *"
    values = [@address, @no_of_bedrooms, @year_built, @buy_or_let]
    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]["id"].to_i()
    db.close
  end

  def Property.all()
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "SELECT * FROM property_tracker"
    db.prepare("all", sql)
    properties = db.exec_prepared("all")
    db.close
    return properties.map{|property| Property.new(property)}
  end

  def delete_one()
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "DELETE FROM property_tracker WHERE id = $1"
    values = [@id]
    db.prepare("delete_one", sql)
    db.exec_prepared("delete_one", values)
    db.close
  end

  def Property.delete_all()
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "DELETE FROM property_tracker"
    db.prepare("delete_all", sql)
    db.exec_prepared("delete_all")
    db.close()
  end

  def update()
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql =
    "UPDATE property_tracker SET
    (address, no_of_bedrooms, year_built, buy_or_let)
    = ($1, $2, $3, $4) WHERE id = $5"
    values = [@address, @no_of_bedrooms, @year_built, @buy_or_let, @id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close()
  end

  def Property.find(target_id)
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql =
    "SELECT * FROM property_tracker WHERE id = $1"
    values = [target_id]
    db.prepare("find", sql)
    results = db.exec_prepared("find", values)
    db.close()
    return results.map{|property| Property.new(property)}
  end

  def Property.find_by_address(target_address)
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql =
    "SELECT * FROM property_tracker WHERE address = $1 LIMIT 1"
    values = [target_address]
    db.prepare("find_by_address", sql)
    results = db.exec_prepared("find_by_address", values)
    db.close()
    return results.map{|property| Property.new(property)}
  end














end
