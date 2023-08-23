Rails.application.routes.draw do
  root to: 'customer/homes#top'
  # namespace :admin do
  #   get 'comments/destroy'
  # end
  # namespace :admin do
  #   get 'blogs/index'
  #   get 'blogs/show'
  #   get 'blogs/destroy'
  # end
  # namespace :admin do
  #   get 'customers/index'
  #   get 'customers/show'
  #   get 'customers/edit'
  #   get 'customers/update'
  # end
  devise_for :customers, controllers: {
    sessions:      'customer/sessions',
    passwords:     'customer/passwords',
    registrations: 'customer/registrations'
  }
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }
  
  # 管理者側ルーティング
  namespace :admin do
    get '/' => 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update] 
    resources :blogs, only: [:index, :show, :destroy] do
      resources :comments, only: [:destroy]
      collection do
        get 'customer_blogs'
      end
    end
  end
  
  # 会員側ルーティング
  scope module: :customer do
    # root to: "homes#top"
    resources :maps, only: [:index, :create]
    resources :customers, only: [:show, :edit, :update] do
      collection do
        get 'check_out'
        get 'withdraw'
        patch 'withdraw_update'
        # post '/guest_login', to: 'guest_sessions#create'
      end
    end
    resources :blogs do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy, :index]
      collection do
        get 'my_blogs'
      end
    end
    




    # Rails.application.routes.draw do
  # namespace :admin do
  #   get 'comments/destroy'
  # end
  # namespace :admin do
  #   get 'blogs/index'
  #   get 'blogs/show'
  #   get 'blogs/destroy'
  # end
  # namespace :admin do
  #   get 'customers/index'
  #   get 'customers/show'
  #   get 'customers/edit'
  #   get 'customers/update'
  # end
    #   # ... 他のルート
    resources :cafedates, only: [:create]

      
    
    devise_scope :customer do
      post 'customer/guest_sign_in', to: 'sessions#guest_sign_in'
    end
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

