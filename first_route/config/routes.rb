Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get "/users", to: "users#index", as: "users"
  # post "/users", to: "users#create"
  # get "/users/new", to: "users#new", as: "new_user"
  # get "/users/:id/edit", to: "users#edit", as: "edit_user"
  # get "/users/:id", to: "users#show", as: "user"
  # patch "/users/:id", to: "users#update"
  # put "/users/:id", to: "users#update"
  # delete "/users/:id", to: "users#destroy"
  
  resources :users do
    resources :artworks, only: [:index]
  end
  resources :users, only: [:index, :create, :show, :update, :destroy]
  
  resources :artworks, only: [:index, :create, :show, :update, :destroy]


  # /artworks/:artwork_id/artwork_shares
  resources :artworks do 
    resources :artwork_shares, only: [:index]
  end
  # /artwork_shares
  resources :artwork_shares, only: [:index, :create, :destroy]

  resources :users do  
    resources :comments, only: [:index]
  end
  
  resources :artworks do  
    resources :comments, only: [:index]
  end
  resources :comments, only: [:index, :create, :destroy]  
end 

#question: do we need to delete any of these controller actions?

#/articles/101 = magazines/42/articles/101

