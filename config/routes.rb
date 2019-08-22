Rails.application.routes.draw do
  # get 'users/edit'
  # put 'users/edit'
  get 'users/index'
  devise_for :users
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
