Monroe::Application.routes.draw do
  root :to => "home#index"
  match '/home/:action' => "home#:action", via: :get
  get '/angular-directives'=> 'home#angular_directives'
  get '/search' => 'search#inedex', as: :search
  get '/properties' => 'properties#index'
  get '/properties/area/:id' => 'properties#area'
end
