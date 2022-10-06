Rails.application.routes.draw do
  get 'product/create'
  namespace :admin do
    resources :category
    resources :product
    resources :subcategory, :only => [:new, :create, :show]
  end
  devise_for :users, :controllers => {:registrations => "users/registrations", :sessions => "users/sessions"}
  
  get 'shoppingcart/:id' => "shoppingcart#show", as: "cart"
  delete 'shoppingcart/:id' => "shoppingcart#destroy"

  root 'home#index'
  get 'admin/create_category', to: 'admin#create_category'
  get 'admin/create_product', to: 'admin#create_product'
  get 'cart_item/:id/add' => "cart_item#add_quantity", as: "cart_item_add"
  get 'cart_item/:id/reduce' => "cart_item#reduce_quantity", as: "cart_item_reduce"
  post 'cart_item' => "cart_item#create"
  get 'cart_item/:id' => "cart_item#show"
  delete 'cart_item/:id' => "cart_item#destroy"

  get 'shoppingcart' => "shoppingcart#show"
  resources :home
  resources :order
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
