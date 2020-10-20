class Building
  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def renters
    rented_units.map do |unit|
      unit.renter.name
    end
  end

  def average_rent
    total = @units.sum do |unit|
      unit.monthly_rent
    end
    total.to_f / @units.count
  end

  def rented_units
    @units.select do |unit|
      unit.renter != nil
    end
  end

  def renter_with_highest_rent
    highest = rented_units.max_by do |unit|
      unit.monthly_rent
    end
    highest.renter
  end

  def units_by_number_of_bedrooms
    bedrooms = Hash.new {|h,k| h[k] = []}
    @units.each do |unit|
      bedrooms[unit.bedrooms] << unit.number
    end
    bedrooms
  end

  def annual_breakdown
    rented_units.each_with_object({}) do |unit, hash_obj|
      hash_obj[unit.renter.name] = (unit.monthly_rent * 12)
    end
  end

  def rooms_by_renter
    rented_units.each_with_object({}) do |unit, hash_obj|
      hash_obj[unit.renter] = {bathrooms: unit.bathrooms, bedrooms: unit.bedrooms}
    end
  end
end
