class Property 

  include ActiveModel
  attr_accessor :id, :address, :mls, :area, :price, :pictures,
              :bedrooms, :bathrooms, :property_type,
              :approx_sqft, :tax, :description, :features,
              :location, :year_built
  def initialize(property = {}) 
    @id = property[:id]
    @address = property[:address]
    @mls = property[:mls]
    @city = property[:city]
    @price = property[:price]
    @pictures = property[:pictures]              
    @bedrooms = property[:bedrooms]
    @bathrooms = property[:bathrooms]
    @property_type = property[:property_type]              
    @approx_sqft = property[:approx_sqft]
    @tax = property[:tax]
    @description = property[:description]
    @features = property[:features]              
    @location = property[:location] 
    @area = property[:area]
    @year_built = property[:year_built]
  end

  def update
    
  end

end