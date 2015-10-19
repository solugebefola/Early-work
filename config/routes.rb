Rails.application.routes.draw do

  resources :users, only: [:index, :show, :create, :update, :destroy]
  resources :contacts, only: [:index, :show, :create, :update, :destroy]

  # get '/users/', to: 'users#index', as: 'users'
  # post '/users(.:format)', to: 'users#create'
  # get '/users/new(.:format)', to: 'users#new', as: 'new_user'
  # get '/users/:id/edit(.:format)', to: 'users#edit', as: 'edit_user'
  # get '/users/:id(.:format)', to: 'users#show', as: 'user'
  # patch '/users/:id(.:format)', to: 'users#update'
  # put '/users/:id(.:format)', to: 'users#update'
  # delete '/users/:id(.:format)', to: 'users#destroy'
end
