Rails.application.routes.draw do
  # put 'tasks/edit'
  # post 'tasks/create'
  # put 'lists/edit'
  # post 'lists/create'
  resources :lists do
    resources :tasks
  end
  devise_for :users
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
