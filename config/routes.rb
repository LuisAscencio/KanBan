Rails.application.routes.draw do

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/complete' => 'subtasks#complete'


  resources :users, only: [:index, :show, :new, :create, :edit, :update]
  resources :milestones, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :tasks, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :subtasks, only: [:index, :show, :new, :create, :edit, :update, :destroy, :complete]

  resources :milestones do 
    resources :tasks
  end

  resources :tasks do 
    resources :subtasks do
      patch :complete
    end
  end

  root 'application#index'

end
