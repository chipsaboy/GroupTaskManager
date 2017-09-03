Rails.application.routes.draw do
  resources :lists do
    resources :tasks
  end
  resources :tasks, only: [:index]
  get '/tasks/updated_tasks', to: 'tasks#updated_tasks'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root 'home#index'
end
