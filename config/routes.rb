Monroe::Application.routes.draw do
  root :to => "home#index"
  match '/home/:action' => "home#:action", via: :get
  get '/properties' => 'properties#index'
  get '/properties/all' => 'properties#all'
  get '/properties/for_rent' => 'properties#for_rent'
  get '/properties/for_sale' => 'properties#for_sale'
  get '/properties/:id' => 'properties#show'

#administration controller
  get '/administration' => 'administration#index'
  post '/administration/update_listings' => 'administration#update_listings'
end
