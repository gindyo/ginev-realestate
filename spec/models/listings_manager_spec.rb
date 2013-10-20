require 'spec_helper'
require 'csv'

def csv_file
	['','row1','row2']
end

def current_props
	
end

describe ListingsManager do
	it 'has updates listings method' do
		ListingsManager.should respond_to(:update_listings).with 1
	end
	
	it 'updates_listing' do 
		Property.stub(:find_or_create_by).and_return(FactoryGirl::build :property)
		Property.any_instance.stub :update
		Property.should receive(:find_or_create_by).exactly(3) 
		CSV.stub(:read).and_return csv_file
istingsManager.update_listings('filename')


def current_props
	
end
	end

end