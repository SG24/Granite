Rails.application.routes.draw do
  # get '/tasks', to: 'tasks#index'
  # get '/tasks/new', to: 'tasks#new'
  # post '/tasks', to: 'tasks#create'
  # get '/tasks/:id', to: 'tasks#show', as: 'task'
  # get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'
  # patch '/tasks/:id', to: 'tasks#update'
  # delete '/tasks/:id', to: 'tasks#destroy'
  root to: 'tasks#index'
  resources :users, only: %i[new create]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :tasks do
    resources :status, only: %i[update]
    resources :comments, only: %i[create]
  end
end
