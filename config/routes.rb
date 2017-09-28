Rails.application.routes.draw do
  root 'landing#index'
  devise_for :users
  resource :profile
  resources :users, only: [:show, :update], controller: :profiles
  resources :photos do
    resources :comments
  end
  
  get '/feed' => 'feed#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
