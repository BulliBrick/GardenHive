Rails.application.routes.draw do
  root 'articles#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  get 'change_password/:id', to: 'password#edit', as: 'edit_password'
  patch 'change_password/:id', to: 'password#update', as: 'update_password'

  get 'signup', to: 'users#new'

  resources :articles do
    resources :comments, only: [:create, :destroy]
  end
  resources :articles
  resources :themes
  resources :article_approvals, only: [:index, :show, :update]
  resources :users, only: [:index, :show, :edit, :update, :new, :create] do
    member do
      get :articles
      get :comments
    end
  end
end
