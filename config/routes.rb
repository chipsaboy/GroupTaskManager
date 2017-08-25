Rails.application.routes.draw do
  resources :tags
  resources :tasks
  resources :lists
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
