# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'sessions/new', to: 'sessions#new'
  
  root 'static_pages#home'
  
  controller :static_pages do
    get '/home', to: 'static_pages#home'
    get '/help', to: 'static_pages#help'
    get '/about', to: 'static_pages#about'
    get '/contact', to: 'static_pages#contact'
  end
  
  
  controller :sessions do
    get    '/login',   to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'
  end
  
  controller :users do
    resources :users
  end
  
  controller :microposts do
    resources :microposts,only:[:create, :destroy]
  end
  
end
