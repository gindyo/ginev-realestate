Monroe::Application.routes.draw do
  root :to => "home#index"
  get '/angular-directives'=> 'home#angular_directives'
  get '/search' => 'search#inedex', as: :search
end
