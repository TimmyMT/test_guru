Rails.application.routes.draw do
  resources :tests do
    resources :questions, shallow: true do
      resources :answers, shallow: true
    end
  end

  root 'tests#index'
end
