Rails.application.routes.draw do
  root to: 'customer/homes#top'

  devise_for :customers, controllers: {
    sessions:      'customer/sessions',
    registrations: 'customer/registrations'
  }
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions:      'admin/sessions',
  }

  # 管理者側ルーティング
  namespace :admin do
    get '/' => 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update] 
    resources :blogs, only: [:show, :destroy] do
      resources :comments, only: [:destroy]
      collection do
        get 'customer_blogs/:id', to: 'blogs#customer_blogs', as: :customer_blogs
      end
    end
  end

  # 会員側ルーティング
  scope module: :customer do
    get '/about' => 'homes#about'
    resources :maps, only: [:index, :create]
    resources :customers, only: [:show, :edit, :update] do
      collection do
        get 'check_out'
        get 'withdraw'
        patch 'withdraw_update'
        # post '/guest_login', to: 'guest_sessions#create'
      end
    end
    resources :cafedates, only: [:show, :index, :create, :edit, :destroy, :update]
    resources :blogs do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy, :index]
      collection do
        get 'my_blogs'
      end
    end
    devise_scope :customer do
      post 'customer/guest_sign_in', to: 'sessions#guest_sign_in'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

