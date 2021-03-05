Rails.application.routes.draw do
  Rails.application.routes.draw do
    root 'static#home'
    
    
    get '/recipes/search', to: 'recipes#search'
    get    '/signup', to: 'sessions#new'
    post	'/signup', to: 'sessions#create'
    get    '/login', to: 'users#new'
    post   '/login', to: 'users#create'
    get '/logout', to: 'sessions#destroy'
    
    
    
    
    resources :recipes do
      resources :recipes_ingredients
    end 
    resources :recipes do
      resources :ratings
    end 
    resources :ingredients 
    resources :users
    

   
  
    
    match '/auth/:google_oauth2/callback' => 'sessions#google' , via: [:get,:post]
    end 
 end 

