Rails.application.routes.draw do
  devise_for :users

  resources :tweets do
    resources :replies, only: [:create,:destroy]
  end
  root to: "pages#welcome"
end
