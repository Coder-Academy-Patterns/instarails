Rails.application.routes.draw do
  root 'landing#index'
  devise_for :users
  resource :profile
  resources :photos do
    resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
