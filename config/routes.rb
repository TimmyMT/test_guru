Rails.application.routes.draw do

  resources :feedbacks
  resources :badges, only: :index

  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }, controllers: {
      sessions: 'users/sessions'}

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    root 'tests#index'
    resources :gists
    resources :badges
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, except: :index, shallow: true do
        resources :answers, except: :index, shallow: true
      end
    end
  end

end
