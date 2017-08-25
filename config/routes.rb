Rails.application.routes.draw do
  resources :tags
  resources :tasks
  resources :lists do
    resources :tasks
  end
  resources :tasks do
  	resources :tags
  end
  resources :tasks do
  	resources :users
  end
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
