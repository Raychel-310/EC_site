Rails.application.routes.draw do
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
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
    root to: 'homes#top'
    get "customers/mypage" => "customers#show"
    get "customers/information/edit" => "customers#edit"
    patch "customers/information" => "customers#update"
    get "customers/check" => "customers#check"
    patch "customers/leave" => "customers#leave"
  end

  namespace :admin do
    root to: 'homes#top'
    resources :customers
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
