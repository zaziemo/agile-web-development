Rails.application.routes.draw do
  resources :line_items do
    member do
      post 'decrement'
    end
  end

  resources :carts
  root 'store#index', as: 'store_index'

  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
