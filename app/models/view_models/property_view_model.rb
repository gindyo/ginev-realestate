module ViewModels::PropertyViewModel
  def self.home_page_view property
    check_if_property_and_return property, {
      price: property.price, address: property.address,
      picture: if property.pictures[0][0]== '/' then property.pictures[0] else 'http://www.realtimerental.com/rrv10/rentalphotos/15/'+property.pictures[0].to_s end,
      id: property.id
    }
  end
  def self.results_page_view property
    check_if_property_and_return property, [
      property.id,
      property.price,
      property.pictures[0],
      property.bedrooms, 
      property.bathrooms,
      property.address, 
    ]
  end
  def self.property_page_view property
    p = check_if_property_and_return property, {
          price: property.price,
          address: property.address,
          pictures: property.pictures,
          bedrooms: property.bedrooms,
          bathrooms: property.bathrooms,
          property_type: property.property_type, 
          approx_sqft: property.approx_sqft,
          tax: property.tax,
          description: property.description,
          features: property.features,
          location: property.location
        }
     p
  end
  private
    def self.check_if_property_and_return property, return_value
      if property.is_a? Property
        return return_value
      else
        raise Exception.new('Passed object is not a Proprety')
      end
    end
end