Rails.application.routes.draw do
  resources :themes
  root to: 'pages#home'

  devise_for :users
  resources :profiles, only: [:new, :edit, :create, :update]
  resources :users, only: [:show]
  resources :events
  get "about" => "pages#about"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
