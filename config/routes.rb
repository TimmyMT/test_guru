Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  # get :signup, to: 'users#new'
  # get :login, to: 'sessions#new'
  # delete :signout, to: 'sessions#destroy'
  #
  # resources :sessions, only: [:create, :destroy]
  # resources :users, only: :create

  resources :tests do
    resources :questions, shallow: true do
      resources :answers, shallow: true
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

end
