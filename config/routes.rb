Rails.application.routes.draw do
  namespace :public do
    get 'address/index'
    get 'address/edit'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    resources :items
    resources :cart_items
    resources :address
    root to: 'homes#top'
    get "items" => "items#index"
    get "items/:id" => "items#show"
    get "customers/mypage" => "customers#show"
    get "customers/information/edit" => "customers#edit"
    patch "customers/information" => "customers#update"
    get "customers/check" => "customers#check"
    patch "customers/leave" => "customers#leave"
    get "cart_items" => "cart_items#index"
    post "cart_items" => "cart_items#create"
    delete "cart_items" => "cart_items#destroy_all", as: "destroy_all"
    # get "address" => "address#index"
    # post "address" => "address#create"
    # get "address/:id/edit" => "address#edit"
    # patch "address/:id" => "address#update"
    # delete "address/:id" => "address#destroy"

  end

  namespace :admin do
    root to: 'homes#top'
    resources :customers
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items
    get "genres" => "genres#index"
    post "genres" => "genres#create"
    get "genres/:id/edit" => "genres#edit"
    patch "genres/:id" => "genres#update"
    get "admin/items" => "items#index"
    get "admin/items/new" => "items#new"
    post "admin/items" => "items#create"
    # get "admin/items/:id" => "items#show"
    # get "admin/items/:id/edit" => "items/edit"
    # patch "admin/items/:id" => "items/update"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
