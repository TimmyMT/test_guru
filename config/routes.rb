Rails.application.routes.draw do
  root 'tests#index'

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :test_passages do #, only: [:show, :update]
    match 'result', to: 'test_passages#result', via: :get
  end

end
