Rails.application.routes.draw do
  resources :tracks do
    resources :notes, only: [:create, :destroy, :new, :edit, :update, :show]
  end
  resources :albums
  resources :bands
  resources :users
  resource :session, only: [:new, :create, :destroy]
end
