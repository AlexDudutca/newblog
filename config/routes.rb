Rails.application.routes.draw do
  #get 'gifts/index'
  #get 'gifts/create'
  resources :gifts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
