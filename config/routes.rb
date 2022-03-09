Rails.application.routes.draw do
  get 'reservations/index'
  get 'reservations/show'
  get 'reservations/confirm'
  get 'reservations/complete'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'events/new'
  get 'events/create'
  get 'events/index'
  get 'events/show'
  get 'homes/top'
  get 'homes/about'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
