Rails.application.routes.draw do

  devise_for :users
  
  devise_scope :user do 
    unauthenticated do 
      root 'devise/sessions#new', as: :unauthenticated_root
    end

    authenticated :user do 
      root 'posts#index', as: :authenticated_root
    end
  end

  resources :posts

  match 'user/:id', :to => "user#show", :as => :user, :via => :get
end
