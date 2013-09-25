class HomeController < ApplicationController
  def index
  	@featured_units = [
  		{price: '1,000,000', address: '123 Main str.', img: '/assets/1.jpg'},
  		{price: '3,000,000', address: '123 Main str.', img: '/assets/2.jpg'},
  		{price: '4,000,000', address: '123 Main str.', img: '/assets/3.jpg'},
  		{price: '12,000,000', address: '123 Main str.', img: '/assets/4.jpg'},
  		{price: '10,000,000', address: '123 Main str.', img: '/assets/5.jpg'}
	]
  	
  end
  def angular_directives

  end
end
