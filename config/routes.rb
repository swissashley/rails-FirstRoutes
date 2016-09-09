Rails.application.routes.draw do
  get '/users' => 'users#index'
  post '/users' => 'users#create'
  get '/users/new' => 'users#new'
  get '/users/:id/edit' => 'users#edit'
  get '/users/:id' => 'users#show'
  patch '/users/:id' => 'users#update'
  put '/users/:id' => 'users#update'
  delete '/users/:id' => 'users#destroy'

  # resources :users
  resources :contact_shares, only: [:create, :destroy]

  # get '/users/:id/contacts' => 'contacts#index'
  # get '/users/:id/contacts/:id' => 'contacts#show'
  resources :users, :only => [:show] do
    resources :contacts, :only => [:index]
  end
end
