Rails.application.routes.draw do

  resources :pictures
  match "home", to: "index#home", :via => 'get'
  match "blog", to: "index#blog", :via => 'get'
  match "gallery", to: "index#gallery", :via => 'get'
  match "about", to: "index#about", :via => 'get'
  match "contact", to: "index#contact", :via => 'get'
  match "winners", to: "index#winners", :via => 'get'

  match "home", to: "index#home", :via => 'post'
  match "blog", to: "index#blog", :via => 'post'
  match "gallery", to: "index#gallery", :via => 'post'
  match "about", to: "index#about", :via => 'post'
  match "contact", to: "index#contact", :via => 'post'
  match "winners", to: "index#winners", :via => 'post'
  
  get 'blog/:id', to: 'posts#show', as: 'postlink'
  get 'gallery/:id', to: 'collections#show', as: 'collectionlink'
  

  resources :collections  do
      resources :images 
  end

  resources :posts do
      resources :contents     
  end

  resources :sliders
  devise_for :users

  root 'index#home'

  #get 'form', to: 'messages#new', as: 'form'
  #post 'form', to: 'messages#create'
  post 'contact', to: 'messages#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
