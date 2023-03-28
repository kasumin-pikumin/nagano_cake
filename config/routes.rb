Rails.application.routes.draw do

    get 'addresses' => 'public/addresses#index'
    get 'addresses/:id/edit' => 'public/addresses#edit', as: 'edit_address'
    post 'addresses' => 'public/addresses#create'
    delete 'addresses/:id' => 'public/addresses#destroy',as: 'destroy_address'

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
    resources :customers, only: [:index, :show, :edit]
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
