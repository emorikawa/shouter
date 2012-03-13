Shouter::Application.routes.draw do
  root to: "welcome#index"
  resource :dashboard, only: [:show]
  resource :search, only: [:show]
  resources :users, only: [:show] do
    #Instead of /following_relationships
    # It gives you users/:user_id/following_relationships
    resources :following_relationships, only: [:create]
  end
  resources :shouts, only: [:show]
  resources :text_shouts, only: [:create]
  resources :photo_shouts, only: [:create]
end
