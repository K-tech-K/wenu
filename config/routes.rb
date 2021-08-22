Rails.application.routes.draw do
  get 'toppages/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # root
  root to: "toppages#index"
  
  # ログイン用ルーティング
   get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  # Userモデルルーティング
  get "signup", to: "users#new"
  resources :users, except: [:new,:index]
  
end
