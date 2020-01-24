Rails.application.routes.draw do
  resources :users
  resources :students
  resources :tests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
