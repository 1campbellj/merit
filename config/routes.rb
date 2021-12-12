Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :users do
    member do
      get :start
      get :contact
      get :graduation
      get :complete
    end
  end
end
