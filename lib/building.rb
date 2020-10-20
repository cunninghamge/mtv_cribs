class Building
  attr_reader :units, :renters

  def initialize
    @units = []
    @renters = []
  end

  def add_unit(unit)
    @units << unit
  end

  def renters
    @renters = @units.map do |unit|
      unit.renter.name
    end
  end

  def average_rent
    total = @units.sum do |unit|
      unit.monthly_rent
    end
    total.to_f / @units.count
  end
end
