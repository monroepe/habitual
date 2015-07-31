Rails.application.routes.draw do
  devise_for :users

  root to: 'welcome#index'

  resources :users, only: [] do
    resources :habits
  end
end
