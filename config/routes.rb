Rails.application.routes.draw do

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users, only: [:index, :show, :new, :create, :edit, :update]
  resources :milestones, only: [:index, :show, :new, :create, :edit, :update]
  resources :tasks, only: [:index, :show, :new, :create, :edit, :update]
  resources :subtasks, only: [:index, :show, :new, :create, :edit, :update]

  resources :milestones do 
    resources :tasks, only: [:index, :new, :create]
  end

  root 'milestones#index'

end
