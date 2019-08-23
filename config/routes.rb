Rails.application.routes.draw do

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/complete' => 'subtasks#complete'
  get '/completed' => 'tasks#complete'
  get '/milestone-complete' => 'milestones#complete'


  resources :users, only: [:index, :show, :new, :create, :edit, :update]
  resources :milestones, only: [:index, :show, :new, :create, :edit, :update, :destroy, :complete]
  resources :tasks, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :subtasks, only: [:index, :show, :new, :create, :edit, :update, :destroy, :complete]

  resources :milestones do 
    resources :tasks do
      patch :complete
    end
  end

  resources :tasks do 
    resources :subtasks do
      patch :complete
    end
  end

  root 'application#index'

end
