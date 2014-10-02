Rails.application.routes.draw do
  resources :tracks
  resources :albums
  resources :bands
  resources :users, only: [:create, :new, :edit, :update, :destroy]
  resource :session, only: [:new, :create, :destroy]
end
