Rails.application.routes.draw do
  resources :lists do
    resources :tasks do
      member do
        put :complete, to: 'tasks#complete_task'
      end
    end
  end
  resources :tasks, only: [:my_tasks]
  get '/tasks', to: 'tasks#my_tasks'
  get '/tasks/overdue', to: 'tasks#overdue'
  get '/tasks/completed', to: 'tasks#completed'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "users/registrations" }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root 'home#index'
end
