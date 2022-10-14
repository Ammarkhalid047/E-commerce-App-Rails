Rails.application.routes.draw do

  namespace :admin do
    resources :category
    resources :product
    resources :subcategory, :only => [:new, :create, :show]
    resources :order
    resources :promo do
      member do
        get :check_promo
      end
    end
  end

  resources :category, :only => [:show] do
    member do
      get :get_products
    end
  end
  
    resources :product, :only => [:show]
    resources :subcategory, :only => [:show]
    resources :home , :only => [:index]
    resources :order
    resources :review

  devise_for :users, :controllers => {:registrations => "users/registrations", :sessions => "users/sessions"}
  
  get 'shoppingcart/:id' => "shoppingcart#show", as: "cart"
  delete 'shoppingcart/:id' => "shoppingcart#destroy"

  root 'home#index'
  get 'cart_item/:id/add' => "cart_item#add_quantity", as: "cart_item_add"
  get 'cart_item/:id/reduce' => "cart_item#reduce_quantity", as: "cart_item_reduce"
  post 'cart_item' => "cart_item#create"
  get 'cart_item/:id' => "cart_item#show"
  delete 'cart_item/:id' => "cart_item#destroy"

  put '/review/:id/like', to: 'review#like', as: 'like'
  get 'shoppingcart' => "shoppingcart#show"
  
end
