module PropertyManager
  include Repo
  REPOSITORY = Repo
  def self.all_areas
    areas = []
    properties = all_properties
    properties.each do |p|
      areas << p.area
    end
    areas.uniq
  end
  def self.all
    self.all_properties
  end
  def self.for_sale
    REPOSITORY.for_sale
  end
  def self.for_rent
    REPOSITORY.for_rent
  end
 
  def self.new_dev area
    props = all_properties.select{|p| p.area == area}
    props.sort_by { |p| p.year_built }
  end
 
  def self.over_500k area
    all_properties.select{|p| p.price > 500000 && p.area == area}
  end
 
  def self.for_sale area
    all_properties.select{|p| p.area == area}
  end
 
  def self.featured_properties
    REPOSITORY.featured_properties
  end

  private
  def self.all_properties
    REPOSITORY.for_sale
  end

end 