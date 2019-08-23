Rails.application.routes.draw do
  put 'lists/edit'
  post 'lists/create'
  resources :lists
  devise_for :users
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
