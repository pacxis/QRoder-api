Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users,
    controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks'
    }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get 'logout' => 'devise/sessions#destroy'
    authenticated :user do
      root "products#index", as: :root
    end
    unauthenticated do
      root "devise/sessions#new", as: :unauthenticated_root
    end
  end
  resources :products
  resource :carts
  resources :orders
  resource :cust_sessions

  get 'carts/checkout', to: 'carts#checkout', as: 'CheckOut'
  get 'carts/history', to: 'carts#history', as: 'CheckOut_history'
  get 'carts/current', to: 'carts#current', as: 'current_orders'
  post 'orders/delete_all_orders', to: 'orders#delete_all_orders', as: 'delete_all_orders'
  get 'orders/mark_complete/:id', to: 'orders#mark_complete', as: 'mark_complete_orders'
  get 'carts/increase_quantity/:product_id', to: 'carts#increase_quantity', as: 'increase_quantity_carts'
  post 'sessions/create', to: 'sessions#create', as: 'create_user_session'
  post 'sessions/destroy', to: 'sessions#destroy', as: 'destroy_session'
  post 'sessions/new_user', to: 'sessions#new_user', as: 'new_user'
  # root to: 'products#index'
end
