Rails.application.routes.draw do

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users, only: [:index, :show, :new, :create, :edit, :update]
  resources :milestones, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :tasks, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :subtasks, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  resources :milestones do 
    resources :tasks, only: [:index, :show, :new, :create]
  end

  resources :tasks do 
    resources :subtasks, only: [:index, :show, :new, :create]
  end

  root 'application#index'

end
