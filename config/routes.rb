Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  resources :branches
  resources :branch_employees, only: %i[new create]
end
