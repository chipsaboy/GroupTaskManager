Rails.application.routes.draw do
  resources :lists do
    resources :tasks
  end
  resources :tasks, only: [:index]
  get '/tasks/recent', to: 'tasks#recent'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "users/registrations" }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root 'home#index'
end
