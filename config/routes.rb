Rails.application.routes.draw do
  resources :inventar, only: [:index, :create, :destroy]
  resources :tranzactii, only: [:index, :create, :destroy]
  resources :angajati, only: [:index, :create, :destroy]
  resources :documente, only: [:index, :create, :destroy]
end
