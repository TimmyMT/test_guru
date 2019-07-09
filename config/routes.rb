Rails.application.routes.draw do



  get 'users/new'
  get :signup, to: 'users#new'

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
