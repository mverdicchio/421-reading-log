Rails.application.routes.draw do
  resources :students
  resources :movies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  
  root "students#index"

  resources :entries
  
  
end
