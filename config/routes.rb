Rails.application.routes.draw do

  devise_for :users
  
  devise_scope :user do 
    unauthenticated do 
      root 'devise/sessions#new', as: :unauthenticated_root
    end

    authenticated :user do 
      root 'static_pages#home', as: :authenticated_root
    end
  end

  resources :posts
  resources :activities
  
  match 'user/:id', :to => "user#show", :as => :user, :via => :get
end
