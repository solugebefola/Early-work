Rails.application.routes.draw do
  resources :cats

  resources :users, only: [:create, :new]

  resources :cat_rental_requests do
    member do
      get 'approve'
      get 'deny'
    end
  end
end
