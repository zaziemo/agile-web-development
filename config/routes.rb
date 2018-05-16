Rails.application.routes.draw do
  resources :users
  resources :payment_types
  resources :orders do
    member do
      post 'ship'
    end
  end

  resources :line_items do
    member do
      post 'decrement'
    end
  end

  resources :carts
  root 'store#index', as: 'store_index'

  resources :products do
    get :who_bought, on: :member
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
