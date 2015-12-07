Rails.application.routes.draw do
  

  get 'sessions/new'

  # get 'users/new' -- took this out since its included in the resources :users below

  # root 'static_pages#home' -- why is root with # and get with /
  # get 'static_pages/help'
  # get 'static_pages/about'

  root             'static_pages#home'
  get 'help' =>    'static_pages#help'
  get 'about' =>   'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup' =>  'users#new'
  get 'login'  =>  'sessions#new'
  post 'login' =>  'sessions#create'
  delete 'logout' => 'sessions#destroy'


  resources :users

  
  
end
