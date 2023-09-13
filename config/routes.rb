Rails.application.routes.draw do
  root 'landingpage#index'
  devise_for :users
  resources :groups do
    resources :bills
  end
  resources :users
  
end
