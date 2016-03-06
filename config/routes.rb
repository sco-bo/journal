Rails.application.routes.draw do
  root 'static_pages#home'

  get 'join' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  resources :users
end
