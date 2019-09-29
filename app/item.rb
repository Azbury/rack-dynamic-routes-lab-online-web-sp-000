class Item
  attr_accessor :name, :price
  @@all = []
  
  def initialize(name,price)
    @name = name
    @price = price
    @@all << self
  end

  def self.all
    @@all
  end

  def sell.item_names
    self.all.map {|item| item.name}
  end

end
