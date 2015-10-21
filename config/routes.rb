Rails.application.routes.draw do
  resources :cats

  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:create, :new, :show]

  resources :cat_rental_requests do
    member do
      get 'approve'
      get 'deny'
    end
  end
end
