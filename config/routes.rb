Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#new'

  resources :users, only: [:new, :create, :update, :show] do
    member do
      get :start
      get :contact
      get :graduation
      get :complete
      get :duplicate
    end
  end
end
