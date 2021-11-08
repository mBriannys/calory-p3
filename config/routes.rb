Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :calories
  get 'calory/new', to:'calories#new'
  post 'calories', to: 'calories#create'
  get 'index', to: 'calories#index'
#  get 'calories/:id/edit', to: 'calories#edit', as: 'edit_calory'
#  patch 'calories', to: 'calories#update'
  get 'calories/:id/show', to: 'calories#show', as: 'show_calory'
  delete 'calory/:id', to: 'calories#destroy', as:'destroy_calory'
  get 'calory/search', to: 'calories#search'
  root 'home#home'
end
