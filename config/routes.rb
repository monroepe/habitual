Rails.application.routes.draw do
  devise_for :users

  root to: 'welcome#index'

  resources :users, only: [] do
    resources :habits
  end

  resources :users, only: [] do
    resources :habit_instances
  end
end
