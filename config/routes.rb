Rails.application.routes.draw do

  get 'errors/not_found'
  namespace :seller do
    resources :product
    resources :shop
  end

  namespace :admin do
    resources :category
    resources :subcategory do
      member do
        get :check_promo
        get :promocode
      end
    end
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
  
    resources :product, :only => [:show] do
      member do
        get :search
      end
    end
    resources :subcategory, :only => [:show]
    resources :home , :only => [:index]
    resources :order do
      member do
        get :authentication
      end
    end
    resources :review
    resources :authentication

  devise_for :users, :controllers => {:registrations => "users/registrations", :sessions => "users/sessions", omniauth_callbacks: 'users/omniauth_callbacks'}
  
  get 'shoppingcart/:id' => "shoppingcart#show", as: "cart"
  delete 'shoppingcart/:id' => "shoppingcart#destroy"

  root 'home#index' 
  get 'cart_item/:id/add' => "cart_item#add_quantity", as: "cart_item_add"
  get 'cart_item/:id/reduce' => "cart_item#reduce_quantity", as: "cart_item_reduce"
  post 'cart_item' => "cart_item#create"
  get 'cart_item/:id' => "cart_item#show"
  delete 'cart_item/:id' => "cart_item#destroy"
  post 'seller/promo/add_product' => "seller/promo#add_product"

  put '/review/:id/like', to: 'review#like', as: 'like'
  get 'shoppingcart' => "shoppingcart#show"


  
  
  
end
