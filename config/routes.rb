Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :tests do
    resources :questions, swallow: true
  end

  # resources :questions
end
