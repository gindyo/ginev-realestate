require 'view_models/property_view_model'
describe ViewModels::PropertyViewModel do
  before :each do
    @vm = ViewModels::PropertyViewModel
    @property = FactoryGirl.build_stubbed :property

  end
  
  describe 'HOME PAGE VIEW' do
    it 'responds to home_page_view' do 
      @vm.should respond_to :home_page_view
    end
    it 'returns a json object when passed a valid Property ' do 
      expected_values = {
        price: @property.price, 
        address: @property.address, 
        picture: @property.pictures[0]
      }.to_json
      check_if_it_returns_valid_json :home_page_view, expected_values
    end
    it 'raises exception when passed invalid object' do 
      check_for_exception :home_page_view
    end
  end

  describe 'RESULTS PAGE VIEW' do
    it 'responds to results page view' do 
      @vm.should respond_to :results_page_view
    end
    it 'returns a valid json object when passed a valid Property' do
        expected_values = {
          price: @property.price, 
          address: @property.address, 
          picture: @property.pictures[0],
          bedrooms: @property.bedrooms,
          bathrooms: @property.bathrooms
          }.to_json
      check_if_it_returns_valid_json :results_page_view, expected_values

    end
     it 'raises exception when passed invalid object' do 
      check_for_exception :results_page_view
    end
  end

  describe 'PPROPERTY PAGE VIEW' do
    it 'responds to property page view' do 
      @vm.should respond_to :property_page_view
    end
    it 'returns a valid json object when passed a valid Property' do
      expected_values ={
          price: @property.price,
          address: @property.address,
          pictures: @property.pictures,
          bedrooms: @property.bedrooms,
          bathrooms: @property.bathrooms,
          property_type: @property.property_type, 
          approx_sqft: @property.approx_sqft,
          tax: @property.tax,
          description: @property.description,
          features: @property.features,
          location: @property.location

        }.to_json
      check_if_it_returns_valid_json :property_page_view, expected_values
    end
     it 'raises exception when passed invalid object' do 
      check_for_exception :results_page_view
    end
  end

  #helper methods
  private
    def check_for_exception method
      expect {@vm.send(method, Object.new)}.to raise_error
    end
    def check_if_it_returns_valid_json method, values
      @vm.send(method, @property).should eql values
    end
end