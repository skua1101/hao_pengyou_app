Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'devise/sessions',
    registrations: 'devise/registrations'
  }
  root to: "homes#top"
  get '/about' => 'homes#about'

  resources :users, only: [:show,:edit,:update]do
    resource :relationships, only: [:create, :destroy]
      get :follower, on: :member
      get :followed, on: :member
  end

  resources :events, only: [:new,:index,:show,:create, :update]

  resources :reservations, only: [:index,:show,:create, :destroy]do
   member do
      get 'confirm'
    end
   collection do
      get 'complete'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
