require 'spec_helper'
describe AdministrationController do 
	it 'responds to index' do 
		get :index
		test_response 'index'
	end
	describe 'listing management' do 
		it 'responds to update_listings' do
			get :update_listings
			test_response :update_listings
		end	
		it 'update_listings' do
			ListingsManager.stub :update_listings 
			ListingsManager.should receive(:update_listings)
			get :update_listings
		end
	end
end

def test_response action
	expect(response.code).to eq '200'
	expect(response).to render_template action
end