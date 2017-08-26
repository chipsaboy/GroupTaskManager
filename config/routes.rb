Rails.application.routes.draw do
  resources :lists, except: :new do
    resources :tasks, only: [:create, :update, :destroy]
  end
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
