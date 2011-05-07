Artgallery::Application.routes.draw do
  resources :exhibitions
  devise_for :users
  resources :tours
  resources :admin
  resources :arts
  match '/addart', :to=> 'arts#new'
  match '/manage', :to=> 'admin#manage'
  match '/editart', :to=> 'arts#edit'
  match '/tours', :to=> 'tours#index'
  match '/manage/changepass', :to=> 'admin#changepass'
  match '/manage/create', :to=> 'admin#create'



  get "home/index"

  match 'search' => 'artworks#search'

  resources :artworks

  match 'category' => 'collections#category'
  match 'artists' => 'collections#artists'
  match 'donors' => 'collections#donors'
  match 'locations' => 'collections#locations'
  
  root :to => "collections#index"
end
