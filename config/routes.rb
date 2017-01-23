BackboneTodo::Application.routes.draw do
  devise_for :users

  resources :todo_lists do 
    resources :tasks
  end

  root to: 'todo_lists#index'
  get '*path', to: 'todo_lists#index'

end
