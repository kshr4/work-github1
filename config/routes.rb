Rails.application.routes.draw do
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  devise_for :customers, controllers: {
    registrations: "public/registrations",#登録
    sessions: 'public/sessions'#ログイン
  }

  devise_for :admins, controllers: {
    sessions: "admin/sessions"#ログイン
  }
  scope module: :public do
    root controller: :homes, action: :top
    get :about, controller: :homes, action: :about
    resources :items, only: [:index, :show]
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw'
    resources :cart_items, only: [:index, :update, :destroy, :create] do
      collection do
        delete :destroy_all
      end
    end
    # delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all'
    resources :orders, only: %i(new create index show) do
      collection do
        post :confirm
        get :complete
      end
    end
    #post 'orders/confirm' => 'orders#confirm', as: 'confirm'
    #get 'orders/complete' => 'orders#complete', as: 'complete'
  end

  namespace :admin do
    root "homes#top"
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only: [:show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
