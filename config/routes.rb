Rails.application.routes.draw do
  get 'doses/new'
  get 'cocktails/new'
  get 'cocktails/show'
  get 'cocktails/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'cocktails#index'
  
  resources :cocktails, only: %i[show new create] do
    resources :doses, only: %i[new create]
  end
  resources :doses, only: [:destroy]
end
