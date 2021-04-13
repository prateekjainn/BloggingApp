Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  get 'comments/new'
  resources :articles do
    resources :likes, :comments
  end
#  root 'articles#index'
resources :sessions, only: [:new, :create, :destroy]
    get 'about', to: 'pages#about'
    get 'signup', to: 'users#new'
    resources :users, except: [:new]
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
 end