Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # as :user do
  #   get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
  #   put 'users' => 'devise/registrations#update', :as => 'user_registration'
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
  resources :posts
  # get 'posts/:id' => 'posts#show'
  # get 'posts/new' => 'posts#new'
  # post 'posts' => 'posts#create'
  resources :products do
    get 'download'
  end
  # get 'products/new' => 'products#new'
  # post 'products' => 'products#create'
  # get 'products/download' => 'products#download'
  resources :users, only: [:show]
end
