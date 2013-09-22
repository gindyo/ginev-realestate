Monroe::Application.routes.draw do
  root :to => "home#index"
  get '/angular-directives'=> 'home#angular_directives'
end
