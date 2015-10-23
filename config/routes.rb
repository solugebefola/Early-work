Rails.application.routes.draw do

  root to: redirect("session/new")

  resources :users

  resource :session

  resources :subs do
    resources :posts, only: [:new]
  end

  resources :posts, except: [:index]


end
