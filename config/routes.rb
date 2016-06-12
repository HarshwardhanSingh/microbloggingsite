Rails.application.routes.draw do
  
  devise_for :users

  resources :tweets do
    resources :replies, only: [:create,:destroy]

    member do
      get 'like', to: 'tweets#like', as: 'like'
      get 'unlike', to: 'tweets#unlike', as: 'unlike'
    end
  end

  # DISPLAY USER DASHBOARD
  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'

  # FOLLOW USER ROUTE [REQUIRED PARAMETER=USERNAME]
  get '/:username/follow', to: 'pages#follow', as: 'follow_user'

  # UNFOLLOW USER ROUTE [REQUIRED PARAMETER=USERNAME]
  get '/:username/unfollow', to: 'pages#unfollow', as: 'unfollow_user'

  # DISPLAY USER FOLLOWERS [REQUIRED PARAMETER=USERNAME]
  get '/:username/followers', to: 'pages#followers', as: 'followers'

  # DISPLAY USER FOLLOWINGS [REQUIRED PARAMETER=USERNAME]
  get '/:username/followings', to: 'pages#followings', as: 'followings'

  # USERPAGE USER ROUTE [REQUIRED PARAMETER=USERNAME]
  get '/:username', to: 'pages#userpage', as: 'userpage'

  # ROOT PATH TO WELCOME PAGE
  root to: "pages#welcome"
  
end
