Rails.application.routes.draw do
  get 'admin' => 'admin#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users do
    resource :password, only: :update
  end

  resources :payment_types

  scope '(:locale)' do
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
  end

  resources :products do
    get :who_bought, on: :member
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
