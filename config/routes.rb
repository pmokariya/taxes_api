Rails.application.routes.draw do
  root 'items#index'
  resources :item_taxes
  resources :items do
    post :order , on: :collection
  end
  resources :item_categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
