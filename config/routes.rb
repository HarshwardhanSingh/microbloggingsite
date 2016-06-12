Rails.application.routes.draw do
  devise_for :users

  resources :tweets do
    resources :replies, only: [:create,:destroy]
  end

  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'
  get '/:username', to: 'pages#userpage', as: 'userpage'
  root to: "pages#welcome"
end
