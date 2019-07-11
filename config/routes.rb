Rails.application.routes.draw do

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'

  resources :sessions, only: :create
  resources :users, only: :create

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  resources :tests do
    resources :questions, shallow: true do
      resources :answers, shallow: true
    end

    member do
      post :start
    end
  end

  root 'tests#index'
end
