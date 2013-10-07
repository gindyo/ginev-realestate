FactoryGirl.define do 
  factory :property, class: Property do 
    id 1
    address 'main str'
    mls '2143'
    area 'Brigantine'
    price 3452345
    pictures ['pic1', 'pic2']
    bedrooms 3
    bathrooms 2
    property_type 'condo' 
    approx_sqft 2334
    tax 231234
    description 'this is description' 
    features ['feat1', 'feat2']
    location latitude: 234, longitude: 1234
    year_built 2011
  end
end