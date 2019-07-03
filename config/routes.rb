Rails.application.routes.draw do
  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true
    end
  end

  root 'tests#index'
end
