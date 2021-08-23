  Rails.application.routes.draw do
    devise_for :users
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root "posts#index"

    resources :posts do
     resources :comments do
      resources :replies
     end
    end
    #get "signup", to: "users#new"
    #get "login", to: "sessions#new"
    #get '/sign_out', to: 'users#sign_up'
    #post "login", to: "sessions#create" 
    #resources :users, except: [:new]
  end
