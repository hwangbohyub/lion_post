Rails.application.routes.draw do
  root 'home#main'
  get 'info',to: 'home#info'
  get 'main',to: 'home#main'

  devise_for :users
  resources :posts do
    resources :comments, only: [:create,:destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
