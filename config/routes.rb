Rails.application.routes.draw do
  namespace :admin do
    resource :items, only: [:index, :new, :create, :show, :edit]

  end
  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  root to: "public/homes#top"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
