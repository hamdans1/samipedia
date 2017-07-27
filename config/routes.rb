Rails.application.routes.draw do
  devise_for :users
  
  get 'welcome/index'
  
  resources :collaborators
  
  resources :wikis do
    resources :collaborators, only: [:new, :create, :destroy]
  end
  
  resources :charges, only: [:new, :create, :destroy]
  
  root "welcome#index"

end
