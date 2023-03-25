Rails.application.routes.draw do

    get 'customers/my_page' => 'public/customers#show'
    get 'customers/information/edit' => 'public/customers#edit'
    get 'customers/unsubscribe' => 'public/customers#unsubscribe'

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
