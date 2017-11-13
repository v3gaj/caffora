Rails.application.routes.draw do

  resources :pictures
  match "home", to: "index#home", :via => 'get'
  match "blog", to: "index#blog", :via => 'get'
  match "gallery", to: "index#gallery", :via => 'get'
  match "about", to: "index#about", :via => 'get'
  match "contact", to: "index#contact", :via => 'get'
  match "winners", to: "index#winners", :via => 'get'
  match "maintenance", to: "index#maintenance", :via => 'get'

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

  #Froala editor

  post '/upload_image' => 'upload#upload_image', :as => :froala_upload_image
  post '/delete_image' => 'upload#delete_image', :as => :froala_delete_image
  post '/upload_file' => 'upload#upload_file', :as => :froala_upload_file
  post '/delete_file' => 'upload#delete_file', :as => :froala_delete_file


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
