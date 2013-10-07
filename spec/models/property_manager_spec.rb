require 'property_manager'

describe PropertyManager do
  before :each do 
    @repo = PropertyManager::REPOSITORY 
    @property = FactoryGirl.build_stubbed(:property)
  end
  describe 'ALL AREAS' do 
    it 'responds to all_areas' do 
      PropertyManager.should respond_to :all_areas
    end
    it 'it calls the repo' do 
      @repo.should_receive(:all).and_return([])
      PropertyManager.all_areas
    end
    it 'returns areas in the right format' do
      @repo.stub(:all).and_return [@property]
      PropertyManager.all_areas.should eql [@property.area]
    end
  end
  
  describe 'FEATURED PROPERTIES' do 
    it 'responds to featured properties' do 
      PropertyManager.should respond_to :featured_properties
    end
    it 'gets calls the repo' do 
      @repo.should_receive :featured_properties
      PropertyManager.featured_properties
    end

    it 'gets featured properties' do
      @repo.stub(:featured_properties).and_return ['']
      PropertyManager.featured_properties.count.should eql 1
    end
  end

end