class AdministrationController < ApplicationController
	include ListingsManager
	def index
			
	end
	def update_listings
		ListingsManager::update_listings 
	end
end