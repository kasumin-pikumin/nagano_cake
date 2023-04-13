Rails.application.routes.draw do

    get 'orders/new' => 'public/orders#new'
    post 'orders/confirm' => 'public/orders#confirm'
    get 'orders/complete' => 'public/orders#complete'
    post 'orders' => 'public/orders#create'
    get 'orders' => 'public/orders#index' ,as: 'index_orders'
    get 'orders/:id' => 'public/orders#show' ,as: 'show_order'


    get 'cart_items' =>'public/cart_items#index'
    post 'cart_items' =>'public/cart_items#create'
    patch 'cart_items/:id' => 'public/cart_items#update'
    delete  'cart_items/destroy_all' => 'public/cart_items#destroy_all' ,as: 'destroy_all_cart_items'
    delete 'cart_items/:id' => 'public/cart_items#destroy',as: 'destroy_cart_items'


    get 'items' => 'public/items#index'
    get 'items/:id' =>'public/items#show', as: 'show_items'

    get 'addresses' => 'public/addresses#index'
    post 'addresses' => 'public/addresses#create', as: 'create_address'
    get 'addresses/:id/edit' => 'public/addresses#edit', as: 'edit_address'
    delete 'addresses/:id' => 'public/addresses#destroy',as: 'destroy_address'
    patch  'addresses/:id' => 'public/addresses#update',as: 'update_address'

    get 'customers/my_page' => 'public/customers#show'
    get 'customers/information/edit' => 'public/customers#edit'
    patch 'customers/information' => 'public/customers#update'
    get 'customers/unsubscribe' => 'public/customers#unsubscribe'
    patch 'customers/withdraw' => 'public/customers#withdraw'

  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root 'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :update, :new, :create]

  end

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }



  root to: "public/homes#top"
  get 'about' => 'public/homes#about'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
